<?php

namespace App\Http\Controllers;

use App\Mail\Deliveryemail;
use Illuminate\Http\Request;
use App\Models\Order_detail;
use App\Models\User_order;
use Illuminate\Support\Facades\Mail;


class orderDetailsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = User_order::latest()->get();
        return view('orderdetails', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $status = User_order::where('id', $id)->first();
        return view('editOrderdetails', compact('status'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $userdata=User_order::where('id',$id)->first();
        $data = User_order::where('id', $id)->update([
            "status" => $request->status
        ]);
        $details=User_order::find($id);
        Mail::to($userdata->email)->send(new Deliveryemail($details));
        return redirect("orders");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
