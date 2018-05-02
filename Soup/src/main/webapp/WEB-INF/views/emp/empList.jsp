<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<title>Employee List</title>
</head>
<body>
	<h1>Employee List</h1>
	<table border="1">
		<tr>
			<th>No</th>
			<th>Name</th>
			<th>Job</th>
			<th>deptNo</th>
		</tr>
		<c:forEach items="${empList }" var="emp">
			<tr>
				<td>${emp.empNo }</td>
				<td>${emp.ename }</td>
				<td>${emp.job }</td>
				<td>${emp.deptNo }</td>
			</tr>
		</c:forEach>
		
	</table>

</body>
</html>