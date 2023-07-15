<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;
use App\Models\Order;
use PDF;
use Notification;
use App\Notifications\FirstNotfication;
use RealRashid\SweetAlert\Facades\Alert;

class AdminController extends Controller
{
    function view_category(){
        $data=category::all();
        return view('admin.category', compact('data'));
    }

    function add_category(Request $request){

        $data = new category;
        $data->category_name=$request->category;
        $data->save();
        Alert::success('Category Added Sucessfully','New Category Added');
        return redirect()->back();
    }

    function delete_category($id){
        $data=category::find($id);
        $data->delete();
        Alert::success('Category Delete Sucessfully','Category Removed');
        return redirect()->back();
    }

    function show_product(){
        $category = category::all();
        return view('admin.product', compact('category'));
    }

    function add_product(Request $request){
        $product = new product;
        $product->title=$request->title;
        $product->description=$request->description;
        $product->price=$request->price;
        $product->discount_price=$request->discount_price;
        $product->quantity=$request->quantity;
        $product->category=$request->category;

        $iamge=$request->iamge;
        $imagename=time().'.'.$iamge->getClientOriginalExtension();
        $request->iamge->move('product', $imagename);
        $product->iamge=$imagename;

        $product->save();
       Alert::success('Product has been Added','Product has been Added');
        return redirect()->back();
    }

    function view_product(){
        $product= product::all();
        return view('admin.view_product', compact('product'));
    }

    function delete_product($id){
        $product=product::find($id);
        $product->delete();
        return redirect()->back();
    }

    function edit_product($id){
        $product= product::find($id);
        $category = category::all();
        return view('admin.update_product', compact('product', 'category'));
    }

    function update_product($id, Request $request){
        $product= product::find($id);
        $product->title=$request->title;
        $product->description=$request->description;
        $product->price=$request->price;
        $product->discount_price=$request->discount_price;
        $product->quantity=$request->quantity;
        $product->category=$request->category;
        $iamge=$request->iamge;
        if($iamge){
            $imagename=time().'.'.$iamge->getClientOriginalExtension();
            $request->iamge->move('product', $imagename);
            $product->iamge=$imagename;

        }
        $product->save();
        Alert::success('Product Added Sucessfully','New Product Added');
        return redirect()->back();

    }

    function view_order(){
        $order= order::all();
        return view('admin.order', compact('order'));
    }

    function delivered($id){
        $order=order::find($id);
        $order->delivery_status="Delivered";
        $order->payement_status="Paid";
        $order->save();


    }

    function pdf($id){
        $order=order::find($id);
        $pdf=PDF::loadView('admin.pdf', compact('order'));
        return $pdf->download('order_details.pdf');
    }

    function Send_email($id){
        $order=order::find($id);
        return view('admin.email_info', compact('order'));
    }
    function send_emails(Request $request, $id){
        $order=order::find($id);
        $details=[
            'greeting'=>$request->greeting,
            'firstline'=>$request->firstline,
            'body'=>$request->body,
            'btn'=>$request->btn,
            'url'=>$request->url,
            'lastline'=>$request->lastline,


        ];
        Notification::send($order, new FirstNotfication($details));
        return redirect()->back();
    }

    function search_order(Request $request){
        $searchText=$request->search;
        $order=order::where('name', 'LIKE', "%$searchText%")->orWhere('product_title', 'LIKE', "%$searchText%")->get();

        return view('admin.order', compact('order'));
    }


}

