<x-app-layout>

</x-app-layout>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    @include('admin.css')
  </head>
  <body>

    <div class="container-scroller">
        <div class="row p-0 m-0 proBanner" id="proBanner">
          <div class="col-md-12 p-0 m-0">
            <div class="card-body card-body-padding d-flex align-items-center justify-content-between">
              <div class="ps-lg-1">
                <div class="d-flex align-items-center justify-content-between">
              </div>
            </div>
          </div>
        </div>
      <!-- partial:partials/_sidebar.html -->
     @include('admin.slidebar')
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_navbar.html -->
        @include('admin.header')
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div style="padding-left: 100px;  margin-bottom: 30px">
                    <form action="{{ url('search') }}" method="GET" >
                        @csrf
                        <input type="text" style="color: black" placeholder="search" name="search">
                        <input type="submit" value="Search"  class="btn btn-primary">
                    </form>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Payment</th>
                            <th>Delivery status</th>
                            <th>Image</th>
                            <th></th>
                            <th>Delivery</th>
                            <th>PDF</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($order as $order)


                        <tr>
                            <td>{{ $order->product_title }}</td>
                            <td>{{ $order->description }}</td>
                            <td>{{ $order->price }}</td>
                            <td>{{ $order->quantity }}</td>
                            <td>{{ $order->payement_status }}</td>
                            <td>{{ $order->delivery_status }}</td>
                            <td><img style="height:100px; width:100px; border-radius:0px"  src="/product/{{ $order->image }}" alt=""><td>
                            <td >
                                {{-- <a onclick="return confirm('Are You Sure To Delete')" href="{{ url('/delete_product', $order->id)}}"  ><button class="btn btn-danger">delete</button></a> --}}
                                @if ($order->delivery_status=='Processing')
                                    <a onclick="confirmation(event)" href="{{ url('/delivered', $order->id)}}"><button class="btn btn-success">Delivered</button></a>
                                @else
                                    <h3>Delivered</h3>
                                @endif


                            </td>
                            <td><a onclick="confirmation(event)" href="{{ url('/pdf', $order->id)}}"><button class="btn btn-success">PDF</button></a></td>
                            <td><a onclick="confirmation(event)" href="{{ url('/Send_email', $order->id)}}"><button class="btn btn-success">Send Email</button></a></td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    @include('admin.script')

    <script>
        function confirmation(ev) {
          ev.preventDefault();
          var urlToRedirect = ev.currentTarget.getAttribute('href');
          console.log(urlToRedirect);
          swal({
              title: "Are you sure!!",
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


    <!-- End custom js for this page -->
  </body>
</html>
