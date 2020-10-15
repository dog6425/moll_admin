<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>categoryList</title>
<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


</head>
<body>
	<div class="jumbotron">
		<h1>광교횟집</h1>
		<p>주소   <br>: 
		<a href="https://map.naver.com/v5/search/%EA%B4%91%EA%B5%90%ED%9A%9F%EC%A7%91/place/1398428675?c=14140016.5914178,4480752.9300198,15,0,0,0,dh&placePath=%3F%2526">
			경기 수원시 장안구 창훈로 19-2</a></p>
		<p>Instagram <br>: 
		<a href="https://www.instagram.com/gwanggyo_sushi/">
			gwanggyo_sushi</a></p>
		
	

	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<h1>categoryList</h1>
	<div>
		<a href="/mall-admin/category/addCategory.jsp" class="btn btn-into" role="button">해산물 추가</a>
	</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list = categoryDao.selectCategoryList();
		
	%>
	<div class="container-fluid">
	<table class="table table-hover table-borderless">
	<thead>
		<tr>
			<td>카테고리 번호</td>
			<td>카테고리 이름</td>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		</thead>
		<tbody>
		<%
			for(Category c : list){
		%>	
			<tr>
				<td><%=c.getCategoryId() %></td>
				<td><%=c.getCategoryName() %></td>
				<td><a href="/mall-admin/cateogory/UpdateCategory.jsp?categoryId=<%=c.getCategoryId() %>">수정</a></td>
				<td><a href="/mall-damin/category/DeleteCategoryAction.jsp?categoryId=<%=c.getCategoryId() %>">삭제</a></td>
			</tr>
		<%		
			}
		%>
		</tbody>
	</table>
	</div>
</body>
</html>