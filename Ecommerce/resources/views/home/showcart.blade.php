<!DOCTYPE html>
<html>
   <head>
    <style>
        .center{
            font-size: 30px;
            padding-bottom: 30px;
            font-weight: bold;
        }
    </style>
      <!-- Basic -->
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <!-- Mobile Metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <!-- Site Metas -->
      <meta name="keywords" content="" />
      <meta name="description" content="" />
      <meta name="author" content="" />
      <link rel="shortcut icon" href="images/favicon.png" type="">
      <title>Threads</title>
      <!-- bootstrap core css -->
      <link rel="stylesheet" type="text/css" href="{{asset ('home/css/bootstrap.css') }}" />
      <!-- font awesome style -->
      <link href="{{asset ('home/css/font-awesome.min.css') }}" rel="stylesheet" />
      <!-- Custom styles for this template -->
      <link href="{{asset ('home/css/style.css') }}" rel="stylesheet" />
      <!-- responsive style -->
      <link href="{{ asset('home/css/responsive.css') }}" rel="stylesheet" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   </head>
   <body>
      <div class="hero_area">
        @include('sweetalert::alert')
        @include('home.header')
         <!-- slider section -->

         <div>


            <table class="table">
                <tr>
                    <th>Product title</th>
                    <th>Product quantity</th>
                    <th>Product price</th>
                    <th>Product image</th>
                    <th>Action</th>
                </tr>
                @php
                    $totalprice=0;
                @endphp
            @foreach ($cart as $cart)
                <tr>
                    <td>{{ $cart->product_title }}</td>
                    <td>{{ $cart->quantity }}</td>
                    <td>${{ $cart->price }}</td>
                    <td><img style="height: 100px; width:100px;" src="/product/{{ $cart->image }}" alt=""></td>
                    <td>
                        <a onclick="confirmation(event)" href="{{ url('remove_cart', $cart->id) }}"><button class="btn btn-primary">Remove</button></a>
                    </td>
                </tr>
                @php
                    $totalprice= $totalprice + $cart->price;
                @endphp
                @endforeach
            </table>
            <div >
                <h1  class="center">Total Price: ${{ $totalprice }}</h1>
            </div>
            <div >
                <h1  class="center">Proceed to Order</h1>
                <a href="{{ url('cash_order') }}" class="btn btn-primary"> Cash On Delivery</a>
                <a href="{{ url('stripe', $totalprice)}}" class="btn btn-primary"> Pay Using Card</a>
            </div>

          </div>
      </div>
      <!-- why section -->

      @include('home.footer')
      <!-- footer end -->
      <div class="cpy_">
         <p class="mx-auto">© 2021 All Rights Reserved By <a href="https://html.design/">Free Html Templates</a><br>

            Distributed By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>

         </p>
      </div>
      <script>
        function confirmation(ev) {
          ev.preventDefault();
          var urlToRedirect = ev.currentTarget.getAttribute('href');
          console.log(urlToRedirect);
          swal({
              title: "Are you sure to cancel this product",
              text: "You will not be able to revert this!",
              icon: "warning",
              buttons: true,
              dangerMode: true,
          })
          .then((willCancel) => {
              if (willCancel) {



                  window.location.href = urlToRedirect;

              }


          });


      }
  </script>
      <!-- jQery -->
      <script src="home/js/jquery-3.4.1.min.js"></script>
      <!-- popper js -->
      <script src="home/js/popper.min.js"></script>
      <!-- bootstrap js -->
      <script src="home/js/bootstrap.js"></script>
      <!-- custom js -->
      <script src="home/js/custom.js"></script>
   </body>
</html>
