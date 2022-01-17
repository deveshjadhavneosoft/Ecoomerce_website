@extends('layouts.app')
@section('content')
<style>
    .container{
    display: flex;
    justify-content: center;
    
    margin-left: 200px;
  }
  form{
    padding:20px 30px 40px;
    width: 500px;
  }
</style>

    <div>
    @if(Session::has('msg'))
<div class="alert alert-success">{{Session::get('msg')}}</div>


</div>
@endif
<div class="container">
    <form method="post" action="/categories/{{$data->id}}" class="border rounded shadow">
        <h2 class="text-center text-dark">Edit Category</h2>
        @csrf()
        @method('PUT')
        <div class=" form-group ">
            Category <input type="text" class="form-control" name="name" value="{{$data->name}}" />
            @if($errors->has('name'))
            <label class="text-danger">{{$errors->first('name')}}</label>
            @endif
        </div>
        <div class="  form-group ">
            Description <textarea class="form-control" name="description">{{$data->description}} </textarea>
            @if($errors->has('description'))
            <label class="text-danger">{{$errors->first('description')}}</label>
            @endif
        </div>
        <input type="hidden" value="{{$data->id}}" name="uid" />
        <div class="text-center mt-2">
            <input type="submit" class="btn btn-dark" value="submit" />
        </div>
    </form>

</div>
@endsection