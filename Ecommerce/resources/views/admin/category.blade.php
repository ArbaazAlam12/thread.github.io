<x-app-layout>

</x-app-layout>
<!DOCTYPE html>
<html lang="en">
  <head>
    <style>
        .div_center{
            text-align: center;
            padding-top: 40px;
        }
        .h2_font{
            font-size: 30px;
            padding-bottom: 30px;
            font-weight: bold;
        }
        .input_color{
            color: black;
        }
        .center{
          margin: auto;
          width: 50%;
          text-align: center;
          margin-top: 30px;
          border: 3px solid white;
        }
    </style>
    <!-- Required meta tags -->
    @include('admin.css')
  </head>
  <body>
    @include('sweetalert::alert')
    <div class="container-scroller">
      <!-- partial:partials/_sidebar.html -->
     @include('admin.slidebar')
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_navbar.html -->
        @include('admin.header')
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="div_center">
                    <h2 class="h2_font">Add Category</h2>
                    <form action="{{ url('/add_category') }}" method="POST">
                    @csrf
                        <input class="input_color" type="text" name="category" placeholder="Category Name">
                        <input class="btn btn-primary" type="submit" name="submit" value="Add Category">
                    </form>
                </div>
                <table class="center">
                  <tr>
                    <td>Category name</td>
                    <td>Action </td>
                  </tr>
                  @foreach ($data as $data)
                  <tr>
                    <td>{{ $data->category_name }}</td>
                    <td>
                      <a onclick="confirmation(event)" class="btn btn-danger" href="{{ url('delete_category', $data->id) }}">Delete</a>
                    </td>
                  </tr>
                  @endforeach
                </table>
            </div>
        </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    @include('admin.script')
    <!-- End custom js for this page -->

  </body>
</html>
