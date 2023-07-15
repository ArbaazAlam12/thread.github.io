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
      <div class="row p-0 m-0 proBanner" id="proBanner">
        <div class="col-md-12 p-0 m-0">
          <div class="card-body card-body-padding d-flex align-items-center justify-content-between">
            <div class="ps-lg-1">
              <div class="d-flex align-items-center justify-content-between">
            </div>
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
                <div class="div_center">
                    <h2 class="h2_font">Add Product</h2>


                    <form action="{{ url('/update_product',$product->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="gap">
                        <label for="">Product Title</label>
                        <input class="input_color" type="text" name="title" placeholder="Title" required value="{{ $product->title }}">
                    </div>
                    <div class="gap">
                        <label for="">Product Description</label>
                        <input class="input_color" type="text" name="description" placeholder="description" required value="{{ $product->description }}"/>
                    </div>
                    <div class="gap">
                        <label for="">Product Price</label>
                        <input class="input_color" type="number" name="price" placeholder="price" required value="{{ $product->price }}">
                    </div>
                    <div class="gap">
                        <label for="">Discount Price</label>
                        <input class="input_color" type="text" name="discount_price" placeholder="discount_price" min="0" value="{{ $product->discount_price }}">
                    </div>
                    <div class="gap">
                        <label for="">Product Quantity</label>
                        <input class="input_color" type="text" name="quantity" placeholder="quantity" min="0" required value="{{ $product->quantity }}">
                    </div>
                    <div class="gap">
                        <label for="">Product Category </label>
                        <select class="input_color" name="category" id=""  value="{{ $product->category }}" selected="">
                            @foreach ($category as $category)


                            <option value="{{ $category->category_name }}">{{ $category->category_name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="gap">
                        <label for="">Previous Image</label>
                        <img style="height: 100px; width:100px; margin: auto;" src="/product/{{ $product->iamge }}" alt="">
                    </div>

                    <div class="gap">
                        <label for="">Change Image</label>
                        <input class="input_color" type="file" name="iamge" placeholder="image">
                    </div>
                    <div class="gap">
                        <input type="submit" class="btn btn-primary" value="Update Product">
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
