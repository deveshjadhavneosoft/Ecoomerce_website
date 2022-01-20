<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;


class firstController extends Controller
{
    // sales report
    public function salesReport()
    {
        $sales = DB::select(DB::raw("select sum(product_quantity) as total,product_name as name from user_orders group by product_name "));
        $data = "";
        foreach ($sales as $i) {
            $data .= " ['" . $i->name . "'," . $i->total . "],";
        }
        $details = $data;
        return view('chart', compact('details'));
    }

    //user report
    public function userReport()
    {
        $users = DB::select(DB::raw("select count(*) as total,role_type as name from users group by role_type "));
        $data = "";
        foreach ($users as $i) {
            $data .= " ['" . $i->name . "'," . $i->total . "],";
        }
        $user_details = $data;
        return view('userChart', compact('user_details'));
    }
    //coupon report
    public function couponReport()
    {
        $coupons = DB::select(DB::raw("select count(*) as total,status from coupons  group by status "));
        $data = "";
        foreach ($coupons as $i) {
            $data .= " ['" . $i->status . "'," . $i->total . "],";
        }
        $coupons_details = $data;
        return view('couponChart', compact('coupons_details'));
    }
}
