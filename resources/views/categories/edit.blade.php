@extends('layouts.global')

@section('title')
Edit Category
@endsection

@section('content')
<label class="col-md-8">
    @if(session('status'))
    <div class="alert alert-success">
        {{session('status')}}
    </div>
    @endif

    <form action="{{route('categories.update', [$category->id])}}" enctype="multipart/form-data" method="POST" class="bg-white shadow-sm p-3">
        @csrf
        <input type="hidden" value="PUT" name="_method">

        <div class="form-group">
            <label>Category name</label> <br>
            <input type="text" class="form-control {{$errors->first('name') ? "is-invalid" : ""}}" value="{{old('name') ? old('name') : $category->name}}" name="name">
            <div class="invalid-feedback">
                {{$errors->first('name')}}
            </div>
        </div>

        <label class="form-group">
            <label>Cateogry slug</label>
            <input type="text" class="form-control {{$errors->first('slug') ? "is-invalid" : ""}}" value="{{old('slug') ? old('slug') : $category->slug}}" name="slug">
            <div class="invalid-feedback">
                {{$errors->first('slug')}}
            </div>
        </label>

        <div class="form-group">
            @if($category->image)
            <span>Current image</span><br>
            <img src="{{asset('storage/'. $category->image)}}" width="120px">
            <br><br>
            @endif
            <input type="file" class="form-control {{$errors->first('image') ? "is-invalid" : ""}}" name="image">
            <small class="text-muted">Kosongkan jika tidak ingin mengubah gambar</small>
            <div class="invalid-feedback">
                {{$errors->first('image')}}
            </div>
        </div>

        <div class="form-group">
            <input type="file" class="form-control" name="image">
            <small class="text-muted">Kosongkan jika tidak ingin mengubah gambar</small>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Update">
        </div>
    </form>
</label>
@endsection