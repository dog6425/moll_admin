<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
</head>
<%
	CategoryDao categoryDao = new CategoryDao();
// 전체 카테고리 이름 리스트
ArrayList<Category> categoryList = categoryDao.selectCategoryList();
// 추천 카테고리 이미지 리스트(4개)
ArrayList<Category> categoryList1 = categoryDao.selectCategoryListCkList();


%>
<body class="container">
<div>
	<!-- 검색바 -->
	<br>
	<div class="row">
		<div class="col"><h4>Goodee Shop</h4></div>
		<div class="col>">
			<form class="form-inline">
				<input class="form-control" type="text">
				<button class="btn btn-success" type="submit">검색<</button>
			</form>
		</div>
		<div class="col">
					<i class='fas fa-user-alt' style='font-size: 30px'></i> 
					&nbsp;&nbsp;&nbsp;
					<i class='fas fa-shopping-cart' style='font-size: 30px'></i>
				</div>		
	</div>
	<br>
	<div>
		<!-- 로그인/회원가입 -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<!-- Links -->
				<ul class="navbar-nav">
					<li class="nav-item"><a class="btn btn-secondary" href="#">로그인</a></li>
					<li class="nav-item"><a class="btn btn-secondary" href="#">회원가입</a></li>
				</ul>
			</nav>
		</div>
		<br>
		
		<div>
			<!-- 전체 카테고리3/이미지 배너9 -->
			<div class="row">
				<div class="col-sm-2">
					<!-- 전체카테고리 -->
					<div class="col-sm-2">
						<%
							for(Category c : categoryList1){
						%>
								<a href="" class="btn btn-outline-dark"><%=c.getCategoryName() %></a>
						<%
								
							}
						%>
					</div>
				</div>
				<div class="col-sm-10">
					<img src="<%=request.getContextPath()%>/images/b1.png">
				</div>
		</div>
		</div>
		
	<br>
		
		<%
			ProductDao productDao = new ProductDao();
			ArrayList<Product> productList = productDao.selectProductList();
		%>
	
			</tr>
		</table>
	</div>
</body>
</html>