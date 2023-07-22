<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
  <link rel='stylesheet' type='text/css' media='screen' href="${pageContext.request.contextPath}/css/register.css"/>
    <title>signup</title>
  	<style type="text/css">
        .containerd{
        height: 700px;
        width: 100%;
        margin: 0px 0px;
        }
      .page{/* This class helps give the following things to form tag*/
        height: 630px; 
        width: 400px;
        box-sizing: border-box;
        overflow: hidden;
        border: 1px solid black;
        border-radius: 10px;
        margin-right: 200px;
      }
      .form{
        display: flex;
        justify-content: space-between;
        align-items: center;
    
      }
      .box{/* This class helps give the following things label tag*/
        height: 30px;
        width: 290px;
        border-radius: 4px;
        margin-top: 5px;
        opacity: 0.7;
        margin-left: 20px;

      }
      .text{/* This class helps give the following things to input tag*/
        font-size: 13px;
        font-weight: bold;
        opacity: 0.8;
        margin-left: 20px;
      }
      img{/* The the image tag is given 100% width and height using this*/
        height: 100%;
        width: 100%;
      }
      .box1{/* the class is created for the submit box*/
        background-color: black; 
        color: white; 
        border: 2px solid black;
        opacity: 0.8;
        border-radius: 20px; 
        height: 30px;
        width: 200px;
        transition: 0.4s;
        font-weight: bold;
        font-size: 16px;
        margin-left: 60px;
        margin-top: -15px;
      }
      .box1:hover{/* the class is created and hover effect is given to the submit box*/
        background-color: white;
        color: black;
      }

      *{
	font-family: 'Montserrat', sans-serif;
	margin: 0px;

}
.container{
    height: 90px;
	width: 95%;
    margin: 0px 0px;

}
img{
    width: 100%;
    height: 100%;
}
.navbar{/* This class is used to create navigation bar by giving following heights and width*/
	height: 90px;
	width: 95%;
    display: flex;
    justify-content: space-between;
    align-items: center;   
}
.logo{/* This class is used to create div for the logo*/
	width: 120px;
	height: 90px;
	position: relative;    
}

    </style>
    </head>
  <body>
    <!-- The below div is the main div or container div of the webpage-->
    <div class="containerd">
      <!-- The below div is div for navigation bar for the webpage-->
      <nav class="navbar">
        <!-- Inside the navigation div there are three div in which first used for logo, second one for nav bar of pages and third for icons-->
        <div class="logo"><!-- logo is inserted here-->
            <a href="homepage.html"><img src="../image/fff.png"></a>
        </div>
     

        <!--Using this div icon are inserted to signup, when signup icon is clicked it will link to sigup page-->
     
    </nav>
      <!--Using this div the form kept at center-->
      <form action="${pageContext.request.contextPath}/UserRegister" method="post" ENCTYPE="multipart/form-data">  
      <div class="form">
        <div style="height: 300px; width: 300px; margin-left: 200px; margin-top: -100px;">
           <img src="../image/fff.png">
        </div>
         <!--Using form tag a form is created, the form input are kept inside a div and it will be submitted after filling, and there is also option if user is already signed in then they can sign in-->
          <div class="page" name="messageForm">
            <div style=" margin-left: 20px;">
              <h3 style="margin-top: 20px; margin-left: 20px">Create account</h3>
              <br><label class="text">Name </label><br>
              <input class="box" type="text" name="name" size=24 required><br><br>
              <label class="text">Username</label><br>
              <input class="box" type="text" name="username" size=24 required><br><br>
              <label class="text">Phone Number</label><br>
              <input class="box" type="text" name="num" size=24 required><br><br>
              <label class="text">Password</label><br>
              <input class="box" type="password" name="password" size=24 placeholder="Please enter aleast 6 charaters" required><br><br>
              <label class="text">Role</label><br>
              <input class="box" type="text" name="role" size=24 required><br><br>
              <label class="text">Upload Image</label><br>
              <input type="file" value="" name="image" size=24 style="margin-top: 5px; margin-left: 20px"><br><br><br>
              <input class="box1" type="submit" name="submit" value="insert" onclick="myfunc()">
            </div>
            <hr style=" margin-top: 25px; width: 50%; margin-left: 90px;">
            <p style=" margin-top: 10px; margin-left: 75px;">Already have an account? <a href="view/login.jsp"><span style="color: darkblue;">Sign in</span></a></p>
          </div>
        </div>
        </form> 
      <!--Using javascript the form validation is checked, the variable are get from forms, then if either of field is empty, empty message is popup or thank you message is popup-->
    </div> 
  </body>
</html>