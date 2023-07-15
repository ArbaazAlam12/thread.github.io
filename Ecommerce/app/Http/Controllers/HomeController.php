<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\user;
use App\Models\Product;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Comment;
use App\Models\Reply;
use Stripe;
use Session;
use RealRashid\SweetAlert\Facades\Alert;

class HomeController extends Controller
{
    function index(){
        $product= product::paginate(3);
        $comment= comment::orderby('id','desc')->get();
        $reply= reply::all();
        return view('home.userpage', compact('product', 'comment', 'reply'));
    }

    function redirect(){
        $usertype=Auth::user()->usertype;
        if($usertype =='1'){
            $total_product=product::all()->count();
            $total_order=order::all()->count();
            $total_user=user::all()->count();
            $order=order::all();
            $total_revenue=0;

            foreach($order as $order){
                $total_revenue=$total_revenue+$order->price;
            }
            $total_delievered=order::where('delivery_status', '=', 'Delivered')->get()->count();
            $total_proccessing=order::where('delivery_status', '=', 'Processing')->get()->count();
            return view('admin.home', compact('total_product', 'total_order', 'total_user', 'total_revenue', 'total_proccessing', 'total_delievered'));
        }
        else{
            $comment= comment::orderby('id','desc')->get();
            $reply= reply::all();
            $product= product::paginate(3);
            return view('home.userpage', compact('product', 'comment', 'reply'));
        }
    }

    function product_details($id){
        $product=product::find($id);
        return view('home.product_details', compact('product'));
    }

    function add_cart($id, Request $request){
        if(Auth::id()){
            $user=Auth::user();
            $product=product::find($id);
            $userid=$user->id;
            $product_exist_id=cart::where('product_id','=',$id)->where('user_id','=',$userid)->get('id')->first();
            if($product_exist_id){
                $cart=cart::find($product_exist_id)->first();
                $quantity=$cart->quantity;
                $cart->quantity=$quantity + $request->quantity;

                if($product->discount_price!=null){
                    $cart->price=$product->discount_price * $cart->quantity;
                }
                else{
                    $cart->price=$product->price * $cart->quantity;
                }

                $cart->save();
                Alert::success('Product Added to cart','It has been added to cart');
                return redirect()->back();
            }
            else{
                $cart=new cart;
                $cart->name=$user->name;
                $cart->email=$user->email;
                $cart->phone=$user->phone;
                $cart->address=$user->address;
                $cart->user_id=$user->id;
                $cart->product_title=$product->title;
                $cart->product_id=$product->id;

                if($product->discount_price!=null){
                    $cart->price=$product->discount_price * $request->quantity;
                }
                else{
                    $cart->price=$product->price * $request->quantity;
                }

                $cart->quantity=$request->quantity;
                $cart->image=$product->iamge;
                $cart->save();
                Alert::success('Product Added to cart','It has been added to cart');
                return redirect()->back();
            }
        }
        else{

            return redirect('login');
        }
    }

    function show_cart(){
        if(Auth::id()){
            $id=Auth::user()->id;
            $cart=cart::where('user_id', '=', $id)->get();
            return view('home.showcart', compact('cart'));
        }
        else{

            return redirect('login');
        }

    }

    function remove_cart($id){
        $cart=cart::find($id);
        $cart->delete();
        return redirect()->back();
    }

    function cash_order(){
        $user=Auth::user();
        $userid=$user->id;
        $data= cart::where('user_id', '=',$userid)->get();
        foreach($data as $data){
            $order = new order;
            $order->name=$data->name;
            $order->email=$data->email;
            $order->phone=$data->phone;
            $order->address=$data->address;
            $order->user_id=$data->user_id;
            $order->product_title=$data->product_title;
            $order->product_id=$data->product_id;
            $order->price=$data->price;
            $order->quantity=$data->quantity;
            $order->image=$data->image;
            $order->payement_status='Cash On Delivery';
            $order->delivery_status='Processing';
            $order->save();

            $cart_id=$data->id;
            $cart=cart::find($cart_id);
            $cart->delete();

        }
        Alert::success('Product has been ordered','We will contact you soon');
        return redirect()->back();
    }

    function stripe($totalprice){
        return view('home.stripe', compact('totalprice'));
    }

    public function stripePost(Request $request, $totalprice)
    {
        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

        Stripe\Charge::create ([
                "amount" => $totalprice * 100,
                "currency" => "usd",
                "source" => $request->stripeToken,
                "description" => "Test payment from itsolutionstuff.com."
        ]);

        $user=Auth::user();
        $userid=$user->id;
        $data= cart::where('user_id', '=',$userid)->get();
        foreach($data as $data){
            $order = new order;
            $order->name=$data->name;
            $order->email=$data->email;
            $order->phone=$data->phone;
            $order->address=$data->address;
            $order->user_id=$data->user_id;
            $order->product_title=$data->product_title;
            $order->product_id=$data->product_id;
            $order->price=$data->price;
            $order->quantity=$data->quantity;
            $order->image=$data->image;
            $order->payement_status='Paid Sucessfully';
            $order->delivery_status='Processing';
            $order->save();

            $cart_id=$data->id;
            $cart=cart::find($cart_id);
            $cart->delete();

        }
        Alert::success('Payment Sucessfully','Order has been confirmed');
        return redirect()->back();
    }

    function show_order(){
        if(Auth::id()){
            $user=Auth::user();
            $userid=$user->id;
            $order=order::where('user_id','=',$userid)->get();
            return view('home.order', compact('order'));
        }
        else{
            return redirect('login');
        }
    }

    function cancel_order($id){

        $order=order::find($id);
        $order->delivery_status='Cancelled Order';
        $order->save();
        return redirect()->back();
    }

    function add_comment(Request $request){
        if(Auth::id()){
            $comment=new comment;
            $comment->name=Auth::user()->name;
            $comment->user_id=Auth::user()->id;
            $comment->comment=$request->comment;
            $comment->save();
            return redirect()->back();
        }
        else{
            return redirect('login');
        }
    }
    function add_reply(Request $request){
        if(Auth::id()){
            $reply=new reply;
            $reply->name=Auth::user()->name;
            $reply->user_id=Auth::user()->id;
            $reply->comment_id=$request->commentId;
            $reply->reply=$request->reply;
            $reply->save();
            return redirect()->back();
        }
        else{
            return redirect('login');
        }
    }

    function product_search(Request $request){
        $search=$request->search;
        $product=product::where('title','LIKE',"%$search%")->orWhere('category','LIKE',"%$search%")->paginate(10);
        $comment= comment::orderby('id','desc')->get();
        $reply= reply::all();
        return view('home.userpage', compact('product','comment', 'reply'));
    }

    function Products(){
        $product=product::paginate(10);
        $comment= comment::orderby('id','desc')->get();
        $reply= reply::all();
        return view('home.productpage', compact('product','comment', 'reply'));

    }

    function search_product(Request $request){
        $search=$request->search;
        $product=product::where('title','LIKE',"%$search%")->orWhere('category','LIKE',"%$search%")->paginate(10);
        $comment= comment::orderby('id','desc')->get();
        $reply= reply::all();
        return view('home.productpage', compact('product','comment', 'reply'));
    }
}
