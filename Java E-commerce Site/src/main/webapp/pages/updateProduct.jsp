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
	String product_name1 = (String) session.getAttribute("product_name");

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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../css/all.css'>
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
		margin-left: 100px;
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
        .frm{
        
            height: 700px;
            width: 800px;
            margin: auto;
            align-items: center;
            justify-content: center;
            margin-top: 50px;
            
        }
        .sfrm{
            height: 700px;
            width: 700px;
            border: 2px solid black;
            border-radius: 4px;
            box-shadow: 5px 5px 5px 5px rgb(127, 127, 127);
        }
        .ainput{
            width: 250px;
            height: 30px;
            border: 2px solid rgb(146, 146, 146);
            border-radius: 3px;
        }
        .rin{
            width: 15px;
            height: 15px;
        }
        .spac{
            display: flex;
            justify-content: space-evenly;
            margin: 30px;
        }
        button:hover{
            opacity: 0.7;
        }
    </style>
</head>
<body>
<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/store" user="root" password=""/>
	
	<!-- Executing Query Using SQL Tag Library -->
	<sql:query var="allProduct" dataSource="${dbConnection}">
		SELECT product_name, cost, brand, description, product_category, cloth, quantity, image FROM products as r WHERE r.product_name='${product_name}';
	</sql:query>
    <div class="container">
        <div class="flex-container">
			<h1 class="logo">
				<a><img src="../image/fff.png"></a>
			</h1>
			<ul class="navigation">
				<li><a href="#">Add Product</a></li>
				<li><a href="view.jsp">View Product</a></li>
				<li><a href="../admin.jsp">Home</a></li>
				<li><a href="#">Order List</a></li>
			</ul>
		</div>
</div>

<div style="height: 850px; width: 100%;">
    <div class="frm">
    
        <form class="sfrm" action="${pageContext.request.contextPath}/addProduct" method="post" ENCTYPE="multipart/form-data">
            <div style="margin-top: 30px; text-align: center; margin-bottom: 40px;">
        
            
                <h1>Add product</h1>
            </div>
            
            <div class="spac">
                <input class="ainput" placeholder="Product name" name="pname" value="${allProduct.product_name}" size="24">
                <input class="ainput" placeholder="Product cost" name="cost" size="24">
            </div>
            <h4 style="margin-top: 30px; margin-left: 70px;">Product Description: </h4>
            <div class="spac">
          		<textarea placeholder="Description" name="description" rows="4" cols="50"></textarea>
            </div>
            
            <div class="spac">
				<input class="ainput" placeholder="Brand" name="brand" size="24">
				<input class="ainput" placeholder="Quantity" name="quantity" size="24">           
            </div>
            <div class="spac">
           		
           		<select style="width: 560px; height: 35px;" name="category">
                    <option value="1" >Product Category</option>
                    <option value="Pant">Pant</option>
                    <option value="Tshirt">Tshirt</option>
                    <option value="Kurta">Kurta</option>
                    <option value="Sari">Sari</option>
                    <option value="Jacket">Jacket</option>
                </select>
            </div>
            <div class="spac">

            	<select style="width: 560px; height: 35px;" name="clothing">
                    <option value="1" >Product For</option>
                    <option value="Man">Man</option>
                    <option value="Women">Women</option>
                    <option value="Children">Children</option>
                </select>
            </div>
            
            <div class="spac">
				<input type="file" name="image1" size=24>
			</div>
            <div style="margin-top: 40px; margin-left: 70px; height: 200px; width: 200px;">
              <button style="height: 35px; width: 150px; background-color: black; color: white; border-radius: 5px;" name="submit" value="add">Submit</button>
            </div>
        </form>
    </div>
</div>
<div class="dic">
    <footer style="margin-top: -600px;">
        <div style="height: 100px; width: 100%;">
            <div style="height: 40px; width: 30%; float: left; margin-left: 30px; margin-top: 10px;">
                <p style="font-size: 12px;">Copyright &copy</p><br>
                <p style="font-size: 12px";> All rights reserved </p>
            </div>
            <div align="center" style="height: 100px; width: 30%; float: left; margin-left: 30px; margin-top: 10px;">
                <p style="font-size: 14px; font-weight: bold;">About Us</p>
                <p style="font-size: 12px; margin-top: 10px">Privacy Policy</p>
                <p style="font-size: 12px; margin-top: 5px">Terms & Condition</p>
                <p style="font-size: 12px; margin-top: 5px">Help</p>
            </div>
            <div align="right" style="height: 40px; width: 30%; float: right; margin-left: 30px; margin-top: 10px; margin-right: 20px;">
                <p style="font-size: 14px; margin-top: 5px; font-weight: bold;">Contact Us</p>
                <p style="font-size: 12px; margin-top: 10px;">Phone Number: 9818613211</p>
                <p style="font-size: 12px; margin-top: 5px;">Address: Sorakhutte, Kathmandu</p>
                <p style="font-size: 16px; margin-right: 15px; margin-bottom: 5px; margin-top: 10px;">Visit us</p>
                <div style="height: 20px; width: 5%; float: right; margin-right: 10px;">
                    <a href=""><img src="image/fac.png"></a>
                </div>
                <div style="height: 20px; width: 5%; float: right; margin-left: 10px; margin-right: 5px;">
                    <a href=""><img src="image/insta.png"></a>
                </div>
            </div>
        </div>
    </footer>
</div>
</body>
</html>
</body>
</html>