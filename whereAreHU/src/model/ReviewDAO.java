package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class ReviewDAO {

	public int updateReview(int review_id, String pName) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		int result = 0;
		String sql = "update review set photo = ? where review_id = ?";
		
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, pName);
			st.setInt(2, review_id);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}
	
	public int insertReview(ReviewVO review) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		int result = 0;
		String sql = "insert into review values(review_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
		
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, review.getUser_id());
			st.setString(2, review.getArea_num());
			st.setString(3, review.getReview());
			st.setString(4, review.getPhoto());
			st.setDouble(5, review.getRate());
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}
	
	public List<ReviewVO> selectAllReviews() {
		List<ReviewVO> rev_list = new ArrayList<ReviewVO>();
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = "select * from review";
		
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				ReviewVO rev = makeReview(rs);
				rev_list.add(rev);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return rev_list;
	}
	
	public ReviewVO selectReviewByUserInDetail(String user_id, String area_num) {
		ReviewVO rev = new ReviewVO();
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from review where user_id = ? and area_num = ?";
		
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, user_id);
			st.setString(2, area_num);
			rs = st.executeQuery();
			rev = makeReview(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return rev;
	}
	
	public List<ReviewVO> selectAllReviewsByUser(String user_id) {
		List<ReviewVO> rev_list = new ArrayList<ReviewVO>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from review where user_id = ?";
		
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, user_id);
			rs = st.executeQuery();
			while (rs.next()) {
				ReviewVO rev = makeReview(rs);
				rev_list.add(rev);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return rev_list;
	}
	
	public List<ReviewVO> selectAllReviewsByRestStop(String area_num) {
		List<ReviewVO> rev_list = new ArrayList<ReviewVO>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from review where area_num = ? order by review_id desc";
		
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, area_num);
			rs = st.executeQuery();
			while (rs.next()) {
				ReviewVO rev = makeReview(rs);
				rev_list.add(rev);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return rev_list;
	}

	private ReviewVO makeReview(ResultSet rs) throws SQLException {
		ReviewVO rev = new ReviewVO();
		rev.setReview_id(rs.getInt("review_id"));
		rev.setUser_id(rs.getString("user_id"));
		rev.setArea_num(rs.getString("area_num"));
		rev.setReview(rs.getString("review"));
		rev.setPhoto(rs.getString("photo"));
		rev.setRate(rs.getDouble("rate"));
		rev.setWrite_day(rs.getDate("write_day"));
		return rev;
	}
}
