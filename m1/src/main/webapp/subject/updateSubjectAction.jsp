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
	
	// 수정데이터 유효성 검사
	if (request.getParameter("subjectName") == null
			|| request.getParameter("subjectTime") == null){
		response.sendRedirect(request.getContextPath() + "/subject/updateSubject.jsp?subjectNo" + subjectNo);
		return;
	}
	
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	
	// model
	SubjectDao sd = new SubjectDao();
	
	Subject subject = new Subject();
	subject.setSubjectNo(subjectNo);
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	
	int row = sd.updateSubject(subject);
	
	// 입력 성공 실패 따른 분기
	if (row == 1){
		response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
	} else {
		response.sendRedirect(request.getContextPath() + "/subject/updateSubject.jsp?subjectNo=" + subjectNo);
	}
%>