<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Search</title>
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
<div class="main3">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl="jdbc:mysql://ec2-3-16-188-106.us-east-2.compute.amazonaws.com:3306/benevolence";
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
<div class="RecentDonations2">
<center>Search Results</center>
<br>
<div class="grid-container">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM users WHERE username LIKE '%"+session.getAttribute("search").toString()+"%'";
ResultSet resultSet5 = statement.executeQuery(sql);
int i=0;
while (resultSet5.next()){
%>
  <div class="grid-item">
  <%@ page import="java.sql.*"%>
  <%@ page import="java.io.*"%>
  <%@ page import="java.util.*"%>
  <%
  Blob blob = resultSet5.getBlob("profile_photo");
  
  InputStream inputStream = blob.getBinaryStream();
  ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
  byte[] buffer = new byte[4096];
  int bytesRead = -1;
   
  while ((bytesRead = inputStream.read(buffer)) != -1) {
      outputStream.write(buffer, 0, bytesRead);
  }
   
  byte[] imageBytes = outputStream.toByteArray();
   
  String base64Image = Base64.getEncoder().encodeToString(imageBytes);
   
  inputStream.close();
  outputStream.close();
  if (!base64Image.isEmpty()){
  %>
  <center><img src="data:image/jpg;base64,<%=base64Image %>" style="max-width:200px; width : auto; height:154px;border-radius:100px; margin-top : 10px;"></center>
  <%}
  else{%>
  <center><img src="user.png" style="max-width:200px; width : auto; height:154px;border-radius:100px; margin-top : 10px;"></center>
  <%}
  %>
  <div class="userdata">
  <center>
  <p>
  Username : <%=resultSet5.getString("username") %><br><br>
  First name : <%=resultSet5.getString("FirstName") %><br><br>
  Last name : <%=resultSet5.getString("LastName") %><br><br>
  Phone no. : <%=resultSet5.getString("phone") %><br><br>
  E-mail ID : <%=resultSet5.getString("emailid") %><br><br>
  <br>
  <form action="banuser" method="post">
  <input type="submit" value="Ban User" style="background-color: rgb(220,0,0);
	border: 0;
	opacity:100%;
	border-radius: 24px;
	padding: 10px 10px;
	width: 250px;
	height:40px;
	margin-bottom:20px;
	color: #fff;
	transition: 0.4s;">
  <input type="hidden" name="uname" value=<%=resultSet5.getString("username")%>>
  </form>
  </p>
  </center>
  </div>
  </div>
<%
++i;
}
if (i==0){%>
	<center>No search results found!</center>
<%}
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
</div>
</div>
</body>
</html>