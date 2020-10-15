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
		//sql ����
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
		//orders���̺��� ���� product���̺��� name���� ������ �����Ѵ�.
		String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct ordersAndProduct = new OrdersAndProduct();
			//���ԵǾ� �ִ� Ŭ������ ���� ǥ���Ѵ�.
			ordersAndProduct.orders = new Orders();
			ordersAndProduct.product = new Product();
			
			ordersAndProduct.orders.setOrdersId(rs.getInt("o.orders_id")); //�ֹ� ��ȣ(PK)
			ordersAndProduct.orders.setProductId(rs.getInt("o.product_id")); //��ǰ ��ȣ(FK)
			ordersAndProduct.orders.setOrdersAmount(rs.getInt("o.orders_amount")); //�ֹ��� ��ǰ ����
			ordersAndProduct.orders.setOrdersPrice(rs.getInt("o.orders_price")); //�ֹ��� ��ǰ�� �� ����
			ordersAndProduct.orders.setMemberEmail(rs.getInt("o.orders_email")); //�ֹ��� ����� �̸���
			ordersAndProduct.orders.setOrdersAddr(rs.getString("o.orders_addr"));//�ֹ��� ����� �ּ�
			ordersAndProduct.orders.setOrdersState(rs.getString("o.orders_state")); //�ֹ� ����(�����Ϸ�,��ۿϷ�,�ֹ����,����غ���)
			ordersAndProduct.orders.setOrdersDate( rs.getString("o.orders_date")); //�ֹ��� ��¥
			ordersAndProduct.product.setProductName(rs.getString("p.product_name"));// ��ǰ�� �̸�
			
			list.add(ordersAndProduct);
		}
		conn.close();
		return list;
	}

	public ArrayList<OrdersAndProduct> selectOrdersListByState1(String ordersState) throws Exception {
		
		return null;
	}
	// ordersState���� �˻��� ���̶� ��ġ�Ǵ� ���� ��Ī��Ŵ
		public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception{
			ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id  where o.orders_state = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, ordersState);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				//��ü�� ����
				OrdersAndProduct ordersAndProduct = new OrdersAndProduct();
				//���ԵǾ� �ִ� Ŭ������ ���� ǥ���Ѵ�.
				ordersAndProduct.orders = new Orders();
				ordersAndProduct.product = new Product();
				
				ordersAndProduct.orders.setOrdersId(rs.getInt("o.orders_id")); //�ֹ� ��ȣ(PK)
				ordersAndProduct.orders.setProductId(rs.getInt("o.product_id")); //��ǰ ��ȣ(FK)
				ordersAndProduct.orders.setOrdersAmount(rs.getInt("o.orders_amount")); //�ֹ��� ��ǰ ����
				ordersAndProduct.orders.setOrdersPrice(rs.getInt("o.orders_price")); //�ֹ��� ��ǰ�� �� ����
				ordersAndProduct.orders.setMemberEmail(rs.getInt("o.orders_email")); //�ֹ��� ����� �̸���
				ordersAndProduct.orders.setOrdersAddr(rs.getString("o.orders_addr"));//�ֹ��� ����� �ּ�
				ordersAndProduct.orders.setOrdersState(rs.getString("o.orders_state")); //�ֹ� ����(�����Ϸ�,��ۿϷ�,�ֹ����,����غ���)
				ordersAndProduct.orders.setOrdersDate( rs.getString("o.orders_date")); //�ֹ��� ��¥
				ordersAndProduct.product.setProductName(rs.getString("p.product_name"));// ��ǰ�� �̸�
				
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
