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
<div style="height:0px"><a style="all:unset;cursor:pointer" href="UserHome.jsp"><img src="Symbol1.png" style="height:50px;position:relative;left:20px;top:-2px"></a></div>
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
<div class="RecentDonations2">
<center>My Demands</center>
<br>
<div class="grid-container">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM offers INNER JOIN demands ON demands.itemID = offers.itemID WHERE demands.username LIKE BINARY "+"'"+session.getAttribute("username")+"'";
ResultSet resultSet2 = statement.executeQuery(sql);
int i=0;
while (resultSet2.next()){
%>
  <form action="demanditem" method="post" style="text-decoration:none;background-color:#fff;height:370px">
  <div class="grid-item">
  <div style="height:0">
  <input type="submit" value="" style="text-decoration:none">
  </div>
  <h3><%=resultSet2.getString("itemCategory") %></h3><div class="ribbon"></div>
  <h4></h4>
  <%@ page import="java.sql.*"%>
  <%@ page import="java.io.*"%>
  <%@ page import="java.util.*"%>
  <%
  Blob blob = resultSet2.getBlob("image");
  
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
  <center><img src="data:image/jpg;base64,<%=base64Image %>" style="max-width:300px; width : auto; height:231px; margin-top : -20px"></center>
  <%}
  else{%>
  <center><img src="error.png" style="max-width:300px; width : auto; height:231px; margin-top : -20px"></center>
  <%}
  %>
  <div class="address">
  <p>
  <%=resultSet2.getString("place") %>
  </p>
  </div>
  <div class="date">
  <p>
  <%=resultSet2.getString("username") %><br>
  <br>
  Date : <%=resultSet2.getDate("offerDate") %>
  </p>
  </div>
  <input type="hidden" name="id" value=<%=resultSet2.getString("itemID")%>>
  </div>
  </form>
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