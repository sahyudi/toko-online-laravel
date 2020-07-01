@extends('layouts.global')

@section('title')
Users list
@endsection

@section('content')
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Name</th>
            <th>Username</th>
            <th>Email</th>
            <th>Avatar</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        @foreach($users as $user)
        <tr>
            <td>{{$user->name}}</td>
            <td>{{$user->username}}</td>
            <td>{{$user->email}}</td>
            <td>
                @if($user->avatar)
                <img src="{{asset('storage/'.$user->avatar)}}" width="70px" alt="">
                @else
                N/A
                @endif
            </td>
            <td>
                <a class="btn btn-info text-white btn-sm" href="{{ route('users.edit', [$user->id]) }}">Edit</a>
                <!-- <a href="{{ url('/users/'.$user->id.'/edit') }}" class="btn btn-info text-white btn-sm">Edit</a> -->
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
@endsection