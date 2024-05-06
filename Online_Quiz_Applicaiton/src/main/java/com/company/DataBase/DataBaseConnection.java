package com.company.DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {
	public static Connection initializeDatabase()throws SQLException,ClassNotFoundException {
		String url="jdbc:mysql://localhost:3306/Quiz";
		String username="root";
		String password="";
		System.out.println("Connectiong with driver");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection =DriverManager.getConnection(url,username,password);
		System.out.println("Database Started....");
		return connection;
	}

}
