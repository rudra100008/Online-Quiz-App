<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"
      import="com.company.javaFile.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz Questions</title>
<link rel="stylesheet" href="Style.css">
</head>
<body>
<h1>Quiz Questions</h1>
<div class="container">
    <ol>
        <% 
        List<Question> quizQuestions =(List<Question>)session.getAttribute("quizQuestions");
        if(quizQuestions!= null && !quizQuestions.isEmpty()){
        	for(int i=0; i<quizQuestions.size();i++){
        		Question question=quizQuestions.get(i);
        %>
        <li>
            <form action="SubmitServlet" method="post">
                <strong>Question <%= i+1 %>:</strong> <%= question.getQuestionText() %><br>
                <input type="radio" name="answer<%=i%>" value="<%= question.getOptionA() %>">
                <label for="option1"><%=question.getOptionA()%></label><br>
                
                <input type="radio" name="answer<%=i%>" value="<%= question.getOptionB() %>">
                <label for="option2"><%=question.getOptionB()%></label><br>
                
                <input type="radio" name="answer<%=i%>" value="<%=question.getOptionC()%>">
                <label for="option3"><%=question.getOptionC()%></label><br>
                
                <input type="radio" name="answer<%=i%>" value="<%=question.getOptionD()%>"> 
                <label for="option4"><%=question.getOptionD()%></label><br>
                <br>
               
      
        <%   }%>
                  <button type="submit">Submit your answer</button>
            </form>
              </li>
                <% 
            } else {
        %>
        <li>No questions available.</li>
        <% } %>
    </ol>
</div>
</body>
</html>
