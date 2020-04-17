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
<ul>
<li><a href="Home.jsp">Home</a></li>
<li class="active"><a href="UserLogin.jsp">Login</a></li>
<li><a href="AboutUs.jsp">About us</a></li>
<li><a href="Contacts.jsp">Contacts</a></li>
</ul>
</div>
<form class="box" action="Register" method="post" style="padding: 40px 40px;margin-top:20px" enctype="multipart/form-data">
<h1>Let's get you started!</h1>
<br>
<p>
<input type="text" name="uname" placeholder="Username"><br>
<br>
<input type ="password" name="pass" placeholder="Password"><br>
<br>
<input type="text" name="fname" placeholder="First Name"><br>
<br>
<input type="text" name="lname" placeholder="Last Name"><br>
<br>
<input type="text" name="phone" placeholder="Phone no."><br>
<br>
<input type="text" name="email" placeholder="E-mail ID"><br>
<br>
<p style="position:relative;left:32px">Profile Picture : <input type = "file" name="photo"><br></p>
<br>
<input type="submit" value="Register"><br>
<br>
</p>
<div class="error"><p style="font-family: arial;color:red;font-size:18px;font-weight:bold;position:relative;top:10px;left:2px">${messages.foo}</p></div>
</form>
</body>
</html>