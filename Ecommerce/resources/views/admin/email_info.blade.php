<x-app-layout>

</x-app-layout>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->

    @include('admin.css')
    <style>
        label{
            display: inline-block;
            width: 200px;
        }

    </style>

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

                <h1 style="text-align: center">Send Email {{ $order->email }}</h1>
                <form action="{{ url('send_emails', $order->id) }}" method="POST" >
                    @csrf
                    <div style="padding-left: 35%; margin-top: 20px">
                        <label for="">Email Greeting</label>
                        <input style="color: black" type="text" name="greeting">
                    </div>
                    <div style="padding-left: 35%; margin-top: 20px">
                        <label for="">Email first line</label>
                        <input style="color: black" type="text" name="firstline">
                    </div>
                    <div style="padding-left: 35%; margin-top: 20px">
                        <label for="">Email Body</label>
                        <input style="color: black" type="text" name="body">
                    </div>
                    <div style="padding-left: 35%; margin-top: 20px">
                        <label for="">Email Button</label>
                        <input style="color: black" type="text" name="btn">
                    </div>
                    <div style="padding-left: 35%; margin-top: 20px">
                        <label for="">Email url</label>
                        <input style="color: black" type="text" name="url">
                    </div>
                    <div style="padding-left: 35%; margin-top: 20px">
                        <label for="">Email last line</label>
                        <input style="color: black" type="text" name="lastline">
                    </div>
                    <div style="padding-left: 35%; margin-top: 20px">
                        <input style="color: black" type="submit" value="Send Email" class="btn btn-primary" name="url">
                    </div>
                </form>
            </div>
        </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    @include('admin.script')
    <!-- End custom js for this page -->
  </body>
</html>
