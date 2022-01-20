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
<div class="container">
    @if(Session::has('msg'))
    <div class="alert alert-info">{{Session::get('msg')}}</div>
    @endif
    <form class="bordered rounded shadow" method="POST" enctype="multipart/form-data" action="/cms">
        <h2 class="text-center">CMS</h2>
        @csrf()
        <div class="form-group ">
            Title <input type="text" class="form-control" name="title">
            @if($errors->has('title'))
            <label class="text-danger">{{$errors->first('title')}}</label>
            @endif
        </div>

        <div class="form-group ">
            Description
            <textarea class="form-control" name="description"></textarea>
            @if($errors->has('description'))
            <label class="text-danger">{{$errors->first('description')}}</label>
            @endif
        </div>
        <div class="form-group ">
            Image <input type="file" class="form-control" name="image">
            @if($errors->has('image'))
            <label class="text-danger">{{$errors->first('image')}}</label>
            @endif
        </div>
        <div class="text-center mt-2">
            <input type="submit" class="btn btn-success" value="submit" />
        </div>
    </form>
</div>
@endsection