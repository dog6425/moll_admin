<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
<title>Insert title here</title>

</head>
<body>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
	<%	
		request.setCharacterEncoding("utf-8");
	
		int productId = Integer.parseInt(request.getParameter("productId"));
	 	System.out.println(productId+ "<--productId");
	 	
		ProductDao productDao = new ProductDao();
		Product product = null;
		product = productDao.selectProductOne(productId);
	%>
		<h1 class="bg-warning text-white">상품수정</h1>
		<form method="post" action="/mall-admin/product/productUpdateAction.jsp">
		<table class="table table-bordered">
				<tr class="table-info">
					<td>상품 번호</td>
					<td><input type="hidden" value=<%=product.getProductId() %> name="productId"><%=product.getProductId() %></td>
				</tr>
				<tr class="table-warning">
					<td>카테고리 번호</td>
					<td><input type="hidden" value=<%=product.getCategoryId() %> name="categoryId"><%=product.getCategoryId() %></td>				
				</tr>
				<tr class="table-info">
					<td>상품 이름</td>
					<td><input type="text" value=<%=product.getProductName() %> name="productName"></td>				
				</tr>
				<tr class="table-warning">
					<td>상품 가격</td>
					<td><input type="text" value=<%=product.getProductPrice() %> name="productPrice"></td>				
				</tr>
				<tr class="table-info">
					<td>코멘트</td>
					<td><input type="text" value=<%=product.getProductContent() %> name="productContent"></td>				
				</tr>
				<tr class="table-warning">
					<td>판매 현황</td>
					<td>
						<%				
							if(product.getProductSoldout().equals("Y")) {
						%>		
								<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>" class="btn btn-warning text-white" role="button">[품절]</a>
						<%		
							} else {
						%>		
								<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.getProductId()%>&productSoldout=<%=product.getProductSoldout()%>" class="btn btn-warning text-white" role="button">[판매중]</a>
						<%		
							}
						%>
					</td>				
				</tr>						
		</table>
		<button type="submit" class="btn btn-info text-white" role="button">[수정 확인]</button>
		</form>
	</div>
</body>
</html>