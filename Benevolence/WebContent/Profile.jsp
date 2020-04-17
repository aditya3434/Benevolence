<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Benevolence</title>
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
<li>Edit Profile</li>
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
<form class="box2" action="Edit" method="post" style="padding: 40px 40px" enctype="multipart/form-data">
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
<h1>Enter your new details</h1>
<br>
<p>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM users WHERE username LIKE BINARY "+"'"+session.getAttribute("username").toString()+"'";
resultSet = statement.executeQuery(sql);
resultSet.next();
%>
<input type="text" name="uname" placeholder="Username" value=<%=resultSet.getString("username") %>><br>
<br>
<input type ="password" name="pass" placeholder="Password"><br>
<br>
<input type="text" name="fname" placeholder="First Name" value=<%=resultSet.getString("FirstName") %>><br>
<br>
<input type="text" name="lname" placeholder="Last Name" value=<%=resultSet.getString("LastName") %>><br>
<br>
<input type="text" name="phone" placeholder="Phone no." value=<%=resultSet.getString("phone") %>><br>
<br>
<input type="text" name="email" placeholder="E-mail ID" value=<%=resultSet.getString("emailid") %>><br>
<br>
<p style="position:relative;left:32px">Profile Picture : <input type = "file" name="photo"><br></p>
<br>
<input type="submit" value="Save Changes"><br>
<br>
</p>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>
<div class="error"><p style="font-family: arial;color:red;font-size:18px;font-weight:bold;position:relative;top:10px;left:2px">${messages.foo}</p></div>
</form>
</body>
</html>