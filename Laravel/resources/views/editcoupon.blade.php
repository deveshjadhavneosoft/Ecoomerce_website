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
    <form method="POST" action="/coupons/{{$data->id}}" class=" border rounded shadow">
        <h2 class="text-center text-dark">Coupons</h2>
        @csrf()
        @method('put')
        <div>
            Code<input type="text" class="form-control" name="code" value="{{$data->code}}" />
            @if($errors->has('code'))
            <label class="text-danger">{{$errors->first('code')}}</label>
            @endif
        </div>
        <div>
            Type
            <select name="type" class="form-control">
                <option value="">Select type</option>
                <option value="fixed" {{($data->type=='fixed')?'selected':''}}>Fixed</option>
                <option value="percent" {{($data->type=='percent')?'selected':''}}>Percent</option>
            </select>
            Value<input type="number" class="form-control" name="value" value="{{$data->value}}" />
            @if($errors->has('value'))
            <label class="text-danger">{{$errors->first('value')}}</label>
            @endif
        </div>
        <div>
            Cart value<input type="number" class="form-control" name="cart_value" value="{{$data->cart_value}}" />
            @if($errors->has('cart_value'))
            <label class="text-danger">{{$errors->first('cart_value')}}</label>
            @endif
        </div>
        <div>
            Status
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="1" {{$data->status=="1"?'checked':''}}>Active
                </label>
            </div>
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="0" {{$data->status=="0"?'checked':''}}>Inactive
                </label>
            </div>
            @if($errors->has('status'))
            <label class="text-danger">{{$errors->first('status')}}</label>
            @endif
        </div>
        <div class="text-center mt-2">
            <input type="submit" class="btn btn-dark" value="submit" />
        </div>
    </form>

</div>
@endsection