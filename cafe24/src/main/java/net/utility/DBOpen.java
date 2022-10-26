package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	public Connection getConnection() {
		Connection con = null;
		try {
			String url      = "jdbc:mysql://localhost/cloudd81";
		    String user     = "cloudd81";
		    String password = "kimk0724!";
		    String driver   = "org.gjt.mm.mysql.Driver"; 
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println("마리아DB연결실패 :" + e);
		} // end
		return con;
	} // getConnection() end
} // class end
