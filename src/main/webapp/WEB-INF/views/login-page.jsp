<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lumen/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iqcNtN3rj6Y1HX/R0a3zu3ngmbdwEa9qQGHdkXwSRoiE+Gj71p0UNDSm99LcXiXV"
	crossorigin="anonymous">
</head>
<body>
	<form action="log-in" method="post">
		<div align="center" style="padding: 50px;">
			<div class="card bg-light mb-3" style="max-width: 20rem; text-align: center;">
				<div class="card-header">Log In</div>
				<div class="card-body">
					<p class="card-text">
						<input type="email" name="email" placeholder="Email" class="form-control" value="${userInfo.email}" autofocus>
					</p>
					<p class="card-text">
						<input type="password" name="password" placeholder="Password" class="form-control" value="${userInfo.password}">
					</p>
					<p class="card-text">
						<input type="submit" value="Log In" class="btn btn-primary"><br>
					</p>
					<p class="card-text">
						<a href="/register" class="btn btn-success">Register</a>
					</p>
					<p class="card-text">
						${error }
					</p>
				</div>
			</div>
		</div>
	</form>
</body>
</html>