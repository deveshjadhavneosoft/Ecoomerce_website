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
    <form class="border rounded shadow" method="post" action="/configuration/{{$data->id}}">
        <h2 class="text-center">Edit Configuration</h2>
        @method("put")
        @csrf()
        <div class="row form-group m-auto col-5">
            Contact <input type="text" class="form-control" name="phone" value="{{$data->phone_no}}" />
            @if($errors->has('phone'))
            <label class="text-danger">{{$errors->first('phone')}}</label>
            @endif
        </div>
        <div class="row form-group m-auto col-5">
            Admin email <input type="email" class="form-control" name="adminEmail" value="{{$data->admin_email}}" />
            @if($errors->has('adminEmail'))
            <label class="text-danger">{{$errors->first('adminEmail')}}</label>
            @endif
        </div>
        <div class="row form-group m-auto col-5">
            Notification email <input type="email" class="form-control" name="notificationEmail" value="{{$data->notification_email}}" />
            @if($errors->has('notificationEmail'))
            <label class="text-danger">{{$errors->first('notificationEmail')}}</label>
            @endif
        </div>

        <div class="text-center mt-2">
            <input type="submit" class="btn btn-success" value="submit" />
        </div>
    </form>

</div>
@endsection