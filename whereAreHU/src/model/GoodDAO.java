package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class GoodDAO {
	
			//로그인한 사용자가 좋아요했는지 여부
			public int selectByOne(String user_id, String area_num) {
				int isgood=-1;
				Connection conn= DBUtil.getConnection();
				PreparedStatement st= null;
				ResultSet rs= null;
				String sql="select isgood from good where user_id=? and area_num=?";
				try {
					st= conn.prepareStatement(sql);
					st.setString(1, user_id);
					st.setString(2, area_num);
					rs= st.executeQuery();
					while(rs.next()) {
						isgood = rs.getInt("isgood");
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					DBUtil.dbClose(rs, st, conn);
				}
				return isgood;
			}
			
			//내가 좋아요한 휴게소 id 조회(마이페이지)
			public List<ServiceAreaVO> selectByUserId(String user_id) {
				List<ServiceAreaVO> arealist = new ArrayList<ServiceAreaVO>();
				Connection conn= DBUtil.getConnection();
				PreparedStatement st= null;
				ResultSet rs= null;
				String sql="select * from service_area where area_num in (select area_num from good where user_id= ?)";
				try {
					st= conn.prepareStatement(sql);
					st.setString(1, user_id);
					rs= st.executeQuery();
					while(rs.next()) {
						ServiceAreaVO area = makeArea(rs);
						arealist.add(area);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					DBUtil.dbClose(rs, st, conn);
				}
				return arealist;
			}

			private ServiceAreaVO makeArea(ResultSet rs) throws SQLException {
				ServiceAreaVO area = new ServiceAreaVO();
				area.setArea_num(rs.getString("area_num"));
				area.setArea_name(rs.getString("area_name"));
				area.setAddress(rs.getString("address"));
				area.setArea_phone(rs.getString("area_phone"));
				area.setRoute(rs.getString("route"));
				area.setFname(rs.getString("fname"));
				area.setIsGas(rs.getInt("isGas"));
				area.setDescend(rs.getInt("descend"));
				area.setMinicar(rs.getInt("minicar"));
				area.setLargecar(rs.getInt("largecar"));
				area.setOthercar(rs.getInt("othercar"));
				area.setThumbsup(rs.getInt("thumbsup"));
				
				return area;
			}
			
			//한 가게를 좋아요 눌렀을 때 insert
			public int isGood(String user_id, String area_num) {
				//좋아요 누른적이 있는지 확인
				int result= selectByOne(user_id,area_num);
				String sql2=""; 
				int result2=0;
				if(result==-1) {
					//처음 누를 때
					sql2= "insert into good values (?,?,1)";
				}else {
					sql2= "update good set isgood=1 where user_id=? and area_num=?";
				}
				
				Connection conn= DBUtil.getConnection();
				PreparedStatement st= null;
				try {
					st= conn.prepareStatement(sql2);
					st.setString(1, user_id);
					st.setString(2, area_num);
					result2= st.executeUpdate(); 

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBUtil.dbClose(null, st, conn);
				}
				return result2;
			}
			
			//좋아요 취소
			public int cancelGood(String user_id, String area_num) {
				String sql= "update good set isgood=1 where user_id=? and area_num=?";
				Connection conn;
				PreparedStatement st= null;
				int result=0;
				
				conn= DBUtil.getConnection();
				
				try {
					st= conn.prepareStatement(sql);
					st.setString(1, user_id);
					st.setString(2, area_num);
					
					result= st.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBUtil.dbClose(null, st, conn);
				}	
				return result;
			}
			
}
