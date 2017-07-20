<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send Message</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<%
try{
	
	if(session.getAttribute("user")!=null)
	{

%>
<br/>
	<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"> Decrypted Message | Security
				Web-App.</a>
		</div>

		<ul class="nav navbar-nav navbar-right">
			<li><a href="member.jsp"><span
					class="glyphicon glyphicon-home"></span> Back to Home</a></li>
			<li><a href="logout.jsp"><span
					class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		</ul>	
		</div>
	</nav>

	<div class = "container">
	<form method="post" action="SendMessage">
	<% 
		String var = request.getParameter("param");
		session.setAttribute("toUSN", var);
	%>
		<h4 class="text-center">Send your messages to <%=session.getAttribute("toUSN") %><h4>
						
				<div class="row">
				<div class="col-mid-6" style="margin-bottom: 10px">
    					<input id="msg" type="text" class="form-control" name="message" placeholder="Plain Message for <%=session.getAttribute("toUSN")  %>">
  				</div>
  				
  				
  				<div class="col-mid-2" style="margin-bottom: 10px">
    					<input id="key" type="text" class="" name="key" placeholder="Give cipher key of <%=session.getAttribute("toUSN")  %>">
  				</div> 				
  				</div>
				<input type = "hidden" name = "toUSN" value="<%=session.getAttribute("toUSN")%>">
				<input type = "hidden" name = "fromUSN" value="<%=session.getAttribute("fromUSN")%>">
				<input type ="submit" class="btn btn-primary" value = "Send">
				
	</form>
	</div>
	<%
	}
	else{
		response.sendRedirect("login.jsp");
	}
	}catch(Exception E){
	response.sendRedirect("login.jsp");
}
	%>
</body>
</html>