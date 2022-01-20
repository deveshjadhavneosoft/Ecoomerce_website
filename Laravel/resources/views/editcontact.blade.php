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
    <form method="post" action="/contacts/{{$data->id}}" class="border rounded shadow">
        <h2 class="text-center text-dark">Edit Category</h2>
        @csrf()
        @method('PUT')
        <div class=" form-group ">
            Category <input type="text" class="form-control" name="name" value="{{$data->name}}" />
            @if($errors->has('name'))
            <label class="text-danger">{{$errors->first('name')}}</label>
            @endif
        </div>
        <div class=" form-group ">
            Email <input type="text" class="form-control" name="email" value="{{$data->email}}" />
            @if($errors->has('email'))
            <label class="text-danger">{{$errors->first('email')}}</label>
            @endif
        </div>
        <div class=" form-group ">
            Phone <input type="text" class="form-control" name="phone" value="{{$data->phone}}" />
            @if($errors->has('phone'))
            <label class="text-danger">{{$errors->first('phone')}}</label>
            @endif
        </div>
        <div class="  form-group ">
            Message <textarea class="form-control" name="message">{{$data->message}} </textarea>
            @if($errors->has('message'))
            <label class="text-danger">{{$errors->first('message')}}</label>
            @endif
        </div>
        <input type="hidden" value="{{$data->id}}" name="uid" />
        <div class="text-center mt-2">
            <input type="submit" class="btn btn-dark" value="submit" />
        </div>
    </form>

</div>
@endsection