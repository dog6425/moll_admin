package dao;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Category;
import java.sql.*;

public class CategoryDao {
	// 카테고리를 추가
	public void insertCategory(Category category) throws Exception {
		//
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		// sql문
		String sql = "insert into category(category_name) values(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,category.getCategoryName());
		// 실행
		stmt.executeUpdate();
		// 종료
		conn.close();
		//
	}
	
	// 카테고리 출력
	public ArrayList<Category> selectCategoryList() throws Exception	{
		ArrayList<Category> list = new ArrayList<Category>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getNString("category_name"));
			list.add(category);
		}
		 
		conn.close();
		return list;
	
	
	}
	public void deleteCategory(Category category) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "delete from category where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,category.getCategoryId());
		stmt.setNString(2, category.getCategoryName());
		stmt.executeUpdate();
		conn.close();
	}

	public void updateCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update category set category_name = ? where category_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,category.getCategoryId());
		stmt.setString(2,category.getCategoryName());
		stmt.executeUpdate();
		conn.close();
	}
	public Category selectCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		Category category1 = null;
		while(rs.next()) {
			category1 = new Category();
			category1.setCategoryId(rs.getInt("category_id"));
			category1.setCategoryName(rs.getNString("category_name"));
		}
			conn.close();
			return category1;
	}
	public ArrayList<Category> selectCategoryListCkList() throws Exception	{
		ArrayList<Category> list = new ArrayList<Category>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select category_id, category_name from category ORDER BY category_ck desc LIMIT 0, 2";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getNString("category_name"));
			list.add(category);
		}
		 
		conn.close();
		return list;
	}
	
}
