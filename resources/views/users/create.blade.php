@extends('layouts.global')

@section('title')
Create User
@endsection



@section('content')
<div class="col-md-8">
    @if(session('status'))
    <div class="alert alert-success">
        {{session('status')}}
    </div>
    @endif

    <form enctype="multipart/form-data" class="bg-white shadow-sm p-3" action="{{route('users.store')}}" method="POST">
        @csrf
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" placeholder="Full Name" id="name" name="name">
        </div>

        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" placeholder="username" id="username" name="username">
        </div>

        <div class="form-group">
            <label for="">Roles</label>
            <br>
            <input type="checkbox" name="roles[]" id="ADMIN" value="ADMIN">
            <label for="ADMIN">Administrator</label>
            <input type="checkbox" name="roles[]" id="STAFF" value="STAFF">
            <label for="STAFF">Staff</label>
            <input type="checkbox" name="roles[]" id="CUSTOMER" value="CUSTOMER">
            <label for="CUSTOMER">Customer</label>

        </div>

        <div class="form-group">
            <label for="phone">Phone number</label>
            <input type="text" name="phone" class="form-control" placeholder="Phone number">
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <textarea name="address" id="address" class="form-control" placeholder="Address"></textarea>
        </div>

        <div class="form-group">
            <label for="avatar">Avatar image</label>
            <input id="avatar" name="avatar" type="file" class="form-control">
        </div>
        <hr class="my-3">

        <div class="form-group">
            <label for="email">Email</label>
            <input class="form-control" placeholder="user@mail.com" type="text" name="email" id="email" />
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input class="form-control" placeholder="password" type="password" name="password" id="password" />
        </div>

        <div class="form-group">
            <label for="password_confirmation">Password Confirmation</label>
            <input class="form-control" placeholder="password confirmation" type="password" name="password_confirmation" id="password_confirmation" />
        </div>

        <div class="form-group">
            <input class="btn btn-primary" type="submit" value="Save" />
        </div>
    </form>
</div>
@endsection