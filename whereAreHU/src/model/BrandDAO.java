package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBUtil;

public class BrandDAO {

	public int insertbrand(BrandVO brand) {
		int result=0;
		Connection conn= null;
		PreparedStatement st= null;
		
		String sql= "insert into brand values(brand_numbering.nextval,?,?,?,?,?,?)";
		
		conn= DBUtil.getConnection();

		try {	
			st= conn.prepareStatement(sql);
			st.setString(1, brand.getBrand_id());
			st.setString(2, brand.getBrand_name());
			st.setString(3, brand.getBrand_text());
			st.setString(4, brand.getBrand_start());
			st.setString(5, brand.getBrand_end());
			st.setString(6, brand.getArea_num());
			
			result= st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		
		return result;
	}

	public List<BrandVO> selectBrandsByArea_num(String area_num) {
		List<BrandVO> brandlist= new ArrayList<>();
		Connection conn= DBUtil.getConnection();
		PreparedStatement st= null;
		ResultSet rs= null;
		String sql= "select * from brand where area_num=?";
		
		try {
			st= conn.prepareStatement(sql);
			st.setString(1, area_num);
			rs= st.executeQuery();
			while(rs.next()) {
				BrandVO brand = makeBrandList(rs);
				brandlist.add(brand);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return brandlist;
	}
	
	private BrandVO makeBrandList(ResultSet rs) throws SQLException {
		BrandVO brand= new BrandVO();
		brand.setBrand_seq(rs.getInt("brand_seq"));
		brand.setBrand_id(rs.getString("brand_id"));
		brand.setBrand_name(rs.getString("brand_name"));
		brand.setBrand_text(rs.getString("brand_text"));
		brand.setBrand_start(rs.getString("brand_start"));
		brand.setBrand_end(rs.getString("brand_end"));
		brand.setArea_num(rs.getString("area_num"));
		
		return brand;
	}

}
