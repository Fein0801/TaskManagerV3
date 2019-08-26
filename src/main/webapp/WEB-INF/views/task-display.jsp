<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tasks</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lumen/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iqcNtN3rj6Y1HX/R0a3zu3ngmbdwEa9qQGHdkXwSRoiE+Gj71p0UNDSm99LcXiXV"
	crossorigin="anonymous">
</head>
<body>
<div class="container">
	<h1>${user.name}'s
		Task List <a href="/add-task" class="btn btn-lg btn-success">Add A
			Task</a>
	</h1>
	<p>${noTasks}</p>
	<table class="table">
		<thead>
			<tr>
				<th>#</th>
				<th>Description</th>
				<th>Due Date</th>
				<th>Completed?</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="task" items="${taskList}" varStatus="t">
				<tr>
					<td>${t.count}</td>
					<td>${task.description}</td>
					<td>${task.dueDate}</td>
					<td>
						<c:if test="${task.completed}">
							<input type="checkbox" name="complete" onclick="window.location.href='/mark-complete?id=${task.id}'" checked>
						</c:if> 
						<c:if test="${not task.completed}">
							<input type="checkbox" name="complete" onclick="window.location.href='/mark-complete?id=${task.id}'">
						</c:if>
					</td>
					<td>
						<a href="/edit-task?id=${task.id}" class="btn btn-warning">Edit</a>
					</td>
					<td>
						<a href="/delete-confirm?id=${task.id}" class="btn btn-danger">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>