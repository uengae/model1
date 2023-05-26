<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%	
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link id="theme" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
	<h1>insert teacher</h1>
	<form action="<%=request.getContextPath()%>/teacher/insertTeacherAction.jsp" method="post">
		<table class="table">
			<tr>
				<th>teacher_id</th>
				<td>
					<input type="text" name="teacherId">
				</td>
			</tr>
			<tr>
				<th>teacher_name</th>
				<td>
					<input type="text" name="teacherName">
				</td>
			</tr>
			<tr>
				<th>teacher_history</th>
				<td>
					<textarea cols="70" rows="3" name="teacherHistory"></textarea>
				</td>
			</tr>
		</table>
		<button class="btn btn-outline-secondary" type="submit">추가</button>
	</form>
</body>
</html>