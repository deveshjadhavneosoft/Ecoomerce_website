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
                           <h2 class="btn btn-dark">Order Details</h2>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Sno</th>
                                        <th>Email</th>
                                        <th>Order Id</th>
                                        <th>Product</th>
                                        <th>Amount</th>
                                        <th>Payment mode</th>
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
                                        <td>{{$i->email}}</td>
                                        <td>{{$i->orderId}}</td>
                                        <td>{{$i->product_name}}</td>
                                        <td>{{$i->product_price}}</td>
                                        <td>{{$i->payment_mode}}</td>
                                        <td class="text-success">{{$i->status}}</td>
                                        <td>
                                            <a href="/orders/{{$i->id}}/edit" class="btn btn-info">Edit</a>
                                        </td>
                                    </tr>
                                    @endforeach

                                </tbody>
                            </table>
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