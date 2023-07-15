<x-app-layout>

</x-app-layout>
<!DOCTYPE html>
<html lang="en">
  <head>
    <style>
        .center{
          margin: auto;
          width: 50%;
          text-align: center;
          margin-top: 30px;
          border: 3px solid white;
        }
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
        label{
            display: inline-block;
            width: 200px;
        }
        .gap{
            margin-top: 20px;
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
        <div class="main-panel" style="margin-top: -30px">

            <div class="content-wrapper">
                <div class="div_center">
                    <h2 class="h2_font">Add Product</h2>

                    <form action="{{ url('/add_product') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="gap">
                        <label for="">Product Title</label>
                        <input class="input_color" type="text" name="title" placeholder="Title" required>
                    </div>
                    <div class="gap">
                        <label for="">Product Description</label>
                        <input class="input_color" type="text" name="description" placeholder="description" required>
                    </div>
                    <div class="gap">
                        <label for="">Product Price</label>
                        <input class="input_color" type="number" name="price" placeholder="price" required>
                    </div>
                    <div class="gap">
                        <label for="">Discount Price</label>
                        <input class="input_color" type="text" name="discount_price" placeholder="discount_price" min="0">
                    </div>
                    <div class="gap">
                        <label for="">Product Quantity</label>
                        <input class="input_color" type="text" name="quantity" placeholder="quantity" min="0" required>
                    </div>
                    <div class="gap">
                        <label for="">Product Category </label>
                        <select class="input_color" name="category" id="" required required>
                            @foreach ($category as $category)


                            <option value="{{ $category->category_name }}">{{ $category->category_name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="gap">
                        <label for="">Product Image</label>
                        <input class="input_color" type="file" name="iamge" placeholder="image" required>
                    </div>
                    <div class="gap">
                        <input type="submit" class="btn btn-primary" value="Add Product">
                    </div>
                </form>
                </div>

            </div>
        </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    @include('admin.script')
    <!-- End custom js for this page -->
  </body>
</html>
