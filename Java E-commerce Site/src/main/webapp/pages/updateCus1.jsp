 <%@page import="resources.MyConstants"%>
<%@page import="model.Customer"%>
<%@page import="model.PasswordEncryptionWithAes"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@page import="controller.dbconnection.DbConnection"%>
<%@page import="controller.statemanagement.SessionManage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
<%! SessionManage mySession = new SessionManage(); %>
<% 
	//setting absolute path
	String mainPath = request.getContextPath();
	// invoking session username
	String user = (String) session.getAttribute("user");

	// Creating new database model object
	DbConnection dbConn = new DbConnection();
	

	// Deleting item on database when delete button is clicked.
	if (request.getParameter("deleteId") != null) {
	    String id = request.getParameter("deleteId");
	    dbConn.deleteUser(MyConstants.DELETE_USER, id);
	}
	else if(request.getParameter("updateId") != null){
		response.sendRedirect(request.getContextPath( )+ "/pages/updateCus.jsp");
	}
%>
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
        height: 800px; 
        width: 410px;
        box-sizing: border-box;
        overflow: hidden;
        border: 1px solid black;
        border-radius: 10px;
        margin-top: 20px;
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
        margin-top: 5px;
        opacity: 0.7;
        margin-left: 20px;

      }
      .text{/* This class helps give the following things to input tag*/
        font-size: 18px;
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
        height: 40px;
        width: 300px;
        transition: 0.4s;
        font-weight: bold;
        font-size: 16px;
        margin-left: 30px;
      }
      .box1:hover{/* the class is created and hover effect is given to the submit box*/
        background-color: white;
        color: black;
      }
      .alert {
        padding: 20px;
        background-color: #393737;
        color: white;
        opacity: 1;
        transition: opacity 0.6s;
        margin-bottom: 15px;
        height: 20px;
        width: 300px;
        margin-right: auto;
        margin-left: auto;
      }

      .alert.success {background-color: #4CAF50;}
      .alert.info {background-color: #2196F3;}
      .alert.warning {background-color: #ff9800;}

      .closebtn {
          margin-left: 15px;
          color: white;
          font-weight: bold;
          float: right;
          font-size: 22px;
          line-height: 20px;
          cursor: pointer;
      }

      .closebtn:hover {
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
.table{/* This class is used to create table having four column in one row which is used to create the navbar pages*/
	width: 700px;
	height: 40px;
    margin-left: 200px;
}
table th{
    margin: 20px;
    display: inline;
	font-size: 17px;
	opacity: 0.7;
	align-items: center;
	overflow: hidden;
}
.icon{/* This class is used to create icon div*/
	width: 100px;
	height: 40px;
    position: relative;
    display: flex;
    justify-content: space-between;

}
a{/* the text decoration of link hyper link tag is removied and color is given*/
	text-decoration: none;
	color: black;
}
tr th a:hover{/* The a tag is given hover effect*/
	border-bottom: 2px solid black;
	transition: 0.2s;
	color: rgb(79, 77, 77);
}
.iconimg{/*The class is made for icon in the navigation bar for all the image*/
	height: 30px;
	width: 28px;
    display: inline-block;
	box-sizing: border-box;

}
.btns{
	padding: auto;
	border-radius: 4px;
	font-size: 15px;
	   
}
button:hover{
	background-color: rgb(230, 230, 230);
	transition: 0.1s;
	color: aliceblue;

}
.para{/*the class is created for signup at the bottom of page */
	margin-top: 10px; 
	height: 22px; 
	width: 150px;
	background-color: black; 
	color: white; 
	border-radius: 2px solid black;
	border-radius: 5px;
	transition: 0.4s;
}
.para:hover{/* Hover effect is given to the class for signup at the bottom of page */
	background-color: #C7C7C8;
	color: black;
}

.main{
	
	height: 1000px;
	width: 100%;

}
.car{
	height: 600px;
	width: 100%;
	background-image: url("image/aa.jpg");
	background-size: cover;
}
.aa{
	position: absolute;
	top: 25%;
	left: 60%;
	transform: translate(-50%, -50%);
	font-size: 36px;
	font-weight: bolder;
	font-family: Georgia;
	opacity: 0.7;
	animation-name: example;
  	animation-duration: 4s;
	display: flex;
}
.aab{
	position: absolute;
	top: 35%;
	left: 63.5%;
	transform: translate(-50%, -50%);
	font-size: 20px;
	font-weight: bold;
	font-family: "Georgia";
	opacity: 0.7;
	line-height: 1.6;
	animation-name: example;
  	animation-duration: 4s;
}
@keyframes example {
	from {opacity: 0.1; left: 0.9;}
	to {opacity: 1;}
	0%   {left: 20%;}
    50%  {left: 50%;}
  }

.parts{
	height: 450px;
	width: 100%;
	display: flex;
	justify-content: space-around;
	align-items: center;
	margin-bottom: -50px;
	
}
.is{
	background-color: black;
	height: 300px;
	width: 380px;
	background-size: cover;
	border-radius: 4px;
	box-shadow: 5px 5px 5px 5px rgb(111, 109, 109);
	
}
.text1{
	width: 250px;
	margin-top: 135px;
	margin-left: 105px;
	font-size: 20px;
	font-weight: bold;
	color: white;
	opacity: 0.6;
	font-family: "Georgia";
}
.is:hover{
	opacity: 0.6;
}
.dic{
	margin-top: 480px;
	height: 160px;
	background-color: #C7C7C8;

}
.h1s{
	height: 400px;
	width: 400px;
	margin-top: -50px;
}
.h2s{
	height: 500px;
	width: 500px;
}

      
    </style>
    </head>
  <body>
  <sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/store" user="root" password=""/>
	
	<!-- Executing Query Using SQL Tag Library -->
	<sql:query var="allUser" dataSource="${dbConnection}">
		SELECT name, username, contact_number, password, role, image  FROM register as r WHERE r.username='${user}';
	</sql:query>
    <!-- The below div is the main div or container div of the webpage-->
    <div class="containerd">
      <!-- The below div is div for navigation bar for the webpage-->
      <nav class="navbar">
        <!-- Inside the navigation div there are three div in which first used for logo, second one for nav bar of pages and third for icons-->
        <div class="logo"><!-- logo is inserted here-->
            <a href="homepage.html"><img src="image/a.png"></a>
        </div>
     

        <!--Using this div icon are inserted to signup, when signup icon is clicked it will link to sigup page-->
   
    </nav>
      <!--Using this div the form kept at center-->
      <div class="alert" style="display: none;" id="div2">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <p style="text-align: center;">Please fill all the fields correctly.</p>
      </div>
      <form action="${pageContext.request.contextPath}/UserRegister" method="post" ENCTYPE="multipart/form-data"> 
      <div class="form">
        <div style="height: 300px; width: 300px; margin-left: 200px; margin-top: -100px;">
           <img src="../image/a.png">
           <p style="font-size: 22px; margin-left: 50px;">Transportation Company</p>
        </div>
         <!--Using form tag a form is created, the form input are kept inside a div and it will be submitted after filling, and there is also option if user is already signed in then they can sign in-->
          
          <div class="page" name="messageForm">
          <c:forEach var="user" items="${allUser.rows}">
            <div style=" margin-left: 20px;">
             <%
              //username str and pass str from the above executed query
              	//List<Map<String, Object>> result = (List<Map<String, Object>>) pageContext.getAttribute("allUser");
				//Map<String, Object> row = result.get(0);
             	String userName=((Map<String, Object> )(request.getAttribute("user"))).get("username").toString();
             	String pass=((Map<String, Object> )(request.getAttribute("user"))).get("password").toString();
             	String decPassword= PasswordEncryptionWithAes.decrypt(pass, userName);
              
              %>
              <%=decPassword %>
              <h2 style="margin-top: 20px; margin-left: 20px">Create account</h2>
              <br><label class="text">Name </label><br>
              <input class="box" type="text" name="name" value="${user.name}"  size=24 required><br><br>
              <label class="text">Username</label><br>
              <input class="box" type="text" name="username" value="${user.username}" size=24 required ><br><br>
              <label class="text">Phone Number</label><br>
              <input class="box" type="text" name="num" size=24 value="${user.contact_number}" required><br><br>
              <label class="text">Password</label><br>
             
              
              <input class="box" type="password" name="password" size=24 placeholder="Please enter aleast 6 charaters" value=<%=decPassword %>><br>
              <label class="text">Role</label><br>
              <input class="box" type="text" name="role" size=24 required><br><br>
              <label class="text">Upload Image</label><br>
              <input type="file" value="" name="image" size=24 style="margin-top: 20px; margin-left: 20px"><br><br><br>
              <input class="box1" type="submit" name="" value="insert" onclick="myfunc()">
            </div>
            </c:forEach>
            <hr style=" margin-top: 40px; width: 50%; margin-left: 90px;">
            <p style=" margin-top: 10px; margin-left: 75px;">Already have an account? <a href="view/login.jsp"><span style="color: darkblue;">Sign in</span></a></p>
          </div>
        </div>
        </form> 
      <!--Using javascript the form validation is checked, the variable are get from forms, then if either of field is empty, empty message is popup or thank you message is popup-->
    </div> 
  </body>
</html>