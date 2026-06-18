@extends('layouts.admin')
@section('content')
    <div class="main-content-inner">
        <div class="main-content-wrap">
            <div class="flex items-center flex-wrap justify-between gap20 mb-27">
                <h3>All Reviews</h3>
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
                        <div class="text-tiny">All Reviews</div>
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
                                    <th>ID</th>
                                    <th>Product</th>
                                    <th>User</th>
                                    <th>Rating</th>
                                    <th>Comment</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($reviews as $review)
                                    <tr>
                                        <td>{{ $review->id }}</td>
                                        <td>
                                            @if($review->product)
                                            <a href="{{ route('shop.product.details', ['product_slug' => $review->product->slug]) }}" target="_blank">
                                                {{ $review->product->name }}
                                            </a>
                                            @else
                                                Product Not Found
                                            @endif
                                        </td>
                                        <td>{{ $review->user ? $review->user->name : 'Unknown User' }}</td>
                                        <td>
                                            {{ $review->rating }} <i class="icon-star text-warning"></i>
                                        </td>
                                        <td>{{ $review->comment }}</td>
                                        <td>{{ $review->created_at }}</td>
                                        <td>
                                            <div class="list-icon-function">
                                                <form action="{{ route('admin.review.delete', $review->id) }}"
                                                    method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="button" class="item text-danger delete">
                                                        <i class="icon-trash-2"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="divider"></div>
                <div class="flex items-center justify-between flex-wrap gap10 wgp-pagination">
                    {{ $reviews->links('pagination::bootstrap-5') }}
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        $(document).ready(function() {
            $(document).on('click', '.delete', function(e) {
                e.preventDefault();
                var form = $(this).closest('form');

                swal({
                    title: "Apakah Anda yakin?",
                    text: "Ulasan ini akan dihapus permanen!",
                    icon: "warning",
                    buttons: ["Batal", "Hapus"],
                    dangerMode: true,
                }).then(function(willDelete) {
                    if (willDelete) {
                        form.submit();
                    }
                });
            });
        });
    </script>
@endpush
