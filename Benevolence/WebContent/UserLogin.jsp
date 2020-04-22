<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Benevolence</title>
<link rel="stylesheet" type="text/css" href="style2.css">
<link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="topbar">
<p>Call Us : 123-123-1234  | Email Us : abcd1234@gmail.com</p>
</div>
<div class="titlebar">
<a href="Home.jsp"><img src="Logo1.png" style="height:50px;position:relative;left:20px;top:7px"></a>
<ul>
<li><a href="Home.jsp">Home</a></li>
<li class="active"><a href="UserLogin.jsp">Login</a></li>
<li><a href="AboutUs.jsp">About us</a></li>
<li><a href="Contacts.jsp">Contacts</a></li>
</ul>
</div>
<form class="box" action="Userlogin" method="post">
<img src="Login.png">
<p class="title">
Member Login<br><br>
<input type="text" name="uname" placeholder="Username"><br>
<br>
<input type ="password" name="pass" placeholder="Password"><br>
<br>
<input type="submit" value="LOGIN"><br>
</p>
<center>
<br>
<p class="text">New to Benevolence? <a href="Registration.jsp">Sign up</a></p>
<div class="error"><p style="font-family: arial;color:red;font-size:18px;font-weight:bold;position:relative;top:20px;left:160px">${messages.foo}</p></div>
<div class="success"><p style="color:green;font-size:18px;font-weight:bold;position:relative;">${messages.success}</p></div>
</center>
</form>
</body>
</html>
