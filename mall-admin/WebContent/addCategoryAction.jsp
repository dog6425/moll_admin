<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="vo.*" %>
    <%@ page import="dao.*" %>
<%
	//인코딩 통일
	request.setCharacterEncoding("utf-8");
	//기본키 옵션 받아줌
	String categoryName = request.getParameter("categoryName");
	//객체 선언
	Category category = new Category();
	category.getCategoryName();
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.insertCategory(category);
	
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
	
	
%>
	