@extends('layouts.global')

@section('title')
Create Book
@endsection


@section('content')

<div class="row">
    <div class="col-md-8">
        @if(session('status'))
        <div class="alert alert-success">
            {{session('status')}}
        </div>
        @endif

        <form action="{{route('books.store')}}" method="POST" enctype="multipart/form-data" class="shadow-sm p-3 bg-white">
            @csrf

            <div class="form-group">
                <label for="title">Title</label>
                <input value="{{old('title')}}" type="text" class="form-control {{$errors->first('title') ? "is-invalid" : ""}} " name="title" placeholder="Book title">
                <div class="invalid-feedback">
                    {{$errors->first('title')}}
                </div>
            </div>


            <div class="form-group">
                <label for="cover">Cover</label>
                <input type="file" class="form-control {{$errors->first('cover') ? "is-invalid" : ""}} " name="cover">
                <div class="invalid-feedback">
                    {{$errors->first('cover')}}
                </div>
            </div>

            <div class="form-group">
                <label for="categories">Categories</label>
                <select name="categories[]" id="categories" class="form-control" multiple>
                    <option value=""></option>
                </select>
            </div>


            <div class="form-group">
                <label for="description">Description</label><br>
                <textarea name="description" id="description" class="form-control {{$errors->first('description') ? "is-invalid" : ""}} " placeholder="Give a description about this book">{{old('description')}}</textarea>
                <div class="invalid-feedback">
                    {{$errors->first('description')}}
                </div>
            </div>

            <div class="form-group">
                <label for="stock">Stock</label><br>
                <input value="{{old('stock')}}" type="number" class="form-control {{$errors->first('stock') ? "is-invalid" : ""}} " id="stock" name="stock" min="0" value="0">
                <div class="invalid-feedback">
                    {{$errors->first('stock')}}
                </div>
            </div>

            <div class="form-group">
                <label for="author">Author</label><br>
                <input value="{{old('author')}}" type="text" class="form-control {{$errors->first('author') ? "is-invalid" : ""}} " name="author" id="author" placeholder="Book author">
                <div class="invalid-feedback">
                    {{$errors->first('author')}}
                </div>
            </div>

            <div class="form-group">
                <label for="publisher">Publisher</label> <br>
                <input value="{{old('publisher')}}" type="text" class="form-control {{$errors->first('publisher') ? "is-invalid" : ""}} " id="publisher" name="publisher" placeholder="Book publisher">
                <div class="invalid-feedback">
                    {{$errors->first('publisher')}}
                </div>
            </div>

            <div class="form-group">
                <label for="Price">Price</label> <br>
                <input value="{{old('price')}}" type="number" class="form-control {{$errors->first('price') ? "is-invalid" : ""}} " name="price" id="price" placeholder="Book price">
                <div class="invalid-feedback">
                    {{$errors->first('price')}}
                </div>
            </div>
            <div class="form-group">
                <button class="btn btn-primary" name="save_action" value="PUBLISH">Publish</button>
                <button class="btn btn-secondary" name="save_action" value="DRAFT">Save as draft</button>
            </div>
        </form>
    </div>
</div>

@endsection

@section('footer-scripts')
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
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
</script>
@endsection