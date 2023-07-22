<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<title>Login to your account</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/all.css">
	<style type="text/css">
        .containerd{
        height: 700px;
        width: 100%;
        margin: 0px 0px;
        }
      .page{/* This class helps give the following things to form tag*/
        height: 480px; 
        width: 410px;
        margin-top: 80px;
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
        height: 40px;
        width: 320px;
        border-radius: 4px;
        margin-top: 15px;
        margin-left: 15px;

      }
      .text{/* This class helps give the following things to input tag*/
        font-size: 18px;
        font-weight: bold;
        margin-top: 15px;
        margin-left: 15px;
      }
      img{/* The the image tag is given 100% width and height using this*/
        height: 100%;
        width: 100%;
      }
      .box1{/* the class is created for the submit box*/
        background-color: black; 
        color: white; 
        border: 2px solid black;
        border-radius: 20px; 
        height: 40px;
        width: 300px;
        transition: 0.4s;
        font-weight: bold;
        font-size: 16px;
        margin-left: 25px;
        margin-top: 15px;
      }
      .box1:hover{/* the class is created and hover effect is given to the submit box*/
        background-color: white;
        color: black;
      }
      .error-message {
	color: red;
	align-content: center;
	text-align: center;
	margin-top: 100px;
	margin-left: 300px;
	background-color: black;
	font-size: 22px;
}

	.register-message {
		color: seagreen;
		align-content: center;
		text-align: center;
		margin-top: 10px;
		position: absolute;
	    top: 0;
	}
    </style>
</head>
<body>
	<% 
	String errorMessage = (String) request.getAttribute("errorMessage");
	String registerMessage = (String) request.getHeader("registerMessage");
	%>
	
		<div class="containerd">
      <!-- The below div is div for navigation bar for the webpage-->
      <nav class="navbar">
        <!-- Inside the navigation div there are three div in which first used for logo, second one for nav bar of pages and third for icons-->
        <div class="logo"><!-- logo is inserted here-->
            <a href="homepage.html"><img src="image/fff.png"></a>
        </div>
        <% if (registerMessage != null) { %>
		    <div class="register-message"><%= registerMessage %></div>
		<% } %>
	<div class="container">
		<% if (errorMessage != null) { %>
		    <div class="error-message"><%= errorMessage %></div>
		<% } %>
	</div>

        <!--Using this div icon are inserted to signup, when signup icon is clicked it will link to sigup page-->
    </nav>
      <!--Using this div the form kept at center-->
	<form action="LoginServlet" method="post" >
      <div class="form">
        <div style="height: 300px; width: 300px; margin-left: 200px;">
           <img src="image/fff.png">
        </div>
         <!--Using form tag a form is created, the form input are kept inside a div and it will be submitted after filling, and there is also option if user is already signed in then they can sign in-->
          <div class="page" name="messageForm">
            <div style=" margin-left: 20px;">
              <h2 style="margin-top: 30px; margin-bottom: 20px; margin-left: 15px;">Login to Account</h2>
              <br><label class="text">Username</label><br>
              <input class="box" type="text" name="userName" required><br><br>
              <label class="text">Password</label><br>
              <input class="box" type="password" name="userPwd" required><br><br>
              <input class="box1" type="submit" name="submit" value="login" onclick="myFunc1()">
            </div>
            <hr style=" margin-top: 40px; width: 54%; margin-left: 80px;">
            <p style=" margin-top: 10px; margin-left: 90px;">Don't have an account? <a href="pages/register.jsp"><span style="color: darkblue;">Sign Up</span></a></p>
          </div>
        </div>
        </form>
      <!--Using javascript the form validation is checked, the variable are get from forms, then if either of field is empty, empty message is popup or thank you message is popup-->
    </div> 
	</div>
</body>
</html>