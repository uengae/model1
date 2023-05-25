<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	//controller
	int currentPage = 1;
	if (request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int rowPerPage = 10;
	if (request.getParameter("rowPerPage") != null){
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
	}
	
	int beginRow = (currentPage - 1) * rowPerPage;
	
	// model
	SubjectDao sd = new SubjectDao();
	
	ArrayList<Subject> list = new ArrayList<Subject>();
	list = sd.selectSubjectListByPage(beginRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link id="theme" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
	<table class="table">
		<tr>
			<th>subject_no</th>
			<th>subject_name</th>
			<th>subject_time</th>
			<th>updatedate</th>
			<th>createdate</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	<%
		for (Subject s : list){
	%>
			<tr>
				<td><%=s.getSubjectNo()%></td>
				<td><%=s.getSubjectName()%></td>
				<td><%=s.getSubjectTime()%></td>
				<td><%=s.getUpdatedate()%></td>
				<td><%=s.getCreatedate()%></td>
				<td>
					<a class="btn" href="<%=request.getContextPath()%>/subject/updateSubject.jsp?subjectNo=<%=s.getSubjectNo()%>">
						수정
					</a>
				</td>
				<td>
					<a class="btn" href="<%=request.getContextPath()%>/subject/deleteSubjectAction.jsp?subjectNo=<%=s.getSubjectNo()%>">
						삭제
					</a>
				</td>
			</tr>
	<%
		}
	%>
	</table>
	<a class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/subject/insertSubject.jsp">
		추가
	</a>
</body>
</html>