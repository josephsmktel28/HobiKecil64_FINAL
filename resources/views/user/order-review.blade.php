@extends('layouts.app')

@section('content')
<main class="pt-90" style="padding-top: 0px;">
    <div class="mb-4 pb-4"></div>
    <section class="my-account container">
        <h2 class="page-title">Beri Ulasan Pesanan #{{ $order->id }}</h2>
        <div class="row">
            <div class="col-lg-2">
                @include('user.account-nav')
            </div>

            <div class="col-lg-10">
                @if (Session::has('status'))
                    <div class="alert alert-success">{{ Session::get('status') }}</div>
                @endif
                @if (Session::has('error'))
                    <div class="alert alert-danger">{{ Session::get('error') }}</div>
                @endif

                <div class="wg-box mb-4">
                    <h5>Daftar Produk yang Dibeli</h5>
                    <p class="text-muted">Silakan beri penilaian dan ulasan untuk masing-class produk di bawah ini.</p>
                </div>

                @foreach($order->orderItems as $item)
                    @php
                        $hasReviewed = \App\Models\Review::where('user_id', Auth::id())
                                        ->where('product_id', $item->product_id)
                                        ->exists();
                    @endphp
                    <div class="wg-box mb-4 p-4 border rounded">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                @if($item->product && $item->product->image)
                                    <img src="{{ asset('uploads/products/thumbnails') }}/{{ $item->product->image }}" alt="{{ $item->product->name }}" class="img-fluid rounded">
                                @else
                                    <img src="https://via.placeholder.com/150" class="img-fluid rounded" alt="No image">
                                @endif
                            </div>
                            <div class="col-md-10">
                                <h6>
                                    <a href="{{ route('shop.product.details', ['product_slug' => $item->product->slug ?? '']) }}" target="_blank">
                                        {{ $item->product->name ?? 'Produk Tidak Ditemukan' }}
                                    </a>
                                </h6>
                                <p class="text-muted mb-2">Harga: Rp {{ number_format($item->price, 0, ',', '.') }} x {{ $item->quantity }}</p>

                                @if($hasReviewed)
                                    <div class="alert alert-info py-2 mb-0">
                                        <i class="fa fa-check-circle"></i> Anda sudah memberikan ulasan untuk produk ini.
                                    </div>
                                @else
                                    <form action="{{ route('shop.review.store', ['product_id' => $item->product_id]) }}" method="POST" class="mt-3">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-4 mb-3">
                                                <label class="form-label">Rating *</label>
                                                <select name="rating" class="form-select form-control" required>
                                                    <option value="">Pilih Rating...</option>
                                                    <option value="5">5 Bintang - Sangat Bagus</option>
                                                    <option value="4">4 Bintang - Bagus</option>
                                                    <option value="3">3 Bintang - Cukup</option>
                                                    <option value="2">2 Bintang - Kurang</option>
                                                    <option value="1">1 Bintang - Sangat Kurang</option>
                                                </select>
                                            </div>
                                            <div class="col-md-8 mb-3">
                                                <label class="form-label">Komentar</label>
                                                <textarea name="comment" class="form-control" rows="2" placeholder="Bagaimana kualitas produk ini?"></textarea>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-sm">Kirim Ulasan</button>
                                    </form>
                                @endif
                            </div>
                        </div>
                    </div>
                @endforeach
                
                <div class="mt-4">
                    <a href="{{ route('user.orders') }}" class="btn btn-secondary">Kembali ke Daftar Pesanan</a>
                </div>
            </div>
        </div>
    </section>
</main>
@endsection
