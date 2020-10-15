<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	Admin paramAdmin = new Admin();
	paramAdmin.getAdminId();
	paramAdmin.getAdminPw();
	
	AdminDao adminDao = new AdminDao();
	Admin loginAdmin = adminDao.login(paramAdmin);
	if(loginAdmin == null) {
		System.out.println("로그인 실패");
	} else {
		System.out.println("로그인 성공");
		// 로그인 정보를 sesseion에 저장(page < request < session < application)
		session.setAttribute("loginAdminId", loginAdmin.getAdminId()); // 세션에 변수 만드는 방법
		response.sendRedirect("/mall-admin/index.jsp");
	} 
%>
