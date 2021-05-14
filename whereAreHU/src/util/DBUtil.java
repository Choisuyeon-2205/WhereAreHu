package util;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBUtil {
	
	//1. DB�뿰寃곗쓣 留뚮뱾�뼱二쇨린
	//192.168.0.120
	public static Connection getConnection() {
		Connection conn = null;
		String driverName ="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@192.168.0.102:1521:xe";
		String userid="hr", password="hr";
		
		try {
			Class.forName(driverName);
			conn= DriverManager.getConnection(url,userid,password);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
		return conn;
	}
	
	/*
	//1. DB�뿰寃곗쓣 留뚮뱾�뼱二쇨린(connection pool)
		public static Connection getConnection() {
			Connection conn = null;
			Context initContext;
			try {
				initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:/comp/env");
				DataSource ds = (DataSource)envContext.lookup("jdbc/ProOracle");
				try {
					conn = ds.getConnection();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return conn;
		}
	*/
	//2. �옄�썝諛섎궔
	public static void dbClose(ResultSet rs, Statement st, Connection conn) {
		try {
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
