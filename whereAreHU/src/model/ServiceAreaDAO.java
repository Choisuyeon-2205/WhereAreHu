package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class ServiceAreaDAO {
	//휴게소 데이터 추가
	public int insertArea(ServiceAreaVO area) {
		int result=0;
		Connection conn= null;
		PreparedStatement st= null;
		
		String sql= "insert into service_area values(?,?,?,?,?,?,?,?,?,?,?)";
		
		conn= DBUtil.getConnection();
		
		try {	
			st= conn.prepareStatement(sql);
			st.setString(1, area.getArea_num());
			st.setString(2, area.getArea_name());
			st.setString(3, area.getAddress());
			st.setString(4, area.getArea_phone());
			st.setString(5, area.getRoute());
			st.setString(6, area.getFname());
			st.setInt(7, area.getIsGas());
			st.setInt(8, area.getDescend());
			st.setInt(9, area.getMinicar());
			st.setInt(10, area.getLargecar());
			st.setInt(11, area.getOthercar());
			
			result= st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		
		return result;
	}
	
	//전체 조회
	public List<ServiceAreaVO> selectAllArea() {
		List<ServiceAreaVO> arealist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = "select * from service_area";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
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
	
	//휴게소 상세 조회
	public ServiceAreaVO selectOneArea(String area_num) {
		ServiceAreaVO area = new ServiceAreaVO();
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		
		String sql = "select * from service_area where area_num = ?";
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, area_num);
			rs = st.executeQuery();
			while(rs.next()) {
			area = makeArea(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}

		return area;
	}
	
	//검색 조회
		public List<ServiceAreaVO> selectSearchArea(String str) {
			List<ServiceAreaVO> arealist = new ArrayList<>();
			Connection conn = DBUtil.getConnection();
			PreparedStatement st= null;
			ResultSet rs = null;
			String sql = "select * from service_area where route like ('%'||?||'%') or address like ('%'||?||'%') or area_name like ('%'||?||'%')";
			try {
				st= conn.prepareStatement(sql);
				st.setString(1, str);
				st.setString(2, str);
				st.setString(3, str);
				rs = st.executeQuery();
				while (rs.next()) {
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

		//노선별 조회
		public List<ServiceAreaVO> selectRouteArea(String route) {
			List<ServiceAreaVO> arealist = new ArrayList<>();
			Connection conn = DBUtil.getConnection();
			PreparedStatement st= null;
			ResultSet rs = null;
			String sql = "select * from service_area where route= '%'||?||'%'";
			try {
				st= conn.prepareStatement(sql);
				st.setString(1, route);
				rs = st.executeQuery(sql);
				while (rs.next()) {
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

		//지역별 조회
		public List<ServiceAreaVO> selectAddressArea(String city) {
			List<ServiceAreaVO> arealist = new ArrayList<>();
			Connection conn = DBUtil.getConnection();
			PreparedStatement st= null;
			ResultSet rs = null;
			String sql = "select * from service_area where address like ('%'||?||'%')";
			try {
				st= conn.prepareStatement(sql);
				st.setString(1, city);
				rs = st.executeQuery();
				while (rs.next()) {
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

		//경로 전체 조회
		public List<String> selectAllRoute() {
			List<String> routes = new ArrayList<>();
			Connection conn = DBUtil.getConnection();
			Statement st = null;
			ResultSet rs = null;
			String sql = "select distinct route from service_area";
			try {
				st = conn.createStatement();
				rs = st.executeQuery(sql);
				while (rs.next()) {
					routes.add(rs.getString("route"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, st, conn);
			}
			return routes;

		}
		
		public List<ServiceAreaVO> selectAddressArea2(List<String> city) {
			List<ServiceAreaVO> arealist = new ArrayList<>();
			Connection conn = DBUtil.getConnection();
			Statement st= null;
			ResultSet rs = null;
			String sql = "select * from service_area";
			
			for(int i=0; i<city.size(); i++) {
				if(i==0) sql+=" where address like '"+city.get(i)+"%'";
				else sql+=" or address like '"+city.get(i)+"%'";
			}
			try {
				st= conn.createStatement();
				rs = st.executeQuery(sql);
				while (rs.next()) {
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


		public List<ServiceAreaVO> selectRoutePlus(String route, String oil, String updown){
			List<ServiceAreaVO> routelist = new ArrayList<>();
			Connection conn = DBUtil.getConnection();
			PreparedStatement st= null;
			ResultSet rs = null;
			String sql = "select * from service_area where 1 = 1 ";
			
			String route_where="";				
			if(!route.equals("all"))  route_where = " and route= '" + route + "'";		

		    String oil_where="";				
			if(!oil.equals("all"))  
				oil_where = " and isgas= " + (oil.equals("yes")?"1":"0") ;
			 				
		 
			String updown_where="";				
			if(!updown.equals("all"))  updown_where = " and descend= " +  (updown.equals("yes")?"1":"0");		
			sql += route_where + oil_where + updown_where;
            System.out.println(sql);
			
			try {
				st= conn.prepareStatement(sql);
				rs = st.executeQuery();
				while (rs.next()) {
					ServiceAreaVO area = makeArea(rs);
					routelist.add(area);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, st, conn);
			}
			return routelist;

		}

		
}
