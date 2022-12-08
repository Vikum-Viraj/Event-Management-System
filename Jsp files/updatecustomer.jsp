<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style1.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type ="text/css">



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

.dv1
{
	
	background-color:red;
	height: 200%;
     width: 50%
}

.all
{
	background-position:center;
}




.tb {
 background-color:red;
 border: 1px solid;
}


.frt
{
	
  color:#e6e6e6;
}


.colr1
{
	    display: inline-block;
        width: 800px;
        text-align: right;
       
       
}

.dv1
{
	margin: auto;
   padding:10px;
   margin:7px;
   background-position: center;
   width:70%;
     color:#e6e6e6;
       font-size:20px;
       background-color:#ccffff;
       color:black;
}



.updt1
{
	 background-color:  #4da6ff; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius:6px;
}

.dlete
{
	background-position: center;
}


.dbtn
{
   background-color:  #b30000; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius:6px;
}



.dt1
{
	margin: auto;
   padding:10px;
   margin:7px;
   background-position: center;
   width:90%;
}


.picx
{
	background-image: url(../images/wall.jpg);
	background-repeat: no-repeat;
	width:500%;
	height:600%;
	background-size:25% 200%;
}



.ben8
{
	background-image: url(../images/evt.jpg);
}


</style>
</head>
<body bgcolor = "#99e6ff">

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
<br><br><br><br>
<div class = "jvp">
 <%
    String id  = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String userName =  request.getParameter("username");
    String password  = request.getParameter("password");
   
 %>
 <br>
 <center>
 <img src = "images/prgm.png" alt = "pic2" size = "320px" height = "320px">
 <br><br>
 <h1>Update Your Profile</h1>&nbsp
 <hr color = "red" width = "1000px">
 <br>
 </center>
 <br>


<div class = "colr1">
<form action = "updatecus" method = "post" class = "frmt1">

Customer ID  : <input type = "text" name = "cusid"  class = "dv1" value = "<%= id %>" readonly><br>
Name         : <input type = "text" name = "name"   class = "dv1" value  = "<%= name %>"><br>
E mail       : <input type = "text" name = "email"  class = "dv1" value = "<%= email %>"><br>
Phone Number : <input type = "text" name = "phone"  class = "dv1" value = "<%= phone %>"><br>
User name    : <input type  = "text" name = "uname" class = "dv1" value = "<%= userName %>"><br>
Password     :<input type = "password" name = "pass" class = "dv1" value  = "<%= password %>"><br>

<br>
<input type = "submit" name = "submit" value = "Update my data" class = "updt1"><br>
</div>

</form>

</div>
<br>
<br>
<br><br>
</body>
</html>