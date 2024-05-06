<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Quiz Game</title>
<link rel="stylesheet" type="text/css" href="indexStyle.css">
</head>
<body>
<div class="horizontal-menu">
  <a href="#" class="active">Home</a>
  <a href="#">About</a>
  <a href="#">Help</a>
  <a href="LoginSerlvet">Sign in</a>
</div>


<div class="container">
      <h1>Start Your Quiz</h1>
    <form method="post" action="QuizServlet">
       <button type="submit" >Start</button>

   </form>
  </div>

</body>
</html>