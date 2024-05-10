<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"
      import="com.company.javaFile.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz Questions</title>
<link rel="stylesheet" type="text/css" href="CSSFolder/quizStyle.css">
<style type="text/css">

</style>
</head>
<body>

<div class="horizontal">
  <a href="Home.jsp" >Home</a>
  <a href="#">About</a>
  <a href="#">Help</a>
  <a href="LoginSerlvet">Sign in</a>
</div>
<h1>Quiz Questions</h1>
<div class="container">
    
        <% 
        List<Question> quizQuestions =(List<Question>)session.getAttribute("quizQuestions");
        if(quizQuestions!= null && !quizQuestions.isEmpty()){
        	for(int i=0; i<quizQuestions.size();i++){
        		Question question=quizQuestions.get(i);
        %>
       
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
              
                <% 
            } else {
        %>
        <p>No questions available.</p>
        <% } %>
    
</div>
</body>
</html>
