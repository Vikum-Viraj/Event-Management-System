<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
	<style type = "text/css">
	*
{
	margin:0px;
	padding:0px;
	box-sizing:border-box;
	 text-decoration:none;
}

body
{
    
	background-image: url(../images/paynn.jpg);
}
nav
{
	width:100%;
	height:75px;
	line-height:75px;
	padding:0px 80px;
	position:fixed;
	background-image:linear-gradient(#033747,#012733);
	 text-decoration:none;
}

nav .logo p
{
	font-size:30px;
	font-weight:bold;
	float:left;
	color:white;
	text-transform: uppercase;
	Letter-spacing: 1.5px;
   
}

nav ul
{
	float: right;
}

nav li
{
	display:inline-block;
	list-style:none;
	 text-decoration:none;
}

nav li a
{
	font-size: 18px;
	text-transform:uppercase;
	padding:0px 30px;
	color :white;
}

nav li a:hover
{
	color:rgb(255, 0, 0);
	
}

.content-items img
{
	width:100%;
	height: 100vh;
	background-size:cover;
	background-position:center;
	
}
.btu1
{
background-color: #2e2eb8; /* Green */
  border: none;
  color: white;
  padding: 10px 22px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
   border-radius: 5px;
}

.btd1
{
 background-color: #ff0000; /* Green */
  border: none;
  color: white;
  padding: 10px 22px;
  text-align: center;
  text-decoration: none;
  display: inline;
  font-size: 14px;
  border-radius: 5px;
}	
.nbt
{
 background-color:  #800040; /* Green */
  border: none;
  color: white;
  padding: 10px 22px;
  text-align: center;
  text-decoration: none;
  display: inline;
  font-size: 14px;
  border-radius: 5px;
}

{
	 height: 50px;
}

tr:nth-child(even) {background-color: #f2f2f2;}


table
{
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 1.2em;
	min-width: 600px;
	
	
}



	</style>
</head>
<body bgcolor = "yellow">
<nav>
<div class = "logo">
<p>Event Planning System</p>
</div>
<ul>
<li><a href = "home.jsp">Home</a></li>
<li><a href = "#">My &nbsp Profile</a></li>
<li><a href = "#">Bookings</a></li>
<li><a href = "#">Contact</a></li>
</ul>
</nav>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="#" class="navbar-brand"><font face = "Monospace" size = "6px">Payment method</font></a>
			</div>
            <br>
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link"><font face = "Monospace" size = "5px">Payments</font></a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center"><font face = "Georgia " size = "7px">List of Payment methods</font></h3>
			<hr color = " #0052cc" width ="100%" >
			
			<div class="container text-left">
                <br><br>
				<a href="<%=request.getContextPath()%>/new" class=""><font face = "verdana"><button class = "nbt">Add new payment method</button></font></a>
			</div>
			
			<br>
			<table class="table table-bordered" border ="2">
				<thead>
					<tr>
						<th>id</th>
						<th>Cardholder name</th>
						<th>Card Number</th>
						<th>Card type</th>
						<th>Card Cvv</th>
						<th>Expire date</th>
						<th>Nic</th>
						<th>Options</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					
					<c:forEach var="paylist" items="${paylist}">

						<tr>
							<td><c:out value='${paylist.id}' /></td>
							<td><c:out value="${paylist.cardHolder}" /></td>
							<td><c:out value="${paylist.cardNo}" /></td>
							<td><c:out value="${paylist.cardType}" /></td>
							<td><c:out value="${paylist.cardCvv}" /></td>
							<td><c:out value="${paylist.expireDate}" /></td>
							<td><c:out value="${paylist.amount}" /></td> 
							
							<td><a href="edit?id=<c:out value='${paylist.id}' />"><button class = "btu1" id = "ui">Update</button></a>
								&nbsp;&nbsp;&nbsp;&nbsp; 
							<a href="delete?id=<c:out value='${paylist.id}' />"><button class = "btd1" id = "ui">Delete</button></a></td>
							
						</tr>
						
					</c:forEach>
					
					
					<!-- } -->
				</tbody>

			</table>
			
		</div>
	</div>
</body>
</html>
