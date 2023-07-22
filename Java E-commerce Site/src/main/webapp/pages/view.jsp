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
	String product_name = (String) session.getAttribute("product_name");

	// Creating new database model object
	DbConnection dbConn = new DbConnection();

	// Deleting item on database when delete button is clicked.
	if (request.getParameter("deleteId") != null) {
	    String id = request.getParameter("deleteId");
	    dbConn.deleteProduct(MyConstants.DELETE_PRODUCT, id);
	    
	}
	else if(request.getParameter("updateId") != null){
		response.sendRedirect(request.getContextPath( )+ "/pages/updateProduct.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Product List </title>
<style>

.flex-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background: white;
}

.logo {
	margin: 0 0 0 .45em;
	height: 90px;
	width: 110px;
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

li>form {
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
	font-size: 1px;
	
}
img{
	width: 100%;
	height: 100%;
}

table {
  border-collapse: collapse;
  width: 100%;
  margin-top: 30px;
}

thead th {
  background-color: #f2f2f2;
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
   text-align: center;
}
tr{
	 text-align: center;
}

tbody tr:nth-child(even) {
  background-color: #f2f2f2;
  justify-text: center;
}

tbody td {
  border: 1px solid #ddd;
  padding: 8px;
text-align: center;
}

tbody td img {
  max-width: 100%;
  height: auto;
}

tbody td:last-child {
  text-align: center;
  border-radius: 5px;
}

tbody td:last-child button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 8px 16px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  cursor: pointer;
  
}

tbody td:last-child button:hover {
  background-color: #3e8e41;
}

tbody td:last-child button:last-child {
  background-color: #f44336;
}

tbody td:last-child button:last-child:hover {
  background-color: #c62828;
  
}
.ee{
	border-radius: 5px; 
	height: 35px; 
	width: 80px;
	
}
.ee:hover{
	background-color: black;
	color: white;
}


    </style>

</head>
<body>
        <div class="flex-container">
			<h1 class="logo">
				<a><img src="../image/fff.png"></a>
			</h1>
			<ul class="navigation">
				<li><a href="addProduct.jsp">Add Product</a></li>
				<li><a href="#">View Product</a></li>
				<li><a href="#">Order List</a></li>
				<li><a href="../admin.jsp">Home</a></li>
			</ul>
		</div>
<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/store" user="root" password=""/>
	
	<!-- Executing Query Using SQL Tag Library -->
	<sql:query var="allProduct" dataSource="${dbConnection}">
		SELECT product_name, cost, brand, brand, product_category, cloth, quantity, image FROM products;
	</sql:query>

 <table style="margin-top: 30px">
 <thead>
 <tr>
 <th>Name</th>
 <th>CitizenNUmber</th>
 <th>Address</th>
 <th>ContactNumber</th>
 <th>JOBLOcation</th>
 <th>Desigination</th>
    <th style="height: 60px; width: 250px">PIC</th>
 <th colspan=2>Action</th>
 </tr>
 </thead>
 <tbody>
<c:forEach var="product" items="${allProduct.rows}">
 <tr>
 <td><c:out value="${product.product_name}" /></td>
 <td><c:out value="${product.cost}" /></td>
 <td><c:out value="${product.brand}" /></td>
 <td><c:out value="${product.product_category}" /></td>
 <td><c:out value="${product.cloth}" /></td>
 <td><c:out value="${product.quantity}" /></td>
    <td><img src="${pageContext.request.contextPath}/uploads/product/${product.image}" width="100" height="200" alt="load"></td>


 
 <td>
	 <form method="post">
		 <input type="hidden" name="updateId" value="${product.product_name}" />
		 <button class="ee" type="submit">Update</button>
	 </form>
 </td>
 <td>
 	<form method="post">
	     <input type="hidden" name="deleteId" value="${product.product_name}" />
	     <button style="border-radius: 5px;" type="submit">Delete</button>
     </form>
     </td>
 </tr>
 </c:forEach>
 </tbody>
 </table>

 
</body>
</html>