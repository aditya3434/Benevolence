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
<button class="name" style="overflow:hidden" type="submit">${username}<i class="fa fa-angle-down"></i></button>
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
<div class="main">
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <img src="charity.jpg" style="width:90%;height:500px; position:relative; left:120px">
  </div>

  <div class="mySlides fade">
    <img src="img2.jpg" style="width:90%; height:500px; position:relative; left:120px">
  </div>

  <div class="mySlides fade">
    <img src="img3.jpg" style="width:90%; height:500px; position:relative; left:120px">
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" style="position:relative; bottom:250px;left:120px" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" style="position:relative; bottom:250px;left:1022px" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
</div>

<script type="text/javascript">
var slideIndex = 2;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}
function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
</script>
<br>
<hr style="width: 1200px;margin: 25px;">
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
<div class="MyDonations">
My Donations
<br>
<br>
<div class="grid-container">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM offers WHERE username LIKE BINARY "+"'"+session.getAttribute("username").toString()+"'"+"ORDER BY offerDate DESC";
resultSet = statement.executeQuery(sql);
int i=0;
while (resultSet.next() && i<3){
%>
  <form action="item" method="post" style="text-decoration:none;background-color:#fff;height:370px">
  <div class="grid-item">
  <div style="height:0">
  <input type="submit" value="" style="text-decoration:none">
  </div>
  <h3><%=resultSet.getString("itemCategory") %></h3><div class="ribbon"></div>
  <h4></h4>
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
  <center><img src="data:image/jpg;base64,<%=base64Image %>" style="max-width:300px; width : auto; height:231px; margin-top : -20px"></center>
  <%}
  else{%>
  <center><img src="error.png" style="max-width:300px; width : auto; height:231px; margin-top : -20px"></center>
  <%}
  %>
  <div class="address">
  <p>
  <%=resultSet.getString("place") %>
  </p>
  </div>
  <div class="date">
  <p>
  <%=resultSet.getString("username") %><br>
  <br>
  Date : <%=resultSet.getDate("offerDate") %>
  </p>
  </div>
  <input type="hidden" name="id" value=<%=resultSet.getString("itemID")%>>
  </div>
  </form>
  <%
++i;
}
if (i==0){%>
	<div class="grid-item">
  <h3 class="u">Looking a little empty here</h3>
  <br>
  <br>
  <center>
  <h5>Want your items to be shown?</h5><br>
  <br>
  <h5>Click <a href="DonateItem.jsp">here</a> to donate an item</h5>
  </center>
  </div>
<%}
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
<a href="MyDonations.jsp" style="float:right; position:relative;top: 420px; right: 50px; font-size: 18px">See full list..</a>
</div>
<hr style="width: 1200px;margin: 25px;float: bottom">
<div class="RecentDonations" style="min-height:475px">
My Demands
<br>
<br>
<div class="grid-container">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM offers INNER JOIN demands ON demands.itemID = offers.itemID WHERE demands.username LIKE BINARY "+"'"+session.getAttribute("username")+"'";
ResultSet resultSet3 = statement.executeQuery(sql);
int i=0;
while (resultSet3.next() && i<3){
%>
  <form action="demanditem" method="post" style="text-decoration:none;background-color:#fff;height:370px">
  <div class="grid-item">
  <div style="height:0">
  <input type="submit" value="" style="text-decoration:none">
  </div>
  <h3><%=resultSet3.getString("itemCategory") %></h3><div class="ribbon"></div>
  <h4></h4>
  <%@ page import="java.sql.*"%>
  <%@ page import="java.io.*"%>
  <%@ page import="java.util.*"%>
  <%
  Blob blob = resultSet3.getBlob("image");
  
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
  <%=resultSet3.getString("place") %>
  </p>
  </div>
  <div class="date">
  <p>
  <%=resultSet3.getString("offers.username") %><br>
  <br>
  Date : <%=resultSet3.getDate("offerDate") %>
  </p>
  </div>
  <input type="hidden" name="id" value=<%=resultSet3.getString("itemID")%>>
  </div>
  </form>
  <%
++i;
}
if (i==0){%>
	<div class="grid-item">
  <h3 class="u">Looking for something?</h3>
  <br>
  <br>
  <center>
  <h5>In need of an item?</h5><br>
  <br>
  <h5>Click any item put up for donation and send a request!</h5>
  </center>
  </div>
<%}
} catch (Exception e) {
e.printStackTrace();
}
%>
</div>
<a href="Requests.jsp" style="float:right; position:relative;top: 420px; right: 50px; font-size: 18px;">See full list..</a>
</div>
<hr style="width: 1200px;margin: 25px;float: bottom">
<div class="RecentDonations">
All Donations
<br>
<br>
<div class="grid-container">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM offers ORDER BY offerDate DESC";
ResultSet resultSet2 = statement.executeQuery(sql);
int i=0;
while (resultSet2.next() && i<3){
%>
  <form action="item" method="post" style="text-decoration:none;background-color:#fff;height:37px">
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
<a href="Donations.jsp" style="float:right; padding : 10px; font-weight: bold; font-family: Arial;position:relative; right: 50px; font-size: 18px">See full list..</a>
</div>
</body>
</html>