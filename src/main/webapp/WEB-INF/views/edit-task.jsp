<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit task</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lumen/bootstrap.min.css" rel="stylesheet" integrity="sha384-iqcNtN3rj6Y1HX/R0a3zu3ngmbdwEa9qQGHdkXwSRoiE+Gj71p0UNDSm99LcXiXV" crossorigin="anonymous">
</head>
<body>
<h1>Edit Task</h1>
<form action="/modify" method="post">
	<input type="hidden" value="${task.id}" name="id">
	<input type="hidden" value="${task.userId}" name="userId">
	<input type="hidden" value="${completed}" name="completed" id="completed_value">
	Description: <input type="text" value='${task.description}' name="description">
	<br>
	Due date: <input type="date" value="${task.dueDate}" name="dueDate">
	<br>
	<label for="completed_display">Completed?</label>
	<input type="text" name="completed_display" value="${completed}" id="display_completion" readonly>
	<a href="/switch-complete?completed=${completed}&id=${task.id}" class="btn btn-warning">Update completion</a>
	<br>
	<input type="submit" value="Commit Changes" class="btn btn-primary">
</form>
</body>
<script type="text/javascript" src="script.js"></script>
</html>