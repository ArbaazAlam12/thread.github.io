<!DOCTYPE html>
<html>
   <head>

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
   </head>
   <body >
        @include('home.header')
         <!-- slider section -->

            <div style="text-align: center">
                <div class="box" >

               <div class="img-box">
                  <img height="180px" width="400px" src="/product/{{ $product->iamge }}" alt="">
               </div>
               <div class="detail-box">
                  <h5 style="margin-top: 10px">
                     {{ $product->title }}
                  </h5>
                  <p>{{ $product->description }} </p>
                  <p>{{ $product->category }} </p>

                   @if ($product->discount_price!=null)

                       <h6 style="color:blue"> ${{ $product->discount_price }}</h6>
                       <h6 style="text-decoration: line-through; color:red" >
                           ${{ $product->price }}
                       </h6>
                   @else
                   <h6>
                       ${{ $product->price }}
                    </h6>

                   @endif

                   <form action="{{ url('add_cart', $product->id) }}" method="POST">
                    @csrf
                    <div class="row" style="margin-top: 40px; display:inline-block;">
                        <div class="col-md-4">
                            <input style="width: 80px" type="number" name="quantity" value="1" min="1">
                        </div>
                       <div class="col-md-4">
                        <input type="submit" value="Add To Cart">
                        </div>
                    </div>
                  </form>
               </div>
            </div>


      @include('home.footer')
      <!-- footer end -->
      <div class="cpy_">
         <p class="mx-auto">© 2021 All Rights Reserved By <a href="https://html.design/">Free Html Templates</a><br>

            Distributed By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>

         </p>
      </div>
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
