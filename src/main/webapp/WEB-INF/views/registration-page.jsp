<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lumen/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iqcNtN3rj6Y1HX/R0a3zu3ngmbdwEa9qQGHdkXwSRoiE+Gj71p0UNDSm99LcXiXV"
	crossorigin="anonymous">
</head>
<body>
	<form action="add-user" method="post">
	<div align="center" style="padding: 50px;">
		<div class="card bg-light mb-3"
			style="max-width: 20rem; text-align: center;">
			<div class="card-header">Register</div>
			<div class="card-body">
				<p class="card-text">
					Name: <input type="text" name="name" placeholder="Name" class="form-control" required autofocus>
				</p>
				<p class="card-text">
					Email: <input type="email" name="email" placeholder="someone@example.com" class="form-control" required>
				</p>
				<p class="card-text">
					Password: <input type="password" name="password" placeholder="Password" class="form-control" required>
				</p>
				<p class="card-text">
					<input type="submit" value="Sign Up" class="btn btn-primary">
				</p>
				<p class="card-text">
					${error}
				</p>
			</div>
			</div>
		</div>
	</form>
</body>
</html>