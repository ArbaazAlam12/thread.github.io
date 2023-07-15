<x-app-layout>

</x-app-layout>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    @include('admin.css')
    <style>
    table{
        color: white;

    }
    td{
        color: white;
    }
    .image_size{
        width: 200px;
        height: 200px;
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
                <table class="table">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Discount Price</th>
                            <th>Category</th>
                            <th>Image</th>
                            <th></th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($product as $product)
                        <tr>
                            <td>{{ $product->title }}</td>
                            <td>{{ $product->description }}</td>
                            <td>{{ $product->price }}</td>
                            <td>{{ $product->discount_price }}</td>
                            <td>{{ $product->category }}</td>
                            <td><img style="height:100px; width:100px; border-radius:0px"  src="/product/{{ $product->iamge }}" alt=""><td>
                            <td>
                                <a onclick="confirmation(event)" href="{{ url('/delete_product', $product->id)}}"  ><button class="btn btn-danger">delete</button></a>

                                <a href="{{ url('/edit_product', $product->id)}}"><button class="btn btn-success">update</button></a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    @include('admin.script')
    <!-- End custom js for this page -->

  </body>
</html>
