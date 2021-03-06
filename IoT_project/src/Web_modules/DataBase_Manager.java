package Web_modules;

import java.sql.*;
import java.util.*;
import DataBase_structure.*;

public class DataBase_Manager {
	public static String DB_DRIVERCLASS = "com.mysql.jdbc.Driver";
	public static String DEFAULT_IP = "localhost";
	public static String DEFAULT_DATABASE = "jsptest";
	public static String DEFAULT_ID = "jspid";
	public static String DEFAULT_PW = "jsppass";

	public Connection conn;
	public String jdbcDriver; 
	public String dbUser;
	public String dbPwd;

	public DataBase_Manager() {
		this.conn = null;
		
		this.dbUser = DataBase_Manager.DEFAULT_ID;
		this.dbPwd = DataBase_Manager.DEFAULT_PW;
		this.jdbcDriver = "jdbc:mysql://" + DataBase_Manager.DEFAULT_IP + ":3306/" 
				+ DataBase_Manager.DEFAULT_DATABASE + "?useUnicode=true&characterEncoding=utf8";

	}

	public boolean connect() {
		try {
			Class.forName(DataBase_Manager.DB_DRIVERCLASS);
			conn = DriverManager.getConnection(this.jdbcDriver, this.dbUser, this.dbPwd);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}
	
	public boolean disconnect() {
		try {
			
			conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
		return true;
	}

	public ArrayList<Building> getBuildingList() {
		ArrayList<Building> bList = new ArrayList<Building>(); 
		try {
			ResultSet rs = null;
			String sql = "select building_name from building_register";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Building bl = new Building();
				bl.setId(rs.getString(1));
				
				System.out.println(bl.toString());
				
				bList.add(bl);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return bList;
	}
	
	public Building getbuilding(String building_name) {
		Building bl = new Building(); 
		try {
			ResultSet rs = null;
			String sql = "select building_name from building_register"
						+ " where building_name = '" + building_name + "';";
			
			System.out.println(sql);
			
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				bl.setId(rs.getString(1));
				System.out.println(bl.toString());
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return bl;
	}
	
}
