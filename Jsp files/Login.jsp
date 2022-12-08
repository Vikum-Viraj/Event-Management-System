<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type = "text/css">

</style>
</head>
<body bgcolor = "purple">
<div class = "frst">
<div class = "hed" align = "center" >
<font color = "white" size = "20px"><b>Event PLaning System</b></font>
</div>
<hr color = "white"><br><br>

<!-- User form -->
<form action = "ins" method = post class = "log">
<center><font color = "white" class = "red" size = "10px">User Login</font></center><br><br>
<div class= "jvb">
<font size ="5px" color = "white">  UserName  : </font> <input type = "text" name = "username" placeholder = "Enter name" class = "user" required><br><br>
<font size ="5px" color = "white">	Password  : </font> <input type = "password" name = "passowrd" placeholder = "password" class = "user" required><br><br>

<center><input type = "submit" name = "submit"  value = "Login" class = "rtx"></center>

<a href="Register.jsp" class="signup-image-link"> <font color = "white"> <h3>Register here</h3><font></a>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</form>


</div>


</div>
</body>

<script>
	const queryString = window.location.search;
	console.log(queryString);
	
	const urlParams = new URLSearchParams(queryString);
	const id = urlParams.get('id')
	console.log(id);
		
		if(id=='error'){
			alert("Invalid Username or Password!");
		}
		

 	</script>
</html>