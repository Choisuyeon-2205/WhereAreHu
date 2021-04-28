package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class OilDAO {
	public int insertOil(OilVO oil) {
		int result=0;
		Connection conn= null;
		PreparedStatement st= null;
		
		String sql= "insert into oil(OIL_ID,OIL_NAME,OIL_DIRE,OIL_TEL,OIL_FIRM,OISLPG,GPRICE,DPRICE,LPRICE,AREA_NUM) values(?,?,?,?,?,?,?,?,?,?)";
		
		conn= DBUtil.getConnection();

		try {	
			st= conn.prepareStatement(sql);
			st.setString(1, oil.getOil_id());
			st.setString(2, oil.getOil_name());
			st.setString(3, oil.getOil_dire());
			st.setString(4, oil.getOil_tel());
			st.setString(5, oil.getOil_firm());
			st.setString(6, oil.getOislpg());
			st.setString(7, oil.getGprice());
			st.setString(8, oil.getDprice());
			st.setString(9, oil.getLprice());
			st.setString(10, oil.getArea_num());
			
			result= st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		
		return result;
	}

	public int insertTimeOil(OilVO oil) {
		String sql= "update oil set oil_start=?, oil_end=? where area_num=?";
		Connection conn;
		PreparedStatement st= null;
		int result=0;
		
		conn= DBUtil.getConnection();
		
		try {
			st= conn.prepareStatement(sql);
			st.setString(1, oil.getOil_start());
			st.setString(2, oil.getOil_end());
			st.setString(3, oil.getArea_num());
	
			result= st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(null, st, conn);
		}	
		return result;
	}

	public OilVO selectOilByArea_name(String area_name) {
		OilVO oil= new OilVO();
		Connection conn= DBUtil.getConnection();
		PreparedStatement st= null;
		ResultSet rs= null;
		String sql= "select * from oil where oil_name like ?";
		
		try {
			st= conn.prepareStatement(sql);
			st.setString(1, area_name+"%");
			rs= st.executeQuery();
			while(rs.next()) {
				oil.setOil_id(rs.getString("oil_id"));
				oil.setOil_name(rs.getString("oil_name"));
				oil.setOil_dire(rs.getString("oil_dire"));
				oil.setOil_tel(rs.getString("oil_tel"));
				oil.setOil_firm(rs.getString("oil_firm"));
				oil.setOislpg(rs.getString("oislpg"));
				oil.setGprice(rs.getString("gprice"));
				oil.setDprice(rs.getString("dprice"));
				oil.setLprice(rs.getString("lprice"));
				oil.setOil_start(rs.getString("oil_start"));
				oil.setOil_end(rs.getString("oil_end"));
				oil.setArea_num(rs.getString("area_num"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return oil;
	}
	
	//전체 주유소 목록 조회
	public List<OilVO> selectAllOil() {
		List<OilVO> oillist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = "select * from oil";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				OilVO oil = makeOil(rs);
				oillist.add(oil);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return oillist;
		
	}

	private OilVO makeOil(ResultSet rs) throws SQLException {
		OilVO oil = new OilVO();
		oil.setOil_id(rs.getString("oil_id"));
		oil.setOil_name(rs.getString("oil_name"));
		oil.setOil_dire(rs.getString("oil_dire"));
		oil.setOil_tel(rs.getString("oil_tel"));
		oil.setOil_firm(rs.getString("oil_firm"));
		oil.setOislpg(rs.getString("oislpg"));
		oil.setGprice(rs.getString("gprice"));
		oil.setDprice(rs.getString("dprice"));
		oil.setLprice(rs.getString("lprice"));
		oil.setOil_start(rs.getString("oil_start"));
		oil.setOil_end(rs.getString("oil_end"));
		oil.setArea_num(rs.getString("area_num"));
		
		return oil;
	}
}
