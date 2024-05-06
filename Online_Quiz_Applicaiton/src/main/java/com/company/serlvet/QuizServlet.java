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
import java.util.ArrayList;
import java.util.List;

import com.company.DataBase.DataBaseConnection;

public class QuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			System.out.println("QuizSerlvet....");
			Connection connection =DataBaseConnection.initializeDatabase();
			String sql="SELECT * FROM questiontable";
			PreparedStatement preparedStatement =connection.prepareStatement(sql);
			ResultSet resultSet= preparedStatement.executeQuery();
			List<String> questions = new ArrayList<>();
			List<String> answers=new ArrayList<>();
			while (resultSet.next()) {
				String  question=resultSet.getString("Question");
				String answer=resultSet.getString("Answer");
				questions.add(question);
				answers.add(answer);
			}
			
			   request.getSession().setAttribute("questions", questions);
	            request.getSession().setAttribute("answers", answers);
			
			    resultSet.close();
	            preparedStatement.close();
	            connection.close();
	           
	            response.sendRedirect("Quiz.jsp");
		} catch (Exception e) {
			System.out.println("Error in database...");
			e.printStackTrace();
		}
	}

}
