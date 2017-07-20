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
<title>Inbox</title>
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
function load_DecryptMsg(clicked_id)
{	
	value1=document.getElementById("skey").value;
    window.location="http://localhost:8081/EncryptionWeb/DecryptMessage.jsp?param="+clicked_id+"&skey="+value1;
}
</script>
</head>
<%try{ 
	if(session.getAttribute("user")!=null)
	{
%>

<body>
	<br />

	<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"><span
				class="glyphicon glyphicon-envelope"></span> Home | Security
				Web-App. </a>
		</div>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="member.jsp"><span
					class="glyphicon glyphicon-home"></span> Back to Home</a></li>
			<li><a href="logout.jsp"><span
					class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		</ul>
	</div>
	</nav>

	<div class="container">
		<%
			User user = (User) session.getAttribute("user");
				MessageService messageService = new MessageService();
				List<Message> list = messageService.getMessagesByUserName(user.getUser_name());
				String message = "";
				if(list.isEmpty()){%>
		<h4>Your inbox is empty.</h4>
		<%
				}
				if(!list.isEmpty()){
				for (Message m : list) {
				message = message +" "+ m.getMessage();
		%>
		<h4>Here are your messages:</h4>
	</div>

	<div class="container">


		<blockquote>
			<p class="bg-info">
				<%=m.getMessage()%>

				<%-- <%
			int skey= Integer.parseInt(request.getParameter("key")); 
			CryptoSecurity crypto = new CryptoSecurity();
			String decryptedMsg = crypto.decryptString(m.getMessage(), skey);
			%> --%>
			</p>

			<footer><%=m.getFromUname()%></footer>
		</blockquote>

		<%
			}
				if(!list.isEmpty()){
		%>
		<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		Key:&nbsp;<input type="text" id="skey">
		<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		<button id="<%=message%>" class="btn btn-primary"
			onclick="load_DecryptMsg(this.id)">decrypt</button>
	</div>
</body>
<%}
				}
				}else{
	response.sendRedirect("login.jsp");
}
	
}catch (Exception E){
	response.sendRedirect("login.jsp");
}

%>
</html>