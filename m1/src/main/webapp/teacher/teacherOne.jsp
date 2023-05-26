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
	<h1>teacherOne</h1>
	<table class="table">
		<tr>
			<th>teacher_no</th>
			<th>teacher_id</th>
			<th>teacher_name</th>
			<th>subject_name</th>
		</tr>
		<tr>
			<td><%=teacherOne.getTeacherNo()%></td>
			<td><%=teacherOne.getTeacherId()%></td>
			<td><%=teacherOne.getTeacherName()%></td>
			<td><%=subjectName%></td>
		</tr>
		<tr>
			<th colspan="4">teacher_history</th>
		</tr>
		<tr>
			<td colspan="4"><%=teacherOne.getTeacherHistory()%></td>
		</tr>
		<tr>
			<th>createdate</th>
			<th>updatedate</th>
			<td rowspan="2">
				<a class="btn btn-outline-primary" href="<%=request.getContextPath()%>/teacher/updateTeacher.jsp?teacherNo=<%=teacherOne.getTeacherNo()%>">
					수정
				</a>
			</td>
			<td rowspan="2">
				<a class="btn btn-outline-primary" href="<%=request.getContextPath()%>/teacher/deleteTeacherAction.jsp?teacherNo=<%=teacherOne.getTeacherNo()%>">
					삭제
				</a>
			</td>
		</tr>
		<tr>
			<td><%=teacherOne.getCreatedate()%></td>
			<td><%=teacherOne.getUpdatedate()%></td>
		</tr>
	</table>
</body>
</html>