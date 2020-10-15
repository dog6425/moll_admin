<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*"%>
    <%@ page import="dao.*" %>
    <%@ page import="vo.*" %>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<jsp:include page = "/inc/menu.jsp"></jsp:include>
	</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<h1>해산물 추가</h1>
	<form method="post" action="/mall-admin/product/addproductAction.jsp">
		<table border="1" style="color: #FFA7A7;">
			<tr>
				<td>category_id</td>
				<td>
					<select name="categoryId">
						<option value="">카테고리선택</option>
						<%
							for(Category c : categoryList) {
						%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryName()%></option>
						<%		
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>product_name</td>
				<td>
					<input type="text" name="productName">
				</td>
			</tr>
			<tr>
				<td>product_price</td>
				<td>
					<input type="text" name="productPrice">
				</td>
			</tr>
			<tr>
				<td>product_content</td>
				<td>
					<textarea rows="5" cols="80" name="productContent"></textarea>
				</td>
			</tr>
			<tr>
				<td>product_soldout</td>
				<td>
					<input type="radio" name="productSoldout" value="N" checked="checked">품절아님
					<input type="radio" name="productSoldout" value="Y">품절
				</td>
			</tr>
		</table>
		<button type="button" class="btn-primary">상품 추가</button>
	</form>
</body>
</html>