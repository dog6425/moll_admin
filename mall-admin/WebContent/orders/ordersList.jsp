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
<title>Insert title here</title>
<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div>
	<jsp:include page = "/inc/menu.jsp"></jsp:include>
</div>

	<%
	request.setCharacterEncoding("utf-8");
	String ordersState = "";
	if(request.getParameter("ordersState") != null) {
		ordersState = request.getParameter("ordersState");
	}
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<OrdersAndProduct> list = null;
	ArrayList<String> list2 = null;
	
	if(ordersState.equals("")) {
		list = ordersDao.selectOrdersList();
	} else {
		list = ordersDao.selectOrdersListByState(ordersState);
	}
		list2 = ordersDao.selectOrdersStateList();

	%>
	<h1>주문 목록</h1>
	<form method="post" action="/mall-admin/orders/ordersList.jsp">
		<select name="ordersState">
			<option value="">선택</option>
			<%
				for(String s : list2) {
			%>
					<option value="<%=s%>"><%=s%></option>
			<%		
				}
			%>

		</select>
		<div><button type="submit" >주문상태별로 보기</button></div>
		</form>
	<div class="container-fluid">
	
	<table class="table table-hover table-orderless">
	<thead>
	
		<tr>
			<th>orders_id</th>
			<th>product_id</th>
			<th>product_name</th>
			<th>orders_amount</th>
			<th>orders_price</th>
			<th>member_email</th>
			<th>orders_addr</th>
			<th>orders_state</th>
			<th>orders_date</th>
			<th>orders_state 수정</th>
			
		</tr>
		
	
	</thead>
	<tbody>
		<%
			for(OrdersAndProduct ordersAndProduct : list){
		%>		
			
			<tr>
				<td><%=ordersAndProduct.orders.getOrdersId()%></td>
				<td><%=ordersAndProduct.orders.getProductId() %></td>
				<td><%=ordersAndProduct.product.getProductName() %></td>
				<td><%=ordersAndProduct.orders.getOrdersAmount() %></td>
				<td><%=ordersAndProduct.orders.getOrdersPrice() %></td>
				<td><%=ordersAndProduct.orders.getMemberEmail() %></td>
				<td><%=ordersAndProduct.orders.getOrdersAddr() %></td>
				<td><%=ordersAndProduct.orders.getOrdersState() %></td>
				<td><%=ordersAndProduct.orders.getOrdersDate() %></td>
				<td><a href = "/mall-admin/orders/modifyOrdersState.jsp?ordersId<%=ordersAndProduct.orders.getOrdersId()%>" >orders state 수정</a></td>
				</tr>

		<%		
			}
		%>
		</tbody>
	</table>
</div>
</body>
</html>