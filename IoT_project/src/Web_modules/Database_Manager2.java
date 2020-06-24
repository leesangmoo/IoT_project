package Web_modules;

import java.sql.*;
import java.util.*;
import DataBase_structure.*;
public class Database_Manager2 {
	public static String DB_DRIVERCLASS = "com.mysql.jdbc.Driver";
	public static String DEFAULT_IP = "localhost";
	public static String DEFAULT_DATABASE = "jsptest";
	public static String DEFAULT_ID = "jspid";
	public static String DEFAULT_PW = "jsppass";

	public Connection conn;
	public String jdbcDriver; 
	public String dbUser;
	public String dbPwd;

	public Database_Manager2() {
		this.conn = null;
		
		this.dbUser = Database_Manager2.DEFAULT_ID;
		this.dbPwd = Database_Manager2.DEFAULT_PW;
		this.jdbcDriver = "jdbc:mysql://" + Database_Manager2.DEFAULT_IP + ":3306/" 
				+ Database_Manager2.DEFAULT_DATABASE + "?useUnicode=true&characterEncoding=utf8";

	}

	public boolean connect() {
		try {
			Class.forName(Database_Manager2.DB_DRIVERCLASS);
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

	public ArrayList<apply>getapplyList(String building_name) {
		ArrayList<apply> b_List = new ArrayList<apply>(); 
		try {
			ResultSet rs = null;
			String sql = "select human_name, time_s, building_name, building_sub_name, text,"
						+ "sysname, orgname from apply_table where  building_name = '" + building_name+ "';";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				apply bl = new apply();
				bl.sethuman_name(rs.getString(1));
				bl.settime_s(rs.getString(2));
				bl.setbuilding_name(rs.getString(3));
				bl.setbuilding_sub_name(rs.getString(4));
				bl.settext(rs.getString(5));
				bl.setsysname(rs.getString(6));
				bl.setorgname(rs.getString(7));
				
				System.out.println(bl.toString());
				
				b_List.add(bl);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return b_List;
	}
	
	public apply getapply_s(String human_name) {
		apply bl = new apply(); 
		try {
			ResultSet rs = null;
			String sql = "select human_name, time_s, building_name, building_sub_name, text,"
						+ "sysname, orgname from apply_table"
						+ " where human_name = '" + human_name+ "';";
			
			System.out.println(sql);
			
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				bl.sethuman_name(rs.getString(1));
				bl.settime_s(rs.getString(2));
				bl.setbuilding_name(rs.getString(3));
				bl.setbuilding_sub_name(rs.getString(4));
				bl.settext(rs.getString(5));
				bl.setsysname(rs.getString(6));
				bl.setorgname(rs.getString(7));
				System.out.println(bl.toString());
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return bl;
	}
	public apply getapply_s2(String building_name) {
		apply dc = new apply(); 
		try {
			ResultSet rs = null;
			String sql = "select human_name, time_s, building_name, building_sub_name, text,"
						+ "sysname, orgname from apply_table"
						+ " where building_name = '" + building_name+ "';";
			
			System.out.println(sql);
			
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				dc.sethuman_name(rs.getString(1));
				dc.settime_s(rs.getString(2));
				dc.setbuilding_name(rs.getString(3));
				dc.setbuilding_sub_name(rs.getString(4));
				dc.settext(rs.getString(5));
				dc.setsysname(rs.getString(6));
				dc.setorgname(rs.getString(7));
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
