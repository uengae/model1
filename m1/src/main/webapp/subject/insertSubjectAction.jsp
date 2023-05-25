<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	// controller
	// 입력데이터 유효성 검사
	if (request.getParameter("subjectName") == null
			|| request.getParameter("subjectTime") == null){
		response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
		return;
	}
	
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	// model
	SubjectDao sd = new SubjectDao();
	
	Subject subject = new Subject();
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	
	int row = sd.insertSubject(subject);
	
	response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
%>