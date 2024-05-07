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
import com.company.javaFile.Question;

public class QuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			System.out.println("QuizSerlvet....");
			Connection connection =DataBaseConnection.initializeDatabase();
			String sql="SELECT * FROM questiontable";
			PreparedStatement preparedStatement =connection.prepareStatement(sql);
			ResultSet resultSet= preparedStatement.executeQuery();
			List<Question> quizQuestions= new ArrayList<>();
			
			while (resultSet.next()) {
				Question question = new Question();
				question.setQuestionText(resultSet.getString("Question"));
				question.setOptionA(resultSet.getString("Option1"));
				question.setOptionB(resultSet.getString("Option2"));
				question.setOptionC(resultSet.getString("Option3"));
				question.setOptionD(resultSet.getString("Option4"));
				quizQuestions.add(question);
			}
		        request.getSession().setAttribute("quizQuestions",quizQuestions);
		        response.sendRedirect("Quiz.jsp");
			    resultSet.close();
	            preparedStatement.close();
	            connection.close();
	           
	            
		} catch (Exception e) {
			System.out.println("Error in database...");
			e.printStackTrace();
		}
	}

}
