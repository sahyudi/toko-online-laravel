@extends('layouts.global')

@section('title')
Edit Category
@endsection

@section('content')
<div class="col-md-8">
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
            <input type="text" class="form-control" value="{{$category->name}}" name="name">
        </div>

        <div class="form-group">
            <label>Cateogry slug</label>
            <input type="text" class="form-control" value="{{$category->slug}}" name="slug">
        </div>

        <div class="form-group">
            @if($category->image)
            <span>Current image</span><br>
            <img src="{{asset('storage/'. $category->image)}}" width="120px">
            @endif
        </div>

        <div class="form-group">
            <input type="file" class="form-control" name="image">
            <small class="text-muted">Kosongkan jika tidak ingin mengubah gambar</small>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Update">
        </div>
    </form>
</div>
@endsection