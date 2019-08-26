<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirm Task Deletion</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lumen/bootstrap.min.css" rel="stylesheet" integrity="sha384-iqcNtN3rj6Y1HX/R0a3zu3ngmbdwEa9qQGHdkXwSRoiE+Gj71p0UNDSm99LcXiXV" crossorigin="anonymous">
</head>
<body>
	<form action="/delete-task" method="post">
		<input type="hidden" value="${task.id}" name="id">
		<h1>Do you want to delete this task?</h1>
		<h4>Description: ${task.description}</h4>
		<h4>Due Date: ${task.dueDate}</h4>
		<h4>Completed: ${task.completed}</h4>
		<input type="submit" value="I know what I'm doing!" class="btn btn-danger">
		<a href="/display?userId=${task.userId}" class="btn btn-primary">Back to safety</a>
	</form>
</body>
</html>