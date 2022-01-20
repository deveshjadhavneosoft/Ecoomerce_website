@extends('layouts.app')
<style>
    .btnMargin {
        margin-left: 25%;
    }
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
                    <a href="cms/create" class="btn btn-dark btn-left ml-3 ">Add CMS</a>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Sno</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th colspan="2">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $sn=1;
                            @endphp
                            @foreach($data as $i)
                            <tr>
                                <td>{{$sn++}}</td>
                                <td>{{$i->title}}</td>
                                <td>
                                    <img src="{{url('uploads/'.$i->image_path)}}" height="50px" width="50px" />
                                </td>
                                <td>{{$i->description}}</td>
                                <td>
                                    <a href="/cms/{{$i->id}}/edit" class="btn btn-info">Edit</a>
                                </td>
                                <td>
                                    <form action="/cms/{{$i->id}}/" method="post">
                                        @csrf()
                                        @method('delete')
                                        <button type="submit" onclick="return confirm('Do you really want to delete banner')" class="btn btn-danger">
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
<!-- /.container-fluid -->
</section>
<!-- /.content -->
</div>

@endsection