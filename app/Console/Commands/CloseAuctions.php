<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Product;
use App\Models\AuctionWinner;
use App\Mail\AuctionWonMail;
use App\Services\SmsService;
use Carbon\Carbon;
use Surfsidemedia\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Schema;

class CloseAuctions extends Command
{
    protected $signature = 'auctions:close';
    protected $description = 'Finalize ended auctions and record winners';

    public function handle()
    {
        $now = Carbon::now();

        $products = Product::where('auction_enabled', 1)
            ->whereNotNull('auction_end')
            ->where('auction_end', '<=', $now)
            ->get();

        foreach ($products as $product) {
            // Skip if winner already recorded
            if (AuctionWinner::where('product_id', $product->id)->exists()) {
                continue;
            }

            $highestBid = $product->bids()->orderByDesc('bid_amount')->first();
            if (!$highestBid) {
                // No bids — skip or optionally notify admin
                continue;
            }

            $reservedUntil = Carbon::now()->addHours(48);

            $winner = AuctionWinner::create([
                'product_id' => $product->id,
                'user_id' => $highestBid->user_id,
                'bid_id' => $highestBid->id,
                'reserved_until' => $reservedUntil,
            ]);

            $this->info("Recorded winner for product {$product->id}: user {$highestBid->user_id}");

            $user = $highestBid->user;
            if ($user) {
                try {
                    Mail::to($user->email)->send(new AuctionWonMail($product, $highestBid, $reservedUntil));
                    $this->info("Sent auction won email to user {$user->id}");
                } catch (\Exception $e) {
                    $this->error('Failed to send auction won email: ' . $e->getMessage());
                }

                if ($user->mobile) {
                    try {
                        $message = "Selamat! Anda memenangkan lelang produk {$product->name} dengan harga Rp " . number_format($highestBid->bid_amount, 0, ',', '.') . ". Barang telah ditambahkan ke keranjang Anda.";
                        if (SmsService::send($user->mobile, $message)) {
                            $this->info("Sent auction won SMS to user {$user->id}");
                        } else {
                            $this->error("SMS not sent for user {$user->id}; Twilio config may be missing or invalid.");
                        }
                    } catch (\Exception $e) {
                        $this->error('Failed to send auction won SMS: ' . $e->getMessage());
                    }
                }
            }

            // The won product will be dynamically added to the user's cart when they visit the cart page.
        }

        return 0;
    }
}
