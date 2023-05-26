<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	// controller
	// 입력데이터 유효성 검사
	if (request.getParameter("teacherName") == null
			|| request.getParameter("teacherId") == null
			|| request.getParameter("teacherHistory") == null){
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
		return;
	}
	
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	// model
	TeacherDao td = new TeacherDao();
	
	Teacher teacher = new Teacher();
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	
	int row = td.insertTeacher(teacher);
	
	response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
%>