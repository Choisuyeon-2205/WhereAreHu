package restarea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.ServiceAreaVO;
import util.DBUtil;

public class RestAreaDAO {
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
}
