@extends('layouts.app')

@section('content')
<div class="container d-flex justify-content-center mr-4">

    <div class="row  ">

        <div class="col-12  ">
            <div class="card ">
                <div class="card-header">

                    <div class="">
                        @if(Session::has('msg'))
                        <div class="alert alert-success">{{Session::get('msg')}}</div>

                    </div>

                    @endif
                    <a href="contacts/create" class="btn btn-dark btn-left ml-3 ">Add contact</a>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Sno</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Message</th>
                                <th colspan="2" class="text-center">Actions</th>
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
                                <td>
                                    <a href="/contacts/{{$i->id}}/edit" class="btn btn-info">Edit</a>
                                </td>
                                <td>
                                    <form action="/contacts/{{$i->id}}/" method="post">
                                        @csrf()
                                        @method('delete')
                                        <button type="submit" onclick="return confirm('Do you really want to delete contact!')" class="btn btn-danger">
                                            Delete
                                        </button>
                                    </form>

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
@endsection