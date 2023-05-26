<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	// controller
	// subjectNo 유효성 검사
	if (request.getParameter("teacherNo") == null){
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
		return;
	}
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	// model
	TeacherDao sd = new TeacherDao();
	
	int row = sd.deleteTeacher(teacherNo);
	
	response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
%>