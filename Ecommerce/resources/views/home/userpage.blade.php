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
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   </head>
   <body>
    @include('sweetalert::alert')
      <div class="hero_area">
        @include('home.header')
         <!-- slider section -->
        @include('home.slider')
         <!-- end slider section -->
      </div>
      <!-- why section -->
      @include('home.why')
      <!-- end why section -->

      <!-- arrival section -->
      @include('home.arrival')
      <!-- end arrival section -->

      <!-- product section -->
      <div style="padding-left: 100px;  margin-bottom: 30px; margin-top: 40px; text-align: center">
        <form action="{{ url('product_search') }}" method="GET" >
            @csrf
            <input style="height: 40px; width: 600px" type="text" style="color: black" placeholder="search" name="search">
            <input type="submit" value="Search"  class="btn btn-primary">
        </form>
    </div>
      @include('home.product')
      <!-- end product section -->
{{--
      Comment here --}}
      <div style="text-align: center; padding-bottom: 30px">
        <h1 style="text-align: center; font-size: 20px">Comments</h1>
        <form action="{{ url('add_comment') }}" method="POST">
            @csrf
            <textarea style="height: 150px; width: 600px" name="comment" placeholder="Comment here"></textarea><br>
            <input type="submit" class="btn btn-primary" value="Comment">
        </form>
      </div>
      <div style="margin-left: 40px; padding-bottom: 30px; box-shadow: 1px 1px 1px 1px grey">

            <h1 style="font-size: 22px; text-align: center;"><b>All Comments</b></h1>



            @foreach ($comment as $comment)


            <div>
                <b>{{ $comment->name }}</b>
                <p>{{ $comment->comment }}</p>

                <a href="javascript::void(0)" onclick="reply(this)" data-Commentid="{{ $comment->id }}">Reply</a>
                @foreach ($reply as $rep)
                @if ($rep->comment_id==$comment->id)
                    <div style="padding-left: 3%; padding-bottom:10px; padding-top:10px;">
                    <b>{{ $rep->name }}</b>
                    <p>{{ $rep->reply }}</p>
                    <a href="javascript::void(0)" onclick="reply(this)" data-Commentid="{{ $comment->id }}">Reply</a>
                    </div>
                @endif
                @endforeach
            </div>
            @endforeach

            <div style="margin-top: 20px; display:none;" class="replydiv">
                <form action="{{ url('add_reply') }}" method="POST">
                @csrf
                    <input hidden type="text" name="commentId" id="commentId">
                    <textarea style="height: 100px; width: 500px;" placeholder="write" name="reply"></textarea><br>
                    <button type="submit" class="btn btn-warning">Reply</button>
                    <a href="javascript::void(0)" class="btn btn-danger" onclick="reply_close(this)">Close</a>
                </form>
            </div>
      </div>



      <!-- subscribe section -->
      @include('home.suscribe')
      <!-- end subscribe section -->
      <!-- client section -->
      @include('home.client')
      <!-- end client section -->
      <!-- footer start -->
      @include('home.footer')
      <!-- footer end -->
      <div class="cpy_">
         <p class="mx-auto">© 2021 All Rights Reserved By <a href="https://html.design/">Free Html Templates</a><br>

            Distributed By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>

         </p>
      </div>
      <script type="text/javascript">
        function reply(caller){
            document.getElementById('commentId').value=$(caller).attr('data-Commentid');
            $('.replydiv').insertAfter($(caller));
            $('.replydiv').show();
        }

        function reply_close(caller){
            $('.replydiv').hide();
        }

      </script>

    <script>
        document.addEventListener("DOMContentLoaded", function(event) {
            var scrollpos = localStorage.getItem('scrollpos');
            if (scrollpos) window.scrollTo(0, scrollpos);
        });

        window.onbeforeunload = function(e) {
            localStorage.setItem('scrollpos', window.scrollY);
        };
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
