<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Benevolence</title>
<link rel="stylesheet" type="text/css" href="style1.css">
<link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="topbar">
<p>Call Us : 123-123-1234  | Email Us : abcd1234@gmail.com</p>
</div>
<div class="titlebar">
<a href="UserHome.jsp"><img src="Logo1.png" style="height:50px;position:relative;left:20px;top:7px"></a>
<ul>
<li class="active"><a href="Home.jsp">Home</a></li>
<li><a href="UserLogin.jsp">Login</a></li>
<li><a href="AboutUs.jsp">About us</a></li>
<li><a href="Contacts.jsp">Contacts</a></li>
</ul>
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
var slideIndex = 1;
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
<div class="text_title">
Welcome to Benevolence
</div>
<div class="main_text">
<p>
<br>
We all know there are no shortage of altruists in the world. However, many of them lack the means to help the needy. This may be due to lack of communication, geographical conditions and cumbersome transactions.
Because of this, people, who want to help, cannot do so in a cost and time efficient manner.<br>
<br>
Benevolence is designed to remedy this. With benevolence, you can put up items for donation, manage them in an efficient manner, search for donors near you who are donating the item you require, directly donate to registered
NGOs, etc. These facilities and services are included for those who are in need of specific items as well as those who want to donate their belongings to those in need. By bringing the donors and the acceptors together, 
Benevolence creates a platform which enables easy transaction of items and bring help to those who need it as fast as possible. The donations can range from single items to individuals to mass donation orders to NGOs.<br>
<br> 
So what are you waiting for? Join Benevolence and start making a difference to the world.<br>
<br>
</p>
</div>
</div>
<div class="footer">
 <center>
 <br>
<p>Follow us on</p><br>
<ul>
<li><a href="https://www.facebook.com/profile.php?id=100026519284248" class="fa fa-facebook"></a></li>
<li><a href="https://www.instagram.com/adityasingh390402/" class="fa fa-instagram"></a></li>
<li><a href="https://www.linkedin.com/in/aditya-singh-847ab3167" class="fa fa-linkedin"></a></li>
</ul>
<br>
<br>
 </center>
</div>
</body>
</html>