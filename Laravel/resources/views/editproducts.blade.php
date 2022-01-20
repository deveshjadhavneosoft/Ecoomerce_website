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
    <form method="POST" action="/products/{{$data->id}}" class=" border rounded shadow" enctype="multipart/form-data">
        <h2 class="text-center text-dark">User</h2>
        @csrf()
        @method('put')
        Category
        <select name="category" class="form-control">
            <option value="">Category</option>
            @foreach($category as $i)
            <option value="{{$i->id}}" {{$data->category_id == $i->id  ? 'selected' : ''}}>{{$i->name}}</option>
            @endforeach

        </select>
        product<input type="text" class="form-control" name="name" value="{{$data->name}}" />
        @if($errors->has('fname'))
        <label class="text-danger">{{$errors->first('fname')}}</label>
        @endif
        quantity <input type="number" class="form-control" name="quantity" value="{{$data->quantity}}" />
        @if($errors->has('pass'))
        <label class="text-danger">{{$errors->first('pass')}}</label>
        @endif
        Price <input type="number" class="form-control" name="price" value="{{$data->price}}" />
        @if($errors->has('email'))
        <label class="text-danger">{{$errors->first('email')}}</label>
        @endif
        sale price <input type="number" class="form-control" name="sale" value="{{$data->sale_price}}" />
        @if($errors->has('cpass'))
        <label class="text-danger">{{$errors->first('cpass')}}</label>
        @endif
        Features<textarea class="form-control" name="features">{{$data->features}}</textarea>
        @if($errors->has('cpass'))
        <label class="text-danger">{{$errors->first('cpass')}}</label>
        @endif
        status
        <div class="form-check-inline">
            <label class="form-check-label">
                <input type="radio" class="form-check-input" name="status" value="1" {{$data->status==1?'checked':''}}>Active
            </label>
        </div>
        <div class="form-check-inline">
            <label class="form-check-label">
                <input type="radio" class="form-check-input" name="status" value="0" {{$data->status==0?'checked':''}}>Inactive
            </label>
        </div>
        @if($errors->has('status'))
        <label class="text-danger">{{$errors->first('status')}}</label>
        @endif
        <div>
            Image <input type="file" class="form-control" name="image[]" multiple />
            @if($errors->has('image'))
            <label class="text-danger">{{$errors->first('image')}}</label>
            @endif
        </div>
        <div class="mt-2">
            @foreach($images as $image)
            <img src="{{url('uploads/'.$image->image_path)}}" height="100px" width="100px" />
            @endforeach
        </div>
        <input type="hidden" name="uid" value="{{$data->id}}" />
        <div class="text-center mt-2">
            <input type="submit" class="btn btn-dark" value="submit" />
        </div>
    </form>

</div>
@endsection