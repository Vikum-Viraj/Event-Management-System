<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style1.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
confirm("Are you sure you want remove account ?")
</script>
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
<br><br><br><br>

 <%
    String id  = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String userName =  request.getParameter("username");
    String password  = request.getParameter("password");
   
 %>
 
 <br><br>
 <center>
 <h2></h2>
 <font size = "12px">Remove My Profile</font> &nbsp
 </center>
 
 
 <center>
 <form action = "deletecus" method ="post" class ="dlete">
 <table>
 
 <tr>
 <td>Customer id</td>
 <td><input type = "text" name = "cusid" class = "dt1" value="<%= id %>" readonly></td>
 </tr>
 
  <tr>
 <td>Customer name</td>
 <td><input type = "text" name = "name" class = "dt1" value="<%= name %>" readonly></td>
 </tr>
 
  <tr>
 <td>Customer Email</td>
 <td><input type = "text" name = "email" class = "dt1" value="<%= email %>" readonly></td>
 </tr>
 
 
  <tr>
 <td>Customer Phone number</td>
 <td><input type = "text" name = "phone" class = "dt1" value="<%= phone %>" readonly></td>
 </tr>
 
 
  <tr>
 <td>Customer UserID</td>
 <td><input type = "text" name = "uname" class = "dt1"  value="<%= userName %>" readonly></td>
 </tr>
 
 
  <tr>
 <td>Customer Password</td>
 <td><input type = "text" name = "pass" class = "dt1" value="<%= password %>" readonly></td>
 </tr>

</table>
 <br>
 
 <input type = "submit" name = "submit" value = "Remove my account" class = "dbtn">
 
 </form>
 
 
 
</body>
</html>