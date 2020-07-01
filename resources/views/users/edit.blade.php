@extends('layouts.global')

@section('title')
Edit User
@endsection

@section('content')
<div class="col-md-8">
    @if(session('status'))
    <div class="alert alert-success">
        {{session('status')}}
    </div>
    @endif

    <form enctype="multipart/form-data" class="bg-white shadow-sm p-3" action="{{route('users.update', [$user->id])}}" method="POST">
        @csrf
        <input type="hidden" value="PUT" name="_method">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" value="{{$user->name}}" placeholder="Full Name" id="name" name="name">
        </div>

        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" value="{{$user->username}}" placeholder="username" id="username" name="username" disabled>
        </div>

        <div class="form-group">
            <label for="">Status</label>
            <br>
            <input {{$user->status == 'ACTIVE' ? 'checked' : '' }} type="radio" value="ACTIVE" id="active" name="status">
            <label for="active">Active</label>
            <input {{$user->status == 'INACTIVE' ? 'checked' : '' }} type="radio" value="INACTIVE" id="inactive" name="status">
            <label for="inactive">Inactive</label>
        </div>

        <div class="form-group">
            <label for="">Roles</label>
            <br>
            <input type="checkbox" name="roles[]" id="ADMIN" value="ADMIN" {{in_array('ADMIN', json_decode($user->roles)) ? 'checked' : ''}}>
            <label for="ADMIN">Administrator</label>
            <input type="checkbox" name="roles[]" id="STAFF" value="STAFF" {{in_array('STAFF', json_decode($user->roles)) ? "checked" : ""}}>
            <label for="STAFF">Staff</label>
            <input type="checkbox" name="roles[]" id="CUSTOMER" value="CUSTOMER" {{in_array('CUSTOMER', json_decode($user->roles)) ? "checked" : ""}}>
            <label for="CUSTOMER">Customer</label>

        </div>

        <div class="form-group">
            <label for="phone">Phone number</label>
            <input type="text" name="phone" class="form-control" placeholder="Phone number" value="{{$user->phone}}">
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <textarea name="address" id="address" class="form-control" placeholder="Address">{{$user->address}}</textarea>
        </div>

        <div class="form-group">
            <label for="avatar">Avatar image</label> <br>
            Current avatar: <br>
            @if($user->avatar)
            <img src="{{asset('storage/'.$user->avatar)}}" width="120px" alt="">
            @else
            No avatar
            @endif
            <br>
            <input id="avatar" name="avatar" type="file" class="form-control mt-2">
            <small class="text-muted">Kosongkan jika tidak ingin merubah avatar</small>
        </div>
        <hr class="my-3">

        <div class="form-group">
            <label for="email">Email</label>
            <input class="form-control" value="{{$user->email}}" placeholder="user@mail.com" type="text" name="email" id="email" disabled />
        </div>
        <div class="form-group">
            <input class="btn btn-primary" type="submit" value="Save" />
        </div>
    </form>
</div>
@endsection