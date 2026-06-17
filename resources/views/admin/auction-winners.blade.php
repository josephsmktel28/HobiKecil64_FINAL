@extends('layouts.admin')
@section('content')
    <div class="main-content-inner">
        <div class="main-content-wrap">
            <div class="flex items-center flex-wrap justify-between gap20 mb-27">
                <h3>Pemenang Lelang</h3>
                <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                    <li>
                        <a href="{{ route('admin.index') }}">
                            <div class="text-tiny">Dashboard</div>
                        </a>
                    </li>
                    <li>
                        <i class="icon-chevron-right"></i>
                    </li>
                    <li>
                        <div class="text-tiny">Pemenang Lelang</div>
                    </li>
                </ul>
            </div>

            <div class="wg-box">
                <div class="wg-table table-all-user">
                    <div class="table-responsive">
                        @if (Session::has('status'))
                            <p class="alert alert-success">{{ Session::get('status') }}</p>
                        @endif
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Produk</th>
                                    <th>Pemenang</th>
                                    <th>Email</th>
                                    <th>Harga Menang</th>
                                    <th>Tanggal Menang</th>
                                    <th>Status Pembayaran</th>
                                    <th>Status Blacklist</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($winners as $winner)
                                    <tr>
                                        <td>{{ $winner->product?->name ?? 'Produk Dihapus' }}</td>
                                        <td>{{ $winner->user?->name ?? 'User Dihapus' }}</td>
                                        <td>{{ $winner->user?->email ?? '-' }}</td>
                                        <td>Rp {{ number_format($winner->bid?->bid_amount ?? 0, 0, ',', '.') }}</td>
                                        <td>{{ $winner->created_at->format('d M Y H:i') }}</td>
                                        <td>
                                            @if($winner->isPaid())
                                                <span class="badge bg-success">Sudah Dibayar</span>
                                            @else
                                                <span class="badge bg-danger">Belum Checkout</span>
                                            @endif
                                        </td>
                                        <td>
                                            @if($winner->user)
                                                @if($winner->user->is_blacklisted)
                                                    <span class="badge bg-danger">Blacklisted</span>
                                                @else
                                                    <span class="badge bg-success">Aman</span>
                                                @endif
                                            @else
                                                <span class="badge bg-secondary">User Dihapus</span>
                                            @endif
                                        </td>
                                        <td>
                                            @if($winner->user)
                                                <div class="list-icon-function">
                                                    <form action="{{ route('admin.user.blacklist', $winner->user->id) }}" method="POST">
                                                        @csrf
                                                        @method('PUT')
                                                        @if($winner->user->is_blacklisted)
                                                            <button type="submit" class="btn btn-sm btn-success text-white" style="background-color:#28a745;">
                                                                Hapus Blacklist
                                                            </button>
                                                        @elseif(!$winner->isPaid())
                                                            <button type="button" class="btn btn-sm btn-danger text-white blacklist-btn" style="background-color:#dc3545;">
                                                                Blacklist
                                                            </button>
                                                        @endif
                                                    </form>
                                                </div>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="divider"></div>
                <div class="flex items-center justify-between flex-wrap gap10 wgp-pagination">
                    {{ $winners->links('pagination::bootstrap-5') }}
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function() {
            $(document).on('click', '.blacklist-btn', function(e) {
                e.preventDefault();
                var form = $(this).closest('form');

                swal({
                    title: "Blacklist User?",
                    text: "User ini tidak akan bisa melakukan bid lelang atau belanja lagi!",
                    icon: "warning",
                    buttons: ["Batal", "Ya, Blacklist"],
                    dangerMode: true,
                }).then(function(willBlacklist) {
                    if (willBlacklist) {
                        form.submit();
                    }
                });
            });
        });
    </script>
@endpush
