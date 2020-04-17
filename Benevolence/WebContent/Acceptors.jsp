<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome ${username}</title>
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
<form action="search" method="post">
<input type="text" name="bar" placeholder="Search for donations.."><button class="glass" type="submit"><i class="fa fa-search"></i></button>
</form>
<div class="dropdown">
<button class="name" type="submit">${username} <i class="fa fa-angle-down"></i></button>
<div class="content">
<ul>
<li><a href="UserHome.jsp">Home</a></li>
<hr>
<li><a href="Profile.jsp">Edit Profile</a></li>
<li><a href="Donations.jsp">All Donations</a></li>
<hr>
<li><a href="MyDonations.jsp">My Donations</a></li>
<li><a href="Requests.jsp">My Demands</a></li>
<li><a href="DonateItem.jsp">Donate Item</a></li>
</ul>
</div>
</div>
<a class="help" href="Help.jsp" style="position:relative; bottom:40px">Help</a>
<form class="box" action="Userlogout" style="position:relative; bottom:40px">
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
String connectionUrl = "jdbc:mysql://localhost:3306/benevolence";
String userId = "root";
String password = "@ditya23023434";

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
<center>Interested Acceptors</center>
<br>
<div class="error"><p style="color:red;font-size:18px;font-weight:bold;position:relative;bottom:5px;left:0px;">${messages.foo}</p></div>
<div class="success"><p style="color:green;font-size:18px;font-weight:bold;position:relative;top:0px;left:0px;">${messages.success}</p></div>
<br>
<div class="grid-container">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM offers,demands,users where demands.itemID LIKE BINARY offers.itemID and demands.itemID LIKE BINARY "+"'"+session.getAttribute("item")+"' and demands.username LIKE BINARY users.username and offers.username LIKE BINARY "+"'"+session.getAttribute("username")+"'";
ResultSet resultSet2 = statement.executeQuery(sql);
int i=0;
while (resultSet2.next()){
%>
  <div class="grid-item">
  <%@ page import="java.sql.*"%>
  <%@ page import="java.io.*"%>
  <%@ page import="java.util.*"%>
  <%
  Blob blob = resultSet2.getBlob("users.profile_photo");
  
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
  Username : <%=resultSet2.getString("demands.username") %><br><br>
  First name : <%=resultSet2.getString("users.FirstName") %><br><br>
  Last name : <%=resultSet2.getString("users.LastName") %><br><br>
  E-mail ID : <%=resultSet2.getString("users.emailid") %><br><br>
  <br><br>
  <form action="approve" method="post">
  <input type="submit" value="Approve" style="background-color: rgb(7,222,13);
	border: 0;
	opacity:100%;
	border-radius: 24px;
	padding: 10px 10px;
	width: 250px;
	height:40px;
	color: #fff;
	transition: 0.4s;">
  <input type="hidden" name="id" value=<%=resultSet2.getString("offers.itemID")%>>
  <input type="hidden" name="uname" value=<%=resultSet2.getString("demands.username")%>>
  </form>
  </p>
  </center>
  </div>
  </div>
<%
++i;
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
</div>
</div>
</body>
</html>