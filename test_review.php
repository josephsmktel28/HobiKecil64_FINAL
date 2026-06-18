<?php

require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$orders = \App\Models\Order::where('status', 'delivered')->get();

echo "Orders with 'delivered' status:\n";
foreach($orders as $order) {
    echo "User ID: " . $order->user_id . ", Order ID: " . $order->id . "\n";
    $items = \App\Models\OrderItem::where('order_id', $order->id)->get();
    foreach($items as $item) {
        echo "  - Product ID: " . $item->product_id . "\n";
    }
}
