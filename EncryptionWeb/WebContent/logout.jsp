<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logged Out</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body background="images/BG10.jpg" class="img-responsive">
	<br />
	<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"><span
					class="glyphicon glyphicon-ok-circle"></span> Logged out | Security
				Web-App. </a>
		</div>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="register.jsp"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="login.jsp"><span
					class="glyphicon glyphicon-log-in"></span> Login Again</a></li>
		</ul>
	</div>
	</nav>
	<%
		session.setAttribute("user",null);
		session.invalidate();
	%>
	<div class="container">
	<div class="bg-success">
	<h4> &nbsp;You have been logged out successfully. Visit again, go Secure!</h4>
	</div>
	</div>
</body>
</html>