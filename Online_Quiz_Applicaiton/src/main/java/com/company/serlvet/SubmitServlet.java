package com.company.serlvet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.company.DataBase.DataBaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SubmitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("SubmitServlet Started.....");
        String[] selectedOptions = new String[2];
      for(int i=0;i<2;i++) {
         selectedOptions = request.getParameterValues("answer"+i);
      }
        if (selectedOptions != null) {
            List<String> correctAnswers = getCorrectAnswers(); 
            boolean allCorrect = true;

            for (int i = 0; i < selectedOptions.length; i++) {
                if (!correctAnswers.contains(selectedOptions[i])) {
                    allCorrect = false;
                    break;
                }
            }

            // Redirect based on overall result
            if (allCorrect) {
                response.sendRedirect("result.jsp");
            } else {
                response.sendRedirect("Home.jsp");
            }
        } else {
            response.sendRedirect("Home.jsp"); // Redirect if no answers were selected
        }
    }

    private List<String> getCorrectAnswers() throws ServletException, IOException {
        List<String> correctAnswers = new ArrayList<>();
        try (Connection connection = DataBaseConnection.initializeDatabase()) {
            String sql = "SELECT Answer FROM questiontable"; // Assuming a single answer per question
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                correctAnswers.add(resultSet.getString("Answer"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error retrieving correct answers", e); // Handle database errors appropriately
        }
        return correctAnswers;
    }
}