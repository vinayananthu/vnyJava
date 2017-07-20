<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.vny.*"%>
<%@page import="java.util.List"%>
<%@page import="org.vny.*"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome page</title>
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
<script type="text/javascript">
	function load_SendMsg(clicked_id) {
		window.location = "http://localhost:8081/EncryptionWeb/sendMessage.jsp?param="
				+ clicked_id;
	}
</script>
<style type="text/css">
.black-background {
	background-color: #000000;
}

.white {
	color: #ffffff;
}
</style>
</head>
<body>
	<%
		try {
			if (session.getAttribute("user") != null) {
	%>

	<br />
	<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"><span
				class="glyphicon glyphicon-home"></span> Home Page | Security
				Web-App </a>
		</div>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="inbox.jsp"><span
					class="glyphicon glyphicon-envelope"></span> Inbox</a></li>
			<li><a href="logout.jsp"><span
					class="glyphicon glyphicon-log-in"></span> Logout</a></li>
		</ul>
	</div>
	</nav>

	<%
		User user = (User) session.getAttribute("user");
	%>

	<div class="container" id="container">

		<div class="row">

			<div class="col-md-9">
				<h3>
					<u>Welcome <%=user.getFname() + " " + user.getLname()%></u>
				</h3>
			</div>
			<%-- <div class="col-md-3"><%=new Date()%></br></div> --%>
		</div>
		<div class="row">

			<div class="col-md-9">
				<h3>
					<small>List of Friends:</small>
				</h3>
			</div>
			<%-- <div class="col-md-3"><%=new Date()%></br></div> --%>
		</div>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>User ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Options</th>
				</tr>
			</thead>
			<tbody>
				<%
					DataInsertion data = new DataInsertion();
							List<User> list = data.getListOfUsers();
							for (User u : list) {
								if (!u.getUser_name().equals(user.getUser_name())) {
				%>
				<%--                  		<input type ="hidden" name = "usn"  value="<%u.getUser_name()%>">
							<input name = "fname" type ="hidden" value="<%u.getFname()%>">
							<input name = "lname" type ="hidden" value="<%u.getLname()%>"> --%>
				<tr>
					<td><%=u.getUser_name()%></td>
					<td><%=u.getFname()%></td>
					<td><%=u.getLname()%></td>
					<%
						session.setAttribute("fromUSN", user.getUser_name());
					%>
					<td>
						<button id="<%=u.getUser_name()%>"
							class="btn btn-primary black-background white"
							onclick="load_SendMsg(this.id)">Message</button>
					</td>
				</tr>
				<%
					}
							}
				%>
			
			<tbody>
		</table>
		<br />
	</div>
	<%
		} else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception E) {
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>