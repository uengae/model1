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
	
	// 페이징 변수
	int beginRow = (currentPage - 1) * rowPerPage;
	int pagePerPage = 10;
	int beginPage = ((currentPage - 1) / pagePerPage) * pagePerPage + 1;
	int endPage = beginPage + pagePerPage - 1;
	
	// model
	TeacherDao td = new TeacherDao();
	
	ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	list = td.selectTeacherListByPage(beginRow, rowPerPage);
	
	// 페이징 변수
	int totalCnt = td.selectTeacherCnt();
	int lastPage = (int)Math.ceil((double)totalCnt / rowPerPage);
	// System.out.println(lastPage);
	if (endPage > lastPage) {
		endPage = lastPage;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link id="theme" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
	<h1>teacherList</h1>
	<table class="table">
		<tr>
			<th>teacher_id</th>
			<th>teacher_name</th>
			<th>subject_name</th>
			<th>상세보기</th>
		</tr>
	<%
		for (HashMap<String, Object> m: list){
	%>
			<tr>
				<td><%=m.get("teacherId")%></td>
				<td><%=m.get("teacherName")%></td>
				<td><%=m.get("subjectName")%></td>
				<td>
					<a class="btn" href="<%=request.getContextPath()%>/teacher/teacherOne.jsp?teacherNo=<%=m.get("teacherNo")%>">
						상세보기
					</a>
				</td>
			</tr>
	<%
		}
	%>
	</table>
	<table class="table">
		<tr>
	<%
			if (beginPage > 1){
	%>
				<td>
					<a class="btn btn-sm" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=beginPage - pagePerPage%>">
						이전
					</a>
				</td>
	<%
			}
			for(int i = beginPage; i <= endPage; i++){
				String currentPageNum = null;
				if (i == currentPage){
						currentPageNum = "btn-secondary";
				}
	%>
				<td>
					<a class="btn btn-sm <%=currentPageNum%>" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=i%>">
						<%=i%>
					</a>
				</td>
	<%
			}
			if (endPage < lastPage){
	%>
				<td>
					<a class="btn btn-sm" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=beginPage + pagePerPage%>">
						다음
					</a>
				</td>
	<%
			}
	%>
		</tr>
	</table>
	<a class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/insertTeacher.jsp">
		추가
	</a>
</body>
</html>