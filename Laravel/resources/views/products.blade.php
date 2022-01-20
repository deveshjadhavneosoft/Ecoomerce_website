@extends('layouts.app')

@section('content')
<div class="container d-flex justify-content-center">

    <div class="row w-75 ">

        <div class="col-12  ">
            <div class="card ">
                <div class="card-header">

                    <div class="">
                        @if(Session::has('msg'))
                        <div class="alert alert-success">{{Session::get('msg')}}</div>

                    </div>

                    @endif
                    <a href="/products/create" class="btn btn-dark btn-left ml-3">Add Product</a>
                </div>
                <!-- /.card-header -->
                <div class="card-body">

                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Sno</th>
                                <th> Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Sale price</th>
                                <th>Features</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $sn=1;
                            @endphp
                            @foreach($data as $i)
                            <tr>
                                <td>{{$sn++}}</td>
                                <td>{{$i->name}}</td>
                                <td>{{$i->quantity}}</td>
                                <td>{{$i->price}}</td>
                                <td>{{$i->sale_price}}</td>
                                <td>{{$i->features}}</td>
                                @if($i->status==1)
                                <td class="text-success">Active</td>
                                @else
                                <td class="text-danger">Inactive</td>
                                @endif
                                <td>
                                    <a href="/products/{{$i->id}}/edit" class="btn btn-info">Edit</a>
                                </td>
                                <td>
                                    <form action="/products/{{$i->id}}/" method="post">
                                        @csrf()
                                        @method('delete')
                                        <button type="submit" onclick="return confirm('Do you really want to delete product!')" class="btn btn-danger">
                                            Delete
                                        </button>
                                    </form>

                                </td>
                            </tr>
                            @endforeach

                        </tbody>
                    </table>
                    {{$data->links()}}
                </div>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</div>
<!-- /.container-fluid -->
</section>
<!-- /.content -->
</div>
@endsection