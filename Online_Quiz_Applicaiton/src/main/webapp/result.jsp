<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
<link rel="stylesheet" type=text/css href=CSSFolder/resultStyle.css> 
</head>
<body>
<% HttpSession session1=request.getSession();
int marks=(int)session.getAttribute("Marks");
%>
<h1>Your all answer are correct.</h1>
<h2>Your marks is <%= marks %></h2>
</body>
</html>