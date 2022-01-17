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
                            <a href="categories/create" class="btn btn-dark btn-left ml-3 ">Add category</a>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Sno</th>
                                        <th>Name</th>
                                        <th>Description</th>
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
                                        <td>{{$i->description}}</td>
                                        <td>
                                            <a href="/categories/{{$i->id}}/edit" class="btn btn-info">Edit</a>
                                        </td>
                                        <td>
                                            <form action="/categories/{{$i->id}}/" method="post">
                                                @csrf()
                                                @method('delete')
                                                <button type="submit" onclick="return confirm('Do you really want to delete category!')" class="btn btn-danger">
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