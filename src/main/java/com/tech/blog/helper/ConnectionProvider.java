package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

	private static Connection conn;

	public static Connection getConnection() {
		try {

			if (conn == null) {
				// driver class load
				Class.forName("com.mysql.cj.jdbc.Driver");

				// create a connection...
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "187827187");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return conn;

	}
}
