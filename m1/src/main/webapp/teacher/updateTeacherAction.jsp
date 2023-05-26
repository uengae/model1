<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	// controller
	// teacherNo 유효성 검사
	if (request.getParameter("teacherNo") == null){
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
		return;
	}
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	// 수정데이터 유효성 검사
	if (request.getParameter("teacherName") == null
			|| request.getParameter("teacherId") == null
			|| request.getParameter("teacherHistory") == null){
		response.sendRedirect(request.getContextPath() + "/teacher/updateTeacher.jsp?teacherNo" + teacherNo);
		return;
	}
	
	String teacherName = request.getParameter("teacherName");
	String teacherId = request.getParameter("teacherId");
	String teacherHistory = request.getParameter("teacherHistory");
	System.out.printf("teacherName = %s teacherId = %s teacherHistory = %s", teacherName, teacherId, teacherHistory);
	// model
	TeacherDao td = new TeacherDao();
	
	Teacher teacher = new Teacher();
	teacher.setTeacherNo(teacherNo);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherId(teacherId);
	teacher.setTeacherHistory(teacherHistory);
	
	int row = td.updateTeacher(teacher);
	
	// 입력 성공 실패 따른 분기
	if (row == 1){
		response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
	} else {
		response.sendRedirect(request.getContextPath() + "/teacher/updateTeacher.jsp?teacherNo=" + teacherNo);
	}
%>