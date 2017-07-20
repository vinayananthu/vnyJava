<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MessageSent</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<%if(session.getAttribute("user")!=null){%>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"><span
					class="glyphicon glyphicon-ok-circle"></span> Message sent | Security
				Web-App. </a>
		</div>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="member.jsp"><span
					class="glyphicon glyphicon-home"></span> back to home</a></li>
			<li><a href="inbox.jsp"><span
					class="glyphicon glyphicon-log-in"></span> back to inbox</a></li>
		</ul>
	</div>
	</nav>
	<div class="container bg-success">
	<div class="bg-success">
	<p><span class="glyphicon glyphicon-ok-circle"> Your message was successfully sent!</span></p>
	</div>
	</div>
</body>
<%} else{
	response.sendRedirect("login.jsp");
} %>
</html>