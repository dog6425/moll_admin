package dao;

import java.util.*;

import commons.DBUtil;
import vo.*;
import java.sql.*;

;
public class OrdersDao {
	
	public void updateOrdersState1(Orders orders) { 
		String sql = "update orders set orders_state=? where orders_id = ?";
	}
	
	public Orders selectOrdersOne1(int ordersId) {
		String sql = "select orders_id, orders_state from orders where orders_id=?";
		return null;
	}
	
	public ArrayList<String> selectOrdersStateList() throws Exception {
		ArrayList<String> list = new ArrayList<String>();
		//sql 서버
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql ="SELECT DISTINCT orders_state FROM orders";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt + "<-stmt");

		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			list.add(rs.getString("orders_state"));
		}

		conn.close();
		return list;
	}

	//
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception {
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//orders테이블의 값과 product테이블의 name값을 가져와 조인한다.
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct ordersAndProduct = new OrdersAndProduct();
			//포함되어 있는 클래스의 값을 표시한다.
			ordersAndProduct.orders = new Orders();
			ordersAndProduct.product = new Product();
			
			ordersAndProduct.orders.setOrdersId(rs.getInt("o.orders_id")); //주문 번호(PK)
			ordersAndProduct.orders.setProductId(rs.getInt("o.product_id")); //상품 번호(FK)
			ordersAndProduct.orders.setOrdersAmount(rs.getInt("o.orders_amount")); //주문한 상품 갯수
			ordersAndProduct.orders.setOrdersPrice(rs.getInt("o.orders_price")); //주문한 상품의 총 가격
			ordersAndProduct.orders.setMemberEmail(rs.getInt("o.orders_email")); //주문한 사람의 이메일
			ordersAndProduct.orders.setOrdersAddr(rs.getString("o.orders_addr"));//주문산 사람의 주소
			ordersAndProduct.orders.setOrdersState(rs.getString("o.orders_state")); //주문 상태(결제완료,배송완료,주문취소,배송준비중)
			ordersAndProduct.orders.setOrdersDate( rs.getString("o.orders_date")); //주문한 날짜
			ordersAndProduct.product.setProductName(rs.getString("p.product_name"));// 상품의 이름
			
			list.add(ordersAndProduct);
		}
		conn.close();
		return list;
	}

	public ArrayList<OrdersAndProduct> selectOrdersListByState1(String ordersState) throws Exception {
		
		return null;
	}
	// ordersState에서 검색한 값이랑 일치되는 값을 매칭시킴
		public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception{
			ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id  where o.orders_state = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, ordersState);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				//객체를 지정
				OrdersAndProduct ordersAndProduct = new OrdersAndProduct();
				//포함되어 있는 클래스의 값을 표시한다.
				ordersAndProduct.orders = new Orders();
				ordersAndProduct.product = new Product();
				
				ordersAndProduct.orders.setOrdersId(rs.getInt("o.orders_id")); //주문 번호(PK)
				ordersAndProduct.orders.setProductId(rs.getInt("o.product_id")); //상품 번호(FK)
				ordersAndProduct.orders.setOrdersAmount(rs.getInt("o.orders_amount")); //주문한 상품 갯수
				ordersAndProduct.orders.setOrdersPrice(rs.getInt("o.orders_price")); //주문한 상품의 총 가격
				ordersAndProduct.orders.setMemberEmail(rs.getInt("o.orders_email")); //주문한 사람의 이메일
				ordersAndProduct.orders.setOrdersAddr(rs.getString("o.orders_addr"));//주문산 사람의 주소
				ordersAndProduct.orders.setOrdersState(rs.getString("o.orders_state")); //주문 상태(결제완료,배송완료,주문취소,배송준비중)
				ordersAndProduct.orders.setOrdersDate( rs.getString("o.orders_date")); //주문한 날짜
				ordersAndProduct.product.setProductName(rs.getString("p.product_name"));// 상품의 이름
				
				list.add(ordersAndProduct);
			}
			conn.close();
			return list;
		}
		
		public void updateOrdersStateById(Orders orders) throws Exception{
			
		}	
		public void updateOrdersState(Orders orders) {
			String sql = "update orders set orders_state = ? where orders_id = ?";
		}
		
		public Orders selectOrdersOne(int OrdersId) {
			String sql ="select orders_id, orders_state from orders where orders_id=? ";
			return null;
		}
	}
