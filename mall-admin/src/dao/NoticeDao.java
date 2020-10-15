package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Notice;

public class NoticeDao {
	public Notice selectNoticeOne(int noticeId) throws Exception {
		Notice notice = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="select notice_id, notice_title, notice_content, notice_date from notice where notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			notice = new Notice();
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getString("notice_content"));
			notice.setNoticeDate(rs.getString("notice_date"));
			
		}
		conn.close();
		return notice;
	}
	//��ü����Ʈ ���
			public ArrayList<Notice> selectNoticeListAll() throws Exception {
				ArrayList<Notice> list = new ArrayList<Notice>();
				DBUtil dbUtil = new DBUtil();
				Connection conn = dbUtil.getConnection();
				
				String sql = "select notice_id, notice_title, notice_content, notice_date from notice order by notice_id desc limit 0, 10";
				PreparedStatement stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					Notice n =new Notice();
					n.setNoticeId(rs.getInt("notice_id"));
					n.setNoticeTitle(rs.getString("notice_title"));
					n.setNoticeContent(rs.getString("notice_cotent"));
					n.setNoticeDate(rs.getString("notice_date"));
					list.add(n);
				}
				conn.close();
				return list;
			}
	}
