package com.company.serlvet;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.DataBase.DataBaseConnection;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
	}
	
	boolean isValidUser(String username,String password) {
		try {
			Connection connection =DataBaseConnection.initializeDatabase();
			String select ="SELECT * FORM records WHERE username=? AND password=?";
			PreparedStatement preparedStatement=connection.prepareStatement(select);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			ResultSet resultSet=preparedStatement.executeQuery();
			return resultSet.next();
			}catch (Exception e) {
				e.printStackTrace();
				return false;
			}
	}

}
