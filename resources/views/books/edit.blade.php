@extends('layouts.global')

@section('title')
Edit book
@endsection

@section('content')
<div class="row">
    <div class="col-md-8">

        @if(session('status'))
        <div class="alert alert-success">
            {{session('status')}}
        </div>
        @endif

        <!-- <form enctype="multipart/form-data" method="POST" action="{{route('books.update', [$book->id])}}" class="p-3 shadow-sm bg-white"> -->
        <form enctype="multipart/form-data" method="POST" action="{{route('books.update',[$book->id])}}" class="p-3 shadow-sm bg-white">
            @csrf
            <input type="hidden" name="_method" value="PUT">

            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" value="{{$book->title}}" name="title" placeholder="Book title">
            </div>

            <div class="form-group">
                <label for="cover">Cover</label><br>
                <small class="text-muted">Current cover</small><br>
                @if($book->cover)
                <img src="{{asset('storage/'. $book->cover)}}" width="96px" alt="">
                @endif
                <br><br>
                <input type="file" name="cover" id="cover" class="form-control">
                <small class="text-muted">Kosongkan jikan tidak ingin merubah cover</small>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea name="description" id="description" class="form-control">{{$book->description}}</textarea>
            </div>

            <div class="form-group">
                <label for="categories">Categories</label>
                <select name="categories[]" id="categories" class="form-control" multiple>
                    <option value=""></option>
                </select>
            </div>

            <div class="form-group">
                <label for="stock">Stock</label>
                <input type="text" class="form-control" value="{{$book->stock}}" name="stock" id="stock" placeholder="Stock">
            </div>

            <div class="form-group">
                <label for="author">Author</label>
                <input type="text" class="form-control" value="{{$book->author}}" name="author" id="author" placeholder="Author">
            </div>

            <div class="form-group">
                <label for="publisher">Publisher</label>
                <input type="text" class="form-control" name="publisher" id="publisher" value="{{$book->publisher}}">
            </div>

            <div class="form-group">
                <label for="price">Price</label>
                <input type="text" class="form-control" value="{{$book->price}}" name="price" id="price">
            </div>

            <div class="form-group">
                <label for="status">Status</label>
                <select name="status" id="status" class="form-control">
                    <option value="PUBLISH" {{$book->status == 'PUBLISH' ? 'selected' : ''}}>PUBLISH</option>
                    <option value="DRAFT" {{$book->status == 'DRAFT' ? 'selected' : ''}}>DRAFT</option>
                </select>
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary" value="PUBLISH">Update</button>
            </div>
        </form>
    </div>
</div>
@endsection

@section('footer-scripts')

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<script>
    $('#categories').select2({
        ajax: {
            url: 'http://larashop.test/ajax/categories/search',
            processResults: function(data) {
                return {
                    results: data.map(function(item) {
                        return {
                            id: item.id,
                            text: item.name
                        }
                    })
                }
            }
        }
    });

    // tidak bisa terbaca karena menggunakan autoformat
    // var categories = {!!$book->categories!!};

    var test = JSON.parse('<?= $book->categories ?>');

    test.forEach(function(category) {
        var option = new Option(category.name, category.id, true, true);
        $('#categories').append(option).trigger('change');
    });
</script>

@endsection