<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Review;
use App\Models\OrderItem;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    public function store(Request $request, $product_id)
    {
        $request->validate([
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string|max:1000',
        ]);

        $user_id = Auth::id();

        // Check if user has already reviewed this product
        $existingReview = Review::where('user_id', $user_id)
            ->where('product_id', $product_id)
            ->first();

        if ($existingReview) {
            return redirect()->back()->with('error', 'Anda sudah memberikan ulasan untuk produk ini.');
        }

        // Check if user has purchased the product and order is delivered
        $hasPurchased = OrderItem::where('product_id', $product_id)
            ->whereHas('order', function ($query) use ($user_id) {
                $query->where('user_id', $user_id)->where('status', 'delivered');
            })->exists();

        if (!$hasPurchased) {
            return redirect()->back()->with('error', 'Anda hanya dapat memberikan ulasan pada produk yang telah Anda beli dan pesanan telah selesai.');
        }

        Review::create([
            'user_id' => $user_id,
            'product_id' => $product_id,
            'rating' => $request->rating,
            'comment' => $request->comment,
        ]);

        return redirect()->back()->with('status', 'Terima kasih! Ulasan Anda telah berhasil disimpan.');
    }
}
