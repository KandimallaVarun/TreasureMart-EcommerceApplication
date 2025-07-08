package com.ecommerce.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// step1
			// Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.cj.jdbc.Driver");

			// step2;
			String uname = "root";
			String password = ""; // to run project on local
//			String password = "1234#5";

			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/fullstack_ecommerce?autoReconnect=true&useSSL=false", uname, password);

		} catch (Exception e) {
			conn = null;
		}

		return conn;
	}

}
