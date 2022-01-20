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
    <form method="POST" enctype="multipart/form-data" action="/banners " class="border rounded shadow">
        <h2 class="text-center text-dark">Add Images</h2>
        @csrf()
        <div class="form-group ">
            Image <input type="file" class="form-control" name="image[]" multiple>
        </div>
        <div class="form-group ">
            Caption
            <textarea class="form-control" name="caption"></textarea>
        </div>
        <div class="text-center mt-2">
            <input type="submit" class="btn btn-dark" value="submit" />
        </div>
    </form>
</div>
@endsection