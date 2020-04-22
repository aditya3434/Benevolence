<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome ${username}</title>
<link rel="stylesheet" type="text/css" href="style4.css">
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
ResultSet resultSet2 = null;
%>
<div class="main">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM offers WHERE itemID LIKE BINARY "+"'"+session.getAttribute("item").toString()+"'";
resultSet = statement.executeQuery(sql);
resultSet.next();%>
<div style="width:600px;height:470px;float:left">
<%@ page import="java.sql.*"%>
  <%@ page import="java.io.*"%>
  <%@ page import="java.util.*"%>
  <%
  Blob blob = resultSet.getBlob("image");
  
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
  <center><img src="data:image/jpg;base64,<%=base64Image %>" style="max-width:500px; width : auto; height:470px; margin-top : 10px;"></center>
  <%}
  else{%>
  <center><img src="error.png" style="max-width:300px; width : auto; height:231px; margin-top : -20px"></center>
  <%}
  %>
  </div>
<div class="iteminfo">
<center><b>Item Info</b></center><br>
<p>
<b>Item :</b> <%=resultSet.getString("itemCategory")%><br>
<br>
<b>Donor :</b> <%=resultSet.getString("username")%><br>
<br>
<b>Item Description :</b> <%=resultSet.getString("itemDesc")%><br>
<br>
<b>Pickup location :</b> <%=resultSet.getString("place")%><br>
<br>
<b>State :</b> <%=resultSet.getString("state")%><br>
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
String sql ="SELECT COUNT( * ) as number from demands where itemID LIKE BINARY "+"'"+session.getAttribute("item").toString()+"'";
ResultSet resultSet3 = statement.executeQuery(sql);
resultSet3.next();%>
<b>Interested candidates : </b><%=resultSet3.getString("number")%>&nbsp&nbsp&nbsp<%if (session.getAttribute("username").equals(resultSet.getString("username")) && Integer.parseInt(resultSet3.getString("number"))>0){ %><a href="Acceptors.jsp">View</a><%} %><br>
<br>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>
</p>
</div>
<hr style="width: 1250px;margin: 0px;">
<% 
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM users WHERE username LIKE BINARY "+"'"+resultSet.getString("username")+"'";
resultSet2 = statement.executeQuery(sql);
resultSet2.next();%>
<div style="width:600px;height:470px;float:left">
<%@ page import="java.sql.*"%>
  <%@ page import="java.io.*"%>
  <%@ page import="java.util.*"%>
  <%
  Blob blob = resultSet2.getBlob("profile_photo");
  
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
  <center><img src="data:image/jpg;base64,<%=base64Image %>" style="max-width:200px; width : auto; height:200px;border-radius:100px; margin-top : 100px;"></center>
  <%}
  else{%>
  <center><img src="user.png" style="max-width:200px; width : auto; height:200px;border-radius:100px; margin-top : 100px;"></center>
  <%}
  %>
  </div>
<div class="userinfo">
<center><b>User Info</b></center><br>
<p>
<b>Username :</b> <%=resultSet2.getString("username")%><br>
<br>
<b>First Name :</b> <%=resultSet2.getString("FirstName")%><br>
<br>
<b>Last Name :</b> <%=resultSet2.getString("LastName")%><br>
<br>
<b>Phone No. :</b> <%=resultSet2.getString("phone")%><br>
<br>
<b>E-mail ID :</b> <%=resultSet2.getString("emailid")%><br>
<br>
</p>
<%
if (session.getAttribute("username").equals(resultSet2.getString("username"))){%>
	<form action="deletion" class="box" method="post">
	<input type="hidden" name="item" value=<%=session.getAttribute("item")%>>
	<input type="submit" value="Delete Donation">
	</form>
<%}
else{%>
<div class="different"><center>
<form action="demand" method="post">
<input type="submit" value="Send donation request"></form>
</center>
</div>
<%}
} catch (Exception e) {
e.printStackTrace();
}
%><br>
<div class="error"><p style="color:red;font-size:18px;font-weight:bold;position:relative;left:35px">${messages.foo}</p></div>
<div class="success"><p style="color:green;font-size:18px;font-weight:bold;position:relative;left:110px">${messages.success}</p></div>
</div>
</div>
</body>
</html>