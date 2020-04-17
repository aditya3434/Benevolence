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
<div class="main">
<center><h1>Benevolence Manual</h1></center>
<br>
<p style="font-size:18px">
Benevolence can be overwhelming for a new user, however, it can act as a very powerful tool if used correctly. This manual aims to help newcomers
get familiar with the site and start their donations.<br><br>
The Navigation bar on the top contains many options to access all functionalities easily, as shown in the image below.</p><br><br>
<img src="Site1.png" style="width:1200px"><br><br>
<h1>1. Acting as a Donor</h1>
<br><br>
<ul style="font-size:18px;margin-left:20px">
<li> Go to the user dropdown menu and click on Donate Item<br><br>
<li> Enter all the item details and submit your donation<br><br>
<li> The item will now be shown in the My Donations section of the Home Page. To see the full list, click on the link "See Full List" in the same section. 
Alternatively, you can click on My Donations in the dropdown menu<br><br>
<li> This item will be visible to all users now
</ul><br><br>
<img src="Site2.png" style="width:1200px"><br><br>
<ul style="font-size:18px;margin-left:20px">
<li> Clicking on the item tile will take you to the item page. It displays the item and user info.<br><br>
<li> You can also delete your donation by clicking on the red "Delete Donation" button<br><br>
<li> It also shows the number of candidates interested in your item. You can view them by clicking the "View" link
</ul><br><br>
<img src="Site3.png" style="width:1200px"><br><br>
<ul style="font-size:18px;margin-left:20px">
<li> Now you need to approve an acceptor. Note that you can only approve one acceptor for one item. Trying to approve multiple acceptors will just overwrite the previous ones.<br><br>
<li> Once you have approved an acceptor, wait for him/her to contact you and decide the date and time to meet at the pickup location<br><br>
<li> Personally give the item to the acceptor. He/She will then acknowledge it and the donation will be complete<br><br>
<li> Once the donation is complete, Benevolence will take the item tile down automatically, so no acceptors can give request to an item which is already donated<br><br>
</ul><br><br>
<img src="Site4.png" style="width:1200px"><br><br>
<h1>2. Acting as a Acceptor</h1>
<br><br>
<ul style="font-size:18px;margin-left:20px">
<li> Go to the All Donations section of the Home Page and click on any item you are interested in. Alternatively, you can use the search bar to filter the donation list<br><br>
<li> Here you can view the item and donor details. Click on the "Send Donation Request" to send a request to the donor<br><br>
<li> The item will now be shown in the My Demands section of the Home Page. To see the full list, click on the link "See Full List" in the same section.<br><br>
<li> This request will be visible to the donor now
</ul><br><br>
<img src="Site7.png" style="width:1200px"><br><br>
<ul style="font-size:18px;margin-left:20px">
<li> Clicking on the item tile in the My Demands will take you to the item page. It displays whether the donor has approved your request or not.<br><br>
<li> If the donor has approved your request, you can begin the actual donation. Contact the donor and decide the date and time to meet at the pickup location<br><br>
<li> It also shows the number of candidates interested in your item. You can view them by clicking the "View" link<br><br>
<li> Personally recieve the item from the donor. Click on the "I have received my donation" button on the item page and the donation will be complete<br><br>
<li> Once the donation is complete, Benevolence will take the item tile down automatically<br><br>
</ul><br><br>
<img src="Site5.png" style="width:1200px"><br><br>
<img src="Site6.png" style="width:1200px"><br><br>
</div>
</body>
</html>