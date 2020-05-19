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

	public ArrayList<Building> getDeviceList() {
		ArrayList<Building> devList = new ArrayList<Building>(); 
		try {
			ResultSet rs = null;
			String sql = "select building_name from building_register";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Building dc = new Building();
				dc.setId(rs.getString(1));
				
				System.out.println(dc.toString());
				
				devList.add(dc);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return devList;
	}
	
	public Building getDeviceCommon(String building_name) {
		Building dc = new Building(); 
		try {
			ResultSet rs = null;
			String sql = "select building_name from building_register"
						+ " where building_name = '" + building_name + "';";
			
			System.out.println(sql);
			
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				dc.setId(rs.getString(1));
				System.out.println(dc.toString());
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return dc;
	}
	
}
