<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/style.css">
</head>
<body bgcolor = "yellow">

<div class = "frm" id = "frm1">
<center>
<font color = "white" class = "red" size = "10px"><b>Evenet Planing System</b></font></center><br>
<hr color = "white"><br><br>
<center><font color = "white" class = "red" size = "10px">User Registration form</font></center><br>

<form action = "reg" method = post class = "news">
<div class = "the"> 
<font size ="5px" color = "white">Name</font>         : <input type = "text" name = "name"  placeholder = "Enter name"  class = "fr"><br><br>
<font size ="5px" color = "white">Email</font>        : <input type = "text" name = "email" placeholder = "Enter email" class = "fr"><br><br>
<font size ="5px" color = "white">Phone Number</font> : <input type = "text" name = "phone" placeholder = "Enter phone number" class = "fr"><br><br>
<font size ="5px" color = "white">User ID</font>    : <input type = "text"  name = "userid" placeholder = "Enter your id"     class = "fr" required><br><br>
<font size = "5px" color = "white">Password</font>     : <input type = "password"   name = "passwd" placeholder ="Enter a password"class = "fr" required><br><br>

<div>
<input type = "submit" name = "submit"  value = "Register" class = "frt"  ><br>
</div>
<a href="Login.jsp" class="signup-image-link"><font color = "white"> <h3>Already a  member</h3><font></a>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</form>


</div>


</body>
</html>