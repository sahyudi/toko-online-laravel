@extends('layouts.global')

@section('title')
Create Category
@endsection

@section('content')

<div class="col-md-8">
    @if(session('status'))
    <div class="alert alert-success">
        {{session('status')}}
    </div>
    @endif

    <form enctype="multipart/form-data" class="bg-white shadow-sm p-3" action="{{route('categories.store')}}" method="POST">
        @csrf

        <div class="form-group">
            <label>Category name</label><br>
            <input type="text" class="form-control" name="name">
        </div>
        <div class="form-group">
            <label>Category image</label>
            <input type="file" class="form-control" name="image">
        </div>

        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Save">
        </div>
    </form>
</div>

@endsection