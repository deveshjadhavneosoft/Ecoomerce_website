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
    <form method="POST" enctype="multipart/form-data" action="/banners/{{$data->id}}" class="border rounded shadow">
        <h2 class="text-center text-dark">update banner</h2>
        @csrf()
        @method('PUT')
        <div class="form-group ">
            Caption
            <textarea class="form-control" name="caption">{{$data->caption}}</textarea>
        </div>
        <div class="form-group ">
            Image <input type="file" class="form-control" name="image">
        </div>
        <div class="form-group ">
            <img src="{{url('uploads/'.$data->image_path)}}" height="100px" width="100px" class="mt-2" />
        </div>
        <input type="hidden" name="uid" value="{{$data->id}}" />
        <div class="text-center mt-2">
            <input type="submit" class="btn btn-dark" value="submit" />
        </div>
    </form>
</div>
@endsection