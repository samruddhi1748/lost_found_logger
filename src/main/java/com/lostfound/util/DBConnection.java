package com.lostfound.util;
import java.sql.*;

public class DBConnection {
private static Connection con=null;
public static Connection getConnection() {
	if(con==null) {
		try {
			Class.forName("org.postgresql.Driver");
			con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/lostfounddb","postgres","System");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	return con;
}

}
