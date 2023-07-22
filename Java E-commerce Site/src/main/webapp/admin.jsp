<%@page import="resources.MyConstants"%>
<%@page import="model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="controller.dbconnection.DbConnection"%>
<%@page import="controller.statemanagement.SessionManage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%!SessionManage mySession = new SessionManage();%>
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
} else if (request.getParameter("updateId") != null) {
	response.sendRedirect(request.getContextPath() + "/pages/updateCus.jsp");
}
%>
<style>
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen' href='css/all.css'>
<script src='main.js'></script>
<style>
.flex-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: white;
}

.logo {
	margin: 0 0 0 .45em;
}

.logo a {
	color: rgb(28, 24, 22);
}

.logo, .navigation {
	list-style: none;
	text-transform: uppercase;
}

.logo a, .navigation a {
	text-decoration: none;
	letter-spacing: .45rem;
}

.navigation {
	display: flex;
}

.navigation a {
	display: block;
	padding: 1em;
	color: black;
}

.navigation a:hover {
	background: black;
	opcaity:0.7;
	color: white;
	border-radius: 10px;
	font-weight: bold;
}

/* *********** media queries *********** */
@media all and (max-width: 990px) {
	.flex-container {
		flex-direction: column;
	}
	.logo {
		margin: 0;
	}
	.navigation {
		width: 100%;
		justify-content: space-around;
	}
}

/* ****** ****** */
@media all and (max-width: 600px) {
	.logo {
		margin: .25em 0;
		align-self: left;
		/* align the logo to the left side of 'flex-container' */
	}
	.navigation {
		flex-direction: column;
	}
	.navigation a {
		text-align: center;
		padding: 10px;
		border-top: 1px solid rgba(255, 255, 255, 0.3);
		border-bottom: 1px solid rgba(0, 0, 0, 0.1);
	}
	.navigation li:last-of-type a {
		border-bottom: none;
	}
}

li>form>input {
	text-align: center;
	white-space: normal;
	padding: 8px;
	margin: 7px;
}

.car1 {
	height: 550px;
	width: 100%;
	background-image: url("image/mm.jpg");
	background-size: contain;
}
.ss{
	height: 40px;
	width: 100px;
	background-color: black;
	color: white;
	border-radius: 4px;
}
.ss:hover{
	background-color: white;
	color: black;
	font-weight: bold;
	font-size: 14px;
	
}
</style>
</head>
<body>
	<div class="container">
		<div class="flex-container">
			<h1 class="logo">
				<a><img src="image/fff.png"></a>
			</h1>
			<ul class="navigation">
				<li><a href="pages/addProduct.jsp">Add Product</a></li>
				<li><a href="pages/view.jsp">View Product</a></li>
				<li><a href="#">Order List</a></li>
				<li>
					<form action="
					<%if (!mySession.checkUser(user)) {
						out.print(mainPath);%>/login.jsp<%} 
					else {
							out.print(mainPath);%>/LogoutServlet<%}%>" method="post">
						<input class="ss" type="submit" value="
		    			<%if (mySession.checkUser(user)) {%>
				    		Logout
				   		<%} else {%>
				    		Login
				   		<%}%>
			   		" />
					</form>
				</li>
			</ul>
		</div>
	</div>
	<div class="main">
		<div class="car1">
			<p class="aa">Welcome to Admin Page</p>
		</div>
		<div class="parts">
			<div class="is"
				style="background-image: url(image/zz.png); width: 500px;">
				<div class="text1">
					<a href="addProduct.jsp"><p style="color: white; margin-left: 100px;">Add Product</p></a>
				</div>
			</div>
			<div class="is"
				style="background-image: url(image/tt.png); width: 500px;">
				<div class="text1">
					<a href="view.jsp"><p style="color: white; margin-left: 100px;">View
							Product</p></a>
				</div>
			</div>
		</div>
	</div>
	<div class="dic">
		<footer style="margin-top: -400px;">
			<div style="height: 100px; width: 100%;">
				<div
					style="height: 40px; width: 30%; float: left; margin-left: 30px; margin-top: 10px;">
					<p style="font-size: 12px;">Copyright &copy</p>
					<br>
					<p style="font-size: 12px";>All rights reserved</p>
				</div>
				<div align="center"
					style="height: 100px; width: 30%; float: left; margin-left: 30px; margin-top: 10px;">
					<p style="font-size: 14px; font-weight: bold;">About Us</p>
					<p style="font-size: 12px; margin-top: 10px">Privacy Policy</p>
					<p style="font-size: 12px; margin-top: 5px">Terms & Condition</p>
					<p style="font-size: 12px; margin-top: 5px">Help</p>
				</div>
				<div align="right"
					style="height: 40px; width: 30%; float: right; margin-left: 30px; margin-top: 10px; margin-right: 20px;">
					<p style="font-size: 14px; margin-top: 5px; font-weight: bold;">Contact
						Us</p>
					<p style="font-size: 12px; margin-top: 10px;">Phone Number:
						9818613211</p>
					<p style="font-size: 12px; margin-top: 5px;">Address:
						Sorakhutte, Kathmandu</p>
					<p
						style="font-size: 16px; margin-right: 15px; margin-bottom: 5px; margin-top: 10px;">Visit
						us</p>
					<div
						style="height: 20px; width: 5%; float: right; margin-right: 10px;">
						<a href=""><img src="image/fac.png"></a>
					</div>
					<div
						style="height: 20px; width: 5%; float: right; margin-left: 10px; margin-right: 5px;">
						<a href=""><img src="image/insta.png"></a>
					</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>