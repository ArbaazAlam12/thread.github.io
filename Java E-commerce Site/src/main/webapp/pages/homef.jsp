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
	font-weight: bold;
	font-size: 14px;
	background-color: white;
	color: black;
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
  font-size: 14px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
  color: white;
  background-color: black;
  font-weight: bold;
}
.slideshow
      {
      width: 95%;
      height: 500px;
      margin: 20px auto;
      box-sizing: border-box;
      overflow: hidden;
      box-shadow: 5px 5px 10px 10px grey;
      }
      /* The the image tag is given 100% width and height using this*/
    img
      {
      width: 100%;
      height: 100%;
      }
      /* styling search bar */
    .search input[type=text]{
        width:300px;
        height:25px;
        border-radius:25px;
        border: 1px solid #000
    }
         
    .search{
        display: inline;
        margin:7px;
        height: 100px;
        width:30px;
    }
         
    .search button{
        background-color: #0074D9;
        color: #f2f2f2;
        float: right;
        padding: 5px 10px;
        margin-right: 16px;
        font-size: 12px;
        border: 1px solid #000;
        cursor: pointer;
        }
	.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
  margin-top: 100px;
}

.price {
  color: grey;
  font-size: 22px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card button:hover {
  opacity: 0.7;
}


li > form > input{
	text-align: center;
    white-space: normal;
    padding: 8px;
    margin: 7px;
}

.users-info {
	margin: 2%;
}

.alla{
	display: flex;
    flex-wrap: wrap;
    padding-left: 0;
    justify-content: space-around;
    gap: 30px;

}
	</style>
</head>

<body>
	<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/store" user="root" password=""/>
	
	<!-- Executing Query Using SQL Tag Library -->
	<sql:query var="allProduct" dataSource="${dbConnection}">
		SELECT product_name, cost, brand, description, product_category, cloth, quantity, image FROM products;
	</sql:query>
		
	<div class="container">
		<div class="flex-container">
			<h1 class="logo">
				<a><img src="image/fff.png" ></a>
			</h1>
			<ul class="navigation">
				<li><a href="../home.jsp">Home</a></li>
				<li><a href="home.jsp">Profile</a></li>
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
 

	<div class="slideshow">
    		<div id="img">
      			<img src="image/wo.png">
    		</div>
  		</div>
  		<div style="height:20px; width:1200px; display: flex; justify-content: center;">
  		<div class="search">
            <form action="#">
            <div style="height:40px; width:1200px; display: flex; justify-content: center;">
                <input type="text" placeholder=" Search Courses" name="search">
                <button style="height:30px; width:120px; background-color:black; margin-left: 10px; border-radius:4px;">Search</button>
             </div>
            </form>
        </div>
        </div>
        <div style="margin:2%;">
        <div class="alla">
        <c:forEach var="product" items="${allProduct.rows}">
        <div class="card">
  			<img src="${pageContext.request.contextPath}/uploads/product/${product.image}" style="width:100%">
  			<h1 style="margin-top: 20px;">Tailored Jeans</h1>
  			<p style="margin-top: 20px;" class="price">$19.99</p>
  			<p style="margin-top: 20px;">Some text about the jeans..</p>
  			<p style="margin-top: 20px;">
  			<button style="margin-top: 20px; border-radius: 3px;">Add to Cart</button></p>
		</div>
		
		
		</c:forEach>
		</div>
		</div>

	<script>
	    var images = ['image/boy.webp', 'image/first.webp', 'image/ch.webp', 'image/wo.png'];

	    var x = 0;
	    var imgs = document.getElementById('img');
	    setInterval(slideshow, 3000);

	    function slideshow() {

	      if (x < images.length) 
	        {
	        x = x + 1;
	        } 

	      else 
	        {
	        x = 1;
	        }


	      imgs.innerHTML = "<img src=" + images[x - 1] + ">";
	    }
  </script>
  	
</body>
</html>