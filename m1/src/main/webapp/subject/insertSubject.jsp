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
	<form action="<%=request.getContextPath()%>/subject/insertSubjectAction.jsp" method="post">
		<table class="table">
			<tr>
				<th>subject_name</th>
				<th>subject_time</th>
			</tr>
				<tr>
					<td>
						<input type="text" name="subjectName">
					</td>
					<td>
						<input type="number" name="subjectTime">
					</td>
				</tr>
		</table>
		<button class="btn btn-outline-secondary" type="submit">추가</button>
	</form>
</body>
</html>