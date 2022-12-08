<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<script>
alert("Welcome to User Profile");
</script>
<head>
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type = "text/css">
*
{
	margin:0px;
	padding:0px;
	box-sizing:border-box;
	 text-decoration:none;
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

</style>
</head>

<body bgcolor = " #ccffff">
<nav>
<div class = "logo">
<p>Event Planning System</p>
</div>
<ul>
<li><a href = "home.jsp">Home</a></li>
<li><a href = "useraccount.jsp">My &nbsp Profile</a></li>
<li><a href = "#">Bookings</a></li>
<li><a href = "#">Contact</a></li>
</ul>
</nav>


<br><br>

 
 <h1> user account</h1><br><br>
 
 
 
 <div class = "userac">
 <div class = "flexs">
<!--declare cus variable  -->
<c:forEach var="cus" items="${customer}" >
 
 
  
  
 <c:set var="id" value ="${cus.id}"/>    <!-- call get id method where in customer class -->
 <c:set var="name" value ="${cus.name}"/>   <!-- call get name method where in customer class -->
 <c:set var="email" value ="${cus.email}"/>    
 <c:set var="phone" value ="${cus.phone}"/>
 <c:set var="username" value ="${cus.username}"/>
 <c:set var="password" value ="${cus.password}"/>  <!-- call getpassword method where in customer class -->
 
 
 <br><center><img src = "images/profile.png" alt = "profile" size = "320px" height = "320px">

 <h1>Your Profile</h1>&nbsp 
  <hr color = "blue" width = "1000px">&nbsp 
 <br> </center>
 
  <center>
  <table border = "2" class = "tbc">

    <tr>
    <td>Customer ID </td>
    <td>${cus.id}  </td>
    </tr>
    
    
    <tr>
    <td>Customer Name </td>
    <td>${cus.name}</td>
    </tr>
    
    <tr>
    <td>Customer Email </td>
    <td>${cus.email}</td>
    </tr>

    <tr>
    <td>Customer Phone </td>
    <td>${cus.phone}</td>
    </tr>
    
    <tr>
    <td>Customer Userid </td>
    <td>${cus.username}</td>
    </tr>
    
    <tr>
    <td>Password </td>
    <td>${cus.password}</td>
    </tr>
    </table>	
    
</c:forEach>

	
	
	
 <br>
 
 
 
 <!-- For update -->
 <c:url value = "updatecustomer.jsp" var="cusupdate">
 
  <c:param name = "id" value = "${id}"/>
  <c:param name = "name" value = "${name}"/>
  <c:param name = "email" value = "${email}"/>
  <c:param name = "phone" value = "${phone}"/>
  <c:param name = "username" value = "${username}"/>
  <c:param name = "password" value = "${password}"/>
  
 </c:url>

 <a href = "${cusupdate}">
 <input type = "button" name = "update" value  ="Update profile" class = "btn1" id ="fv">
 </a>
 
 
 
 <!-- Delete customer -->
 
 <c:url value = "removeuser.jsp" var = "removecus">
 
 <c:param name = "id" value ="${id}" />
 <c:param name = "name" value = "${name}" />
 <c:param name = "email" value = "${email}" />
 <c:param name =  "phone" value = "${phone}" />
 <c:param name = "usern" value = "${username}" />
 <c:param name = "passw" value = "${password}" />
  
 </c:url>
 &nbsp  &nbsp &nbsp &nbsp
 
 <a href = "${removecus}"> 
 <input type = "button" name = "delete" value = "Delete my Profile" class = "btn2" id = "fv">
 </a>
 </center>
 
 </div>
 <br><br><br><br>
 </div>
  <br><br><br><br>
</body>
</html>