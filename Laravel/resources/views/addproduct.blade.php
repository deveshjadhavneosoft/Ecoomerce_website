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
    <form method="POST" action="/products" class=" border rounded shadow" enctype="multipart/form-data">
        <h2 class="text-center text-dark">Products</h2>
        @csrf()
        Category
        <select name="category" class="form-control">
            <option value="">select category</option>
            @foreach($data as $i)
            <option value={{$i->id}}>{{$i->name}}</option>
            @endforeach
        </select>
        product<input type="text" class="form-control" name="name" />
        @if($errors->has('fname'))
        <label class="text-danger">{{$errors->first('fname')}}</label>
        @endif
        <div>
            @php
            function unique_code($limit)
            {
            return substr(base_convert(sha1(uniqid(mt_rand())), 8, 36), 0, $limit);
            }
            @endphp
            Product Code
            <input id="code" type="text" class="form-control " name="product_id" value="@php echo unique_code(16); @endphp" readonly>
        </div>
        quantity <input type="number" class="form-control" name="quantity" />
        @if($errors->has('pass'))
        <label class="text-danger">{{$errors->first('pass')}}</label>
        @endif
        Price <input type="number" class="form-control" name="price" />
        @if($errors->has('email'))
        <label class="text-danger">{{$errors->first('email')}}</label>
        @endif
        sale price <input type="number" class="form-control" name="sale" />
        @if($errors->has('cpass'))
        <label class="text-danger">{{$errors->first('cpass')}}</label>
        @endif
        Features<textarea class="form-control" name="features"></textarea>
        @if($errors->has('cpass'))
        <label class="text-danger">{{$errors->first('cpass')}}</label>
        @endif
        status
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
        @endif<br />
        Image
        <input type="file" class="form-control" name="image[]" multiple>
        <div class="text-center mt-2">
            <input type="submit" class="btn btn-dark" value="submit" />
        </div>
    </form>

</div>
@endsection