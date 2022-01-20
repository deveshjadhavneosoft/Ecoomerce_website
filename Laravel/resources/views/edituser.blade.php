@extends('layouts.app')
@section('content')
<style>
    .container {
        display: flex;
        justify-content: center;

        margin-left: 200px;
    }

    form {
        padding: 20px 30px 40px;
        width: 500px;
    }
</style>

<div>
    @if(Session::has('msg'))
    <div class="alert alert-success">{{Session::get('msg')}}</div>


</div>
@endif
<div class="container">
    <form method="POST" action="/users/{{$data->id}}" class="border rounded shadow">
        <h2 class="text-center text-dark">User</h2>
        @csrf()
        @method('PUT')
        <div class="form-group ">
            First Name <input type="text" class="form-control" name="fname" value="{{$data->first_name}}" />
            @if($errors->has('fname'))
            <label class="text-danger">{{$errors->first('fname')}}</label>
            @endif
        </div>
        <div class=" form-group ">
            Last Name <input type="text" class="form-control" name="lname" value="{{$data->last_name}}" />
            @if($errors->has('lname'))
            <label class="text-danger">{{$errors->first('lname')}}</label>
            @endif
        </div>
        <div class=" form-group ">
            Email <input type="email" class="form-control" name="email" value="{{$data->email}}" />
            @if($errors->has('email'))
            <label class="text-danger">{{$errors->first('email')}}</label>
            @endif
        </div>
        <div class="form-group ">
            Role
            <select name="role" class="form-control">
                <option value="">select role</option>
                @foreach($role as $i)
                <option value="{{$i->role_type}}" {{($i->role_type == $data->role_type)?'selected':''}}>{{$i->role_type}}</option>
                @endforeach
            </select>
        </div>
        <div class=" form-group ">
            <h6> status</h6>
        </div>
        <div class=" form-group ">
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="1" {{($data->status == "1")?'checked':''}}>Active
                </label>
            </div>
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="0" {{($data->status == "0")?'checked':''}}>Inactive
                </label>
            </div>
            @if($errors->has('status'))
            <label class="text-danger">{{$errors->first('status')}}</label>
            @endif
        </div>
        <input type="hidden" value="{{$data->id}}" name="uid" />
        <div class="text-center mt-2">
            <input type="submit" class="btn btn-dark" value="submit" />
        </div>
    </form>

</div>
@endsection