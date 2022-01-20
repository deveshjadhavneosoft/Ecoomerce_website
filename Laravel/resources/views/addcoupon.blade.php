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
    <form method="POST" action="/coupons" class="border rounded shadow ">
        <h2 class="text-center text-dark">Coupons</h2>
        @csrf()
        
        <div>
            @php
            function unique_code($limit)
            {
            return substr(base_convert(sha1(uniqid(mt_rand())), 8, 36), 0, $limit);
            }
            @endphp
             Coupan Code
            <input id="code" type="text" class="form-control " name="code" value="@php echo unique_code(16); @endphp" readonly>
            @if($errors->has('code'))
            <label class="text-danger">{{$errors->first('code')}}</label>
            @endif
        </div>
        <div>
            Type
            <select name="type" class="form-control">
                <option value="">Select type</option>
                <option value="fixed">Fixed</option>
                <option value="percent">Percent</option>
            </select>
            Value<input type="number" class="form-control" name="value" />
            @if($errors->has('value'))
            <label class="text-danger">{{$errors->first('value')}}</label>
            @endif
        </div>
        <div>
            Cart value<input type="number" class="form-control" name="cart_value" />
            @if($errors->has('cart_value'))
            <label class="text-danger">{{$errors->first('cart_value')}}</label>
            @endif
        </div>
        <div>
            <p class="mt-1">Status</p>
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="1">Active
                </label>
            </div>
            <div class="form-check-inline">
                <label class="form-check-label">
                    <input type="radio" class="form-check-input" name="status" value="0">Inactive
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