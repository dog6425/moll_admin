<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="vo.*" %>
    <%@ page import="dao.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
#w	{
		color: #FFFFFF;
	}
</style>
</head>
<body>
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		int categoryId = -1;
		if(request.getParameter("categoryId")!=null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = null;
		if(categoryId == -1){
			productList = productDao.selectProductList();
			
		}else{
			productList = productDao.selectProductListByCategoryId(categoryId);
		}
		
		
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	
	%>
	
	<h1 id="w">상품 목록</h1>
	<div class="container-fluid">
	<div>
		<%
			for(Category c : categoryList){
				
		%>
			<a href="/mall-admin/product/prodcutList.jsp? categoryId=<%=c.getCategoryId() %>" style="color: white;">
			[<%=c.getCategoryName() %>]</a>

		<%
			}
		%>
	</div>
	
	<div>
		<a href="/mall-admin/product/addProduct.jsp "style=color: white" >상품 추가</a>
	</div>
	
	<table class="table table-primary table-striped table-hover">
	<thead>
	
		<tr>
			<th>product_id</th>
			<th>category_id</th>
			<th>product_name</th>
			<th>product_price</th>
			<th>product_soldout</th>
		</tr>
		</thead>
		<tbody>
			<%
				for(Product p : productList){
					if(p.getProductSoldout().equals("Y")){
						
				
			%>
				<tr>
					<td><%=p.getProductId() %></td>
					<td><%=p.getCategoryId()%></td>
					<td><%=p.getProductName()%></td>
					<td><%=p.getProductPrice()%></td>
					<td><%=p.getProductContent()%></td>
					<td>폼절</td>
				</tr>
			<%
				}	else{
						
			%>
				
				<tr>
					<td><%=p.getProductId() %></td>
					<td><%=p.getCategoryId()%></td>
					<td><%=p.getProductName()%></td>
					<td><%=p.getProductPrice()%></td>
					<td><%=p.getProductContent()%></td>
				</tr>
			<%
				}
			
				}
			%>
		</table>
		<div>
			<a href="/mall-admin/product/addProduct.jsp" class="btn btn-warning text-white " role="button"  >[상품 추가]</a>
			<a href="/mall-admin/product/productList.jsp" class="btn btn-info" role="button">[원래대로]</a>
		</div>
	</div>
</body>
</html>