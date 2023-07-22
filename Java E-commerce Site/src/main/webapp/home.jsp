<%@page import="resources.MyConstants"%>
<%@page import="model.Customer"%>
<%@page import="java.util.List"%>
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
	<meta charset="ISO-8859-1">
	<title>Welcome to E-commerce</title>
	<link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath}/css/all.css"/>
	<style type="text/css">
	
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
	opacity:0.7;
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
	
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 400px;
  margin: auto;
  text-align: center;
  margin-top: 40px;
  border-radius: 3px;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 16px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
  color: white;
  background-color: black;
  font-weight: bold;
}
	

	</style>
</head>

<body>
	<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/store" user="root" password=""/>
	
	<!-- Executing Query Using SQL Tag Library -->
	<sql:query var="allUser" dataSource="${dbConnection}">
		SELECT name, username, contact_number, image  FROM register as r WHERE r.username='${user}';
	</sql:query>
		
	<div class="container">
		<div class="flex-container">
			<h1 class="logo">
				<a><img src="image/fff.png" ></a>
			</h1>
			<ul class="navigation">
				<li><a href="pages/addProduct.jsp">Home</a></li>
				<li><a href="pages/view.jsp">Profile</a></li>
				<li><a href="#">Cart</a></li>
				<li><a href="#">Order</a></li>
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
 

	<div class="users-info">
 	    <div class="users">
 	    <c:forEach var="user" items="${allUser.rows}">
            <div class="card">
                <img style="border-radius: 25px;" src="${pageContext.request.contextPath}/uploads/users/${user.image}" class="card-img-top" alt="...">
                <div class="card-body">
                	<div style="display:flex; justify-content: center; background-color: #F0F8FF; height: 30px; margin-top: 10px" >
	                	<h3>Name:</h3>
	                	<h4 class="card-title" style="margin-top: 2px; margin-left: 10px;">${user.name}</h4><br>
                	</div>
                    <div style="display:flex; justify-content: center; background-color: #F0F8FF; height: 30px; margin-top: 10px" >
	                	<h3>Username:</h3>
	                	<h4 class="card-title" style="margin-top: 2px; margin-left: 10px; ">${user.username}</h4><br>
                	</div>
                	<div style="display:flex; justify-content: center; background-color: #F0F8FF; height: 30px; margin-top: 10px" >
	                	<h3>Contact Number:</h3>
	                	<h4 class="card-title" style="margin-top: 2px; margin-left: 10px;">${user.contact_number}</h4><br>
                	</div>
                </div>
                <form method="post">
                        <input type="hidden" name="updateId" value="${user.username}" />
                        <button type="submit" style="margin-top: 20px; border-radius:5px; height: 40px;">Update</button>
           
               	</form>
            </div>
      	</c:forEach>
        </div>
	</div>
  	
</body>
</html>