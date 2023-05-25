<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	// controller
	// subjectNo 유효성 검사
	if (request.getParameter("subjectNo") == null){
		response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
		return;
	}
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	// model
	SubjectDao sd = new SubjectDao();
	
	int row = sd.deleteSubject(subjectNo);
	
	response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
%>