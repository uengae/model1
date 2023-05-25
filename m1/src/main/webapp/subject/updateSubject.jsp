<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%	
	request.setCharacterEncoding("utf-8");
	// subjectNo 유효성 검사
	if (request.getParameter("subjectNo") == null){
		response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
		return;
	}
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	SubjectDao sd = new SubjectDao();
	
	Subject subjectOne = sd.SelectSubjectOne(subjectNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link id="theme" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
	<form action="<%=request.getContextPath()%>/subject/updateSubjectAction.jsp" method="post">
		<table class="table">
			<tr>
				<th>subject_no</th>
				<th>subject_name</th>
				<th>subject_time</th>
				<th>updatedate</th>
				<th>createdate</th>
			</tr>
				<tr>
					<td>
						<input type="hidden" value="<%=subjectOne.getSubjectNo()%>" name="subjectNo">
						<%=subjectOne.getSubjectNo()%>
					</td>
					<td>
						<input type="text" value="<%=subjectOne.getSubjectName()%>" name="subjectName">
					</td>
					<td>
						<input type="number" value="<%=subjectOne.getSubjectTime()%>" name="subjectTime">
					</td>
					<td><%=subjectOne.getUpdatedate()%></td>
					<td><%=subjectOne.getCreatedate()%></td>
				</tr>
		</table>
		<button class="btn btn-outline-secondary" type="submit">수정</button>
	</form>
</body>
</html>