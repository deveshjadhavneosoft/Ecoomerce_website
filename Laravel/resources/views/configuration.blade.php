@extends('layouts.app')

</style>
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
                    <a href="configuration/create" class="btn btn-dark btn-left ml-3 ">Add configuration</a>
                </div>

                <!-- /.card-header -->
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Sno</th>
                                <th>Contact</th>
                                <th>Notification Email</th>
                                <th>Admin Email</th>
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
                                <td>{{$i->phone_no}}</td>
                                <td>{{$i->notification_email}}</td>
                                <td>{{$i->admin_email}}</td>
                                <td>
                                    <a href="/configuration/{{$i->id}}/edit" class="btn btn-info">Edit</a>
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