<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" 
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

.picj
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

label
{
font-family: Helvetica;
font-size:18px;
}
#ad1
{
 background-color:  #990000; /* Green */
  border: none;
  color: white;
  padding: 10px 22px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  border-radius: 5px;
  
 .picj
  {
 
     background-color:blue;
  }
  
  
}



</style>
</head>
<body>
<div class = "picj" id = "jdbc">
<nav>
<div class = "logo">
<p>Event Planning System</p>
</div>
<ul>
<li><a href = "#">Home</a></li>
<li><a href = "#">My &nbsp Profile</a></li>
<li><a href = "#">Bookings</a></li>
<li><a href = "#">Contact</a></li>
</ul>
</nav>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="#" class="navbar-brand"> ADD Payment Method  </a>
			</div>

			<ul class="navbar-nav">
			
				<li><a href="<%=request.getContextPath()%>/list" class="nav-link" >Payments</a></li>
			</ul>
		</nav>
	</header>
	
	<br>
	<div class="container col-md-5" id ="det">
		<div class="card">
			<div class="card-body">
			
	
			
				<c:if test="${paysdoc != null}">
					<form action="update" method="post">
				</c:if>
				
				<c:if test="${paysdoc == null}">
					<form action="insert" method="post">
				</c:if>



				<caption>
					<h2>
					
					
						<c:if test="${paysdoc != null}">
            			<font face = "Lucida Bright">Edit payment method</font><br><br>
            		    </c:if>
            		    <div class = "pyfrm">
						<c:if test="${paysdoc == null}">
            			<font face = "Lucida Bright"><button class = "">Add New Payment method</button></font>
            			<br><br>
            		    </c:if>
            		    
					</h2>
				</caption>


				<c:if test="${paysdoc != null}">
					<input type="hidden" name="id" value="<c:out value='${paysdoc.id}' />" />
				</c:if>
				

				<fieldset class="form-group">
					<label>  Cardholder Name</label> <input type="text" value="<c:out value='${paysdoc.cardHolder}' />" class="form-control" name="holdername" required="required">
				</fieldset>
				

				<fieldset class="form-group">
					<label> Card Number </label> <input type="text"
						value="<c:out value='${paysdoc.cardNo}' />" class="form-control"
						name="cardnumber">
				</fieldset>
				
				

				<fieldset class="form-group">
					<label>Card type </label> 
					
				<select  value = "<c:out value='${paysdoc.cardType}' />"  class="form-control" name="cardtype" required>   <option value="Master">Master</option>
                        <option value="Visa">  Visa</option>
                        <option value="Maestro"> Maestro</option>
                        <option value="Credit"> Credit</option>
                        <option value="Debit"> Debit</option>
                        
                        </select><br>
				
				</fieldset>
				
				<fieldset class="form-group">
					<label>Card Cvv </label> <input type="text"
						value="<c:out value='${paysdoc.cardCvv}' />" class="form-control"
						name="cardcvv">
				</fieldset>

                 <fieldset class="form-group">
					<label>Expire date </label> <input type="text"
						value="<c:out value='${paysdoc.expireDate}' />" class="form-control"
						name="expdate">
				</fieldset>
                 
               
                 <fieldset class="form-group">
					<label>NIC Number </label> <input type="text"
						value="<c:out value='${paysdoc.amount}' />" class="form-control"
						name="nic" required>
				</fieldset>
                 
                 
                 
                 
				<button type="submit" class="btn btn-success" id = "ad1">ADD</button>
				 </form>
				 
				 </div>
			</div>
		</div>
	</div>
	
	</div>
</body>
</html>
