<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create a new task</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lumen/bootstrap.min.css" rel="stylesheet" integrity="sha384-iqcNtN3rj6Y1HX/R0a3zu3ngmbdwEa9qQGHdkXwSRoiE+Gj71p0UNDSm99LcXiXV" crossorigin="anonymous">
</head>
<body>
<form action="add-task-to-db" method="post">
	<input type="hidden" name="userId" value="${user.id}">
	<h1>New Task</h1>
	<input type="text" name="description" placeholder="Description" required>
	<input type="date" name="dueDate" required>
	<input type="submit" value="Add To List" class="btn btn-primary">
</form>
</body>
</html>