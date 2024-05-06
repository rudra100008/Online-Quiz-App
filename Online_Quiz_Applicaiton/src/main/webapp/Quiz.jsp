<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz Questions</title>
</head>
<body>
<h1>Quiz Questions</h1>
    <ol>
        <% 
            List<String> questions = (List<String>)session.getAttribute("questions");
            List<String> answers = (List<String>)session.getAttribute("answers");
            if (questions != null && answers != null && questions.size() == answers.size()) {
                for (int i = 0; i < questions.size(); i++) {
        %>
        <li>
            <strong>Question <%= i+1 %>:</strong> <%= questions.get(i) %><br>
            <strong>Answer:</strong> <%= answers.get(i) %>
        </li>
        <% 
                }
            } else {
        %>
        <li>No questions available.</li>
        <% } %>
    </ol>
</body>
</html>