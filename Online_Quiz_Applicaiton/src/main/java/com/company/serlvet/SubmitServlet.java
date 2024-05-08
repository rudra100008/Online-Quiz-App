package com.company.serlvet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
//import java.util.Iterator;
import java.util.List;

import com.company.DataBase.DataBaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SubmitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("SubmitServlet Started.....");
        int Marks=0;
        String[] selectedOptions = new String[2];
        for(int i = 0; i < 2; i++) {
            String[] options = request.getParameterValues("answer" + i);
            if(options != null && options.length > 0) {
                selectedOptions[i] = options[0]; // Assuming you only expect one value for each parameter
            }
        }
        if (selectedOptions != null) {
            List<String> correctAnswers = getCorrectAnswers(); 
            boolean allCorrect = true;

            for (int i = 0; i <2; i++) {
                if (correctAnswers.contains(selectedOptions[i])) {
                    Marks= Marks+1;
                    System.out.println("Marks:"+Marks);
                    System.out.println("iteration:"+i);
                
                }
                System.out.println("iteration1:"+i);
            }
            HttpSession session=request.getSession();
            session.setAttribute("Marks", Marks);
                response.sendRedirect("result.jsp");
            
        } else {
            response.sendRedirect("Home.jsp"); 
        }
    }

    private List<String> getCorrectAnswers() throws ServletException, IOException {
        List<String> correctAnswers = new ArrayList<>();
        try (Connection connection = DataBaseConnection.initializeDatabase()) {
            String sql = "SELECT Answer FROM questiontable "; 
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                correctAnswers.add(resultSet.getString("Answer"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error retrieving correct answers", e); 
        }
        return correctAnswers;
    }
}