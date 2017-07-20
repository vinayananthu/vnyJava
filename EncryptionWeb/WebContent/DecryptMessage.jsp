<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="org.vny.*"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<body>
	<%
try{
	
	if(session.getAttribute("user")!=null)
	{

%>
	<br />
	<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"> Decrypted Message | Security
				Web-App.</a>
		</div>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="inbox.jsp"><span
					class="glyphicon glyphicon-envelope"></span> Back to Inbox</a></li>
			<li><a href="member.jsp"><span
					class="glyphicon glyphicon-home"></span> Back to Home</a></li>
			<li><a href="logout.jsp"><span
					class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		</ul>
	</div>
	</nav>
	<div class="container">
		<h4>Here are the decrypted messages:</h4>
	</div>
	<%
		//String plainMessage = (String)session.getAttribute("decryptMessage");
		MessageService messageService = new MessageService();
		CryptoSecurity crypto = new CryptoSecurity();
		int skey = Integer.parseInt(request.getParameter("skey"));
		User user = (User) session.getAttribute("user");
		List<Message> list = messageService.getMessagesByUserName(user.getUser_name());
		String message = "";
		for (Message m : list) {
	%>
	<div class="container">

		<blockquote>
			<p class="bg-success">
				&nbsp;
				<%=crypto.decryptString(m.getMessage(), skey)%>

				<%-- <%
			int skey= Integer.parseInt(request.getParameter("key")); 
			CryptoSecurity crypto = new CryptoSecurity();
			String decryptedMsg = crypto.decryptString(m.getMessage(), skey);
			%> --%>
			</p>

			<footer><%=m.getFromUname()%></footer>
		</blockquote>
	</div>


	<%
		}
	}
	else{
		response.sendRedirect("login.jsp");
	}
}catch(Exception E){
	response.sendRedirect("login.jsp");
}
		//String decryptMessage= crypto.decryptString(cypherText, key);
	%>
	<br />
</body>
</html>