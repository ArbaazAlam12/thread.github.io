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
      <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   </head>
   <body>
      <div class="hero_area">
        @include('sweetalert::alert')
        @include('home.header')

         <div>
            <table class="table">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Discount Price</th>
                        <th>Category</th>
                        <th>Image</th>
                        <th>Cancel Order</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($order as $order)


                    <tr>
                        <td>{{ $order->product_title }}</td>
                        <td>{{ $order->price }}</td>
                        <td>{{ $order->quantity }}</td>
                        <td>{{ $order->payement_status }}</td>
                        <td>{{ $order->delivery_status }}</td>
                        <td><img style="height:100px; width:100px;" src="/product/{{ $order->image }}" alt=""><td>
                        @if ($order->delivery_status=='Processing')
                            <td><a onclick="confirmation(event)" href="{{ url('cancel_order', $order->id) }}"  class="btn btn-primary">Cancel Order</a></td>
                        @else
                            <p>Delivered</p>
                        @endif

                    </tr>
                    @endforeach
                </tbody>
            </table>
         </div>

      </div>


      <!-- jQery -->
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
      <script src="home/js/jquery-3.4.1.min.js"></script>
      <!-- popper js -->
      <script src="home/js/popper.min.js"></script>
      <!-- bootstrap js -->
      <script src="home/js/bootstrap.js"></script>
      <!-- custom js -->
      <script src="home/js/custom.js"></script>
   </body>
</html>
