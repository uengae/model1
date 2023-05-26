<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	//controller
	// subjectNo 유효성 검사
	if (request.getParameter("teacherNo") == null){
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
		return;
	}
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	// model
	// teacher data
	TeacherDao td = new TeacherDao();
	Teacher teacherOne = td.selectTeacherOne(teacherNo);
	
	// subjectName data
	TeacherSubjectDao tsd = new TeacherSubjectDao();
	String subjectName = tsd.selectTeacherSubject(teacherNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link id="theme" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
	<h1>update teacher</h1>
	<form action="<%=request.getContextPath()%>/teacher/updateTeacherAction.jsp" method="post">
		<table class="table">
			<tr>
				<th>teacher_no</th>
				<th>teacher_id</th>
				<th>teacher_name</th>
				<th>subject_name</th>
			</tr>
			<tr>
				<td>
					<input type="hidden" value="<%=teacherNo%>" name="teacherNo">
					<%=teacherOne.getTeacherNo()%>
				</td>
				<td>
					<input type="text" value="<%=teacherOne.getTeacherId()%>" name="teacherId">
				</td>
				<td>
					<input type="text" value="<%=teacherOne.getTeacherName()%>" name="teacherName">
				</td>
				<td><%=subjectName%></td>
			</tr>
			<tr>
				<th colspan="4">teacher_history</th>
			</tr>
			<tr>
				<td colspan="4">
					<textarea cols="70" rows="3" name="teacherHistory"><%=teacherOne.getTeacherHistory()%></textarea>
				</td>
			</tr>
		</table>
		<button class="btn btn-outline-primary" type="submit">수정</button>
	</form>
</body>
</html>