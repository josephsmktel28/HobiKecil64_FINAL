<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AuctionWinner extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id', 'user_id', 'bid_id', 'reserved_until'
    ];

    protected $casts = [
        'product_id' => 'integer',
        'user_id' => 'integer',
        'bid_id' => 'integer',
        'reserved_until' => 'datetime',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function user()
    {
        return $this->belongsTo(\App\Models\User::class);
    }

    public function bid()
    {
        return $this->belongsTo(Bid::class);
    }

    public function isPaid()
    {
        return \App\Models\OrderItem::where('product_id', $this->product_id)
            ->whereHas('order', function ($query) {
                $query->where('user_id', $this->user_id);
            })
            ->exists();
    }
}
