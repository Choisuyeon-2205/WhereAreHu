package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBUtil;

public class FoodDAO {

	public int insertfood(FoodVO food) {
		int result=0;
		Connection conn= null;
		PreparedStatement st= null;
		
		String sql= "insert into food values(?,?,?,?,?,?)";
		
		conn= DBUtil.getConnection();

		try {	
			st= conn.prepareStatement(sql);
			st.setInt(1, food.getFood_id());
			st.setString(2, food.getFood_name());
			st.setString(3, food.getFood_context());
			st.setString(4, food.getFood_best());
			st.setInt(5, food.getFood_cost());
			st.setString(6, food.getArea_num());
			
			result= st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		
		return result;
	}

	public List<FoodVO> selectFoodsByArea_num(String area_num) {
		List<FoodVO> foodlist= new ArrayList<>();
		Connection conn= DBUtil.getConnection();
		PreparedStatement st= null;
		ResultSet rs= null;
		String sql= "select * from food where area_num=?";
		
		try {
			st= conn.prepareStatement(sql);
			st.setString(1, area_num);
			rs= st.executeQuery();
			while(rs.next()) {
				FoodVO food = makeFoodList(rs);
				foodlist.add(food);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}


		return foodlist;
	}

	private FoodVO makeFoodList(ResultSet rs) throws SQLException {
		FoodVO food= new FoodVO();
		food.setFood_id(rs.getInt("food_id"));
		food.setFood_name(rs.getString("food_name"));
		food.setFood_context(rs.getString("food_context"));
		food.setFood_best(rs.getString("food_best"));
		food.setFood_cost(rs.getInt("food_cost"));
		food.setArea_num(rs.getString("area_num"));
		
		return food;
	}

}
