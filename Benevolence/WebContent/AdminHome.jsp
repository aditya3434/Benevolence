<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Admin</title>
<link rel="stylesheet" type="text/css" href="style3.css">
<link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<% response.setHeader("Cache-Control","no-cache, no-store,must revalidate");
if (session.getAttribute("username")==null)
{
	response.sendRedirect("UserLogin.jsp");
}
%>
<div class="titlebar">
<div style="height:0px"><a style="all:unset;cursor:pointer" href="AdminHome.jsp"><img src="Symbol1.png" style="height:50px;position:relative;left:20px;top:-2px"></a></div><form action="Adminsearch" method="post">
<input type="text" name="bar" placeholder="Search users.."><button class="glass" type="submit"><i class="fa fa-search"></i></button>
</form>
<div class="dropdown">
<button class="name" type="submit">${username} <i class="fa fa-angle-down"></i></button>
<div class="content">
<ul>
<li><a href="AdminHome.jsp">Home</a></li>
<hr>
<li><a href="AdminUsers.jsp">View All Users</a></li>
<li><a href="AdminDonations.jsp">View All Donations</a></li>
</ul>
</div>
</div>
<form class="box" action="Userlogout" style="position:relative; bottom:40px;right:100px">
<input type="submit" value="Logout">
</form>
</div>
<div class="main" style="background-color:#fff;height:650px">
<br>
<center><p style="font-family:Arial;font-weight:bold;font-size:36px">Welcome Admin!</p><br><br>
<img src="Admin.png" style="width:300px;position:relative;left:10px"><br><br></center>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl="jdbc:mysql://3.12.236.102:3306/benevolence";
String userId="aditya";
String password="Password123$$";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT COUNT( * ) as number from users";
ResultSet resultSet3 = statement.executeQuery(sql);
resultSet3.next();%>
<p style="font-family:arial;font-size:24px;margin-left:250px;margin-top:50px;margin-bottom:50px">
<b>Active Users : </b><%=resultSet3.getString("number")%><br>
<br>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT COUNT( * ) as number from offers";
ResultSet resultSet3 = statement.executeQuery(sql);
resultSet3.next();%>
<b>Total items for donation : </b><%=resultSet3.getString("number")%><br>
<br>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>
</p>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT COUNT( * ) as number from demands";
ResultSet resultSet3 = statement.executeQuery(sql);
resultSet3.next();%>
<p style="font-family:arial;float:right;font-size:24px;margin-right:250px;margin-top:50px;position:relative;bottom:210px;">
<b>Total donation requests : </b><%=resultSet3.getString("number")%><br>
<br>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT COUNT( * ) as number from demands where current_status='approved'";
ResultSet resultSet3 = statement.executeQuery(sql);
resultSet3.next();%>
<b>Approved donation requests : </b><%=resultSet3.getString("number")%><br>
<br>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>
</p>
</div>
</body>
</html>