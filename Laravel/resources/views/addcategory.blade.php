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
    <form method="post" action="/categories" class="border rounded shadow">
        <h2 class="text-center text-dark">Add Category</h2>
        @csrf()
        <div class=" form-group ">
            Category <input type="text" class="form-control" name="name" />
            @if($errors->has('name'))
            <label class="text-danger">{{$errors->first('name')}}</label>
            @endif
        </div>
        <div class="form-group ">
            Description <textarea class="form-control" name="description"> </textarea>
            @if($errors->has('description'))
            <label class="text-danger">{{$errors->first('description')}}</label>
            @endif
        </div>
        <div class="text-center mt-2">
            <input type="submit" class="btn btn-dark " value="submit" />
        </div>
    </form>

</div>
@endsection