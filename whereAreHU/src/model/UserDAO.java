package model;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class UserDAO {
	public List<UserVO> All() {
		List<UserVO> userlist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = "select * from user_tb";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				UserVO user = makeUser(rs);
				userlist.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return userlist;
		
	}
	
	
	 public int join(UserVO user) {
	
			Connection conn = DBUtil.getConnection();
			PreparedStatement st = null;
			int result=0;
		 String SQL = "INSERT INTO USER_TB VALUES (?,?,?,?,?)";
		 try {
			 conn.setAutoCommit(false);
			 st = conn.prepareStatement(SQL);
			 st.setString(1, user.getUser_id());
			 st.setString(2, user.getUser_pw());
			 st.setString(3, user.getUser_name());
			 st.setString(4, user.getUser_phone());
			 st.setString(5, user.getUser_email());
			 result=st.executeUpdate();
			conn.commit();
		 }catch(Exception e) {
			 try {
				 conn.rollback();
			 }catch(SQLException e1){
				 e1.printStackTrace();
			 }
			 e.printStackTrace();
		 }
		finally {
			DBUtil.dbClose(null, st, conn);
		}return result;
	 }
	
	public UserVO loginChk(String user_id, String user_pw) {
		UserVO user = new UserVO();
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		
		String sql = "select * from USER_TB where USER_ID = ? and USER_PW=?";
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, user_id);
			st.setString(2, user_pw);
			rs = st.executeQuery();
			while(rs.next()) {
			user = makeUser(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}

		return user;
	}

	private UserVO makeUser(ResultSet rs) throws SQLException {
		UserVO user = new UserVO();
		user.setUser_id(rs.getString("USER_ID"));
		user.setUser_pw(rs.getString("USER_PW"));
		user.setUser_name(rs.getString("USER_NAME"));
		user.setUser_phone(rs.getString("USER_PHONE"));
		user.setUser_email(rs.getString("USER_EMAIL"));
		return user;
	}

}
