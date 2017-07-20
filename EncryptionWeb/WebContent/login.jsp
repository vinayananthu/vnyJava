<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login page</title>
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
<body background="images/BG9.jpg">
	<br />
	<div class="container">

				<nav class="navbar navbar-default">
				<div class="navbar-header">
					<a class="navbar-brand" href="#"> <span
					class="glyphicon glyphicon-log-in"></span> Login | Welcome to Security
						Web-App</a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="register.jsp"><span
					class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="login.jsp"><span
					class="glyphicon glyphicon-log-in"></span> Login</a></li>
					</ul>
				</nav>
				<div id="loginbox" style="margin-top: 50px;"
					class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">Sign In</div>
							<div
								style="float: right; font-size: 80%; position: relative; top: -10px">
								<a href="#">Forgot password?</a>
							</div>
						</div>
						<div style="padding-top: 30px" class="panel-body">
							<form class="form-horizontal" method="post" action="LoginCheck">
								<fieldset>
									<!-- Username -->
									<label class="control-label" for="uname">Username</label>
									<div style="margin-bottom: 10px" class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <input
											id="login-username" type="text" class="form-control"
											name="uname" value="" placeholder="username">
									</div>


									<!-- Password-->
									<label class="control-label" for="password">Password</label>
									<div style="margin-bottom: 10px" class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-lock"></i></span> <input
											id="login-password" type="password" class="form-control"
											name="password" placeholder="password">
									</div>

									<div class="input-group">
										<div class="checkbox">
											<label> <input id="login-remember" type="checkbox"
												name="remember" value="1"> Remember me
											</label>
										</div>
									</div>

									<br />
									<!-- Button -->
									<div class="controls">
										<button class="btn btn-primary">Login</button>
									</div>
								</fieldset>
								<div class="form-group">
									<div class="col-md-12 control">
										<div
											style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
											Don't have an account! <a href="register.jsp"
												onClick="$('#loginbox').hide(); $('#signupbox').show()">
												Sign Up Here </a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>