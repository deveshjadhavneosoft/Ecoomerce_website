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
                           <button class="btn btn-dark">Contacts</button>
                        </div>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Sno</th>
                                        <th> Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Message</th>
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
                                        <td>{{$i->email}}</td>
                                        <td>{{$i->phone}}</td>
                                        <td>{{$i->message}}</td>
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