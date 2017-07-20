<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration failed</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<%
	try {
%>
<body>
	<br />
	<div class="container">

		<nav class="navbar navbar-inverse">
		<div class="navbar-header">

			<a class="navbar-brand" href="#"><span
				class="glyphicon glyphicon-remove"></span> Security Web-App</a>
		</div>
		</nav>
	</div>
	<div class="container">
		<div>
			<h4>
				<dl>
					<dt>
						<span class="glyphicon glyphicon-remove"></span>Registration
						failed due to one of the following reasons:
					</dt>
					<small><dd>- Username already exists</dd>
						<dd>- Username is invalid.</dd>
						<dd>- Passwword is invalid.</dd></small>
				</dl>
			</h4>
		</div>
		<div>
			<form method="post" action="register.jsp">
				<button type="submit" class="btn">Try Again</button>
			</form>
		</div>
	</div>
</body>
<%
	} catch (Exception E) {
		response.sendRedirect("login.jsp");
	}
%>
</html>