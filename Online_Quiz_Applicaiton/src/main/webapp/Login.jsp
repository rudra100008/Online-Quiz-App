<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style>
form{
     border:3px solid #f1f1f1;
}
input[type=text],input[type=password]{
 width:100%;
 margin:8px 0px;
 padding:12px 20px;
 display:inline-block;
 border:1px solid #ccc;
 box-sizing: border-box;
}
button{
   width:100%;
   margin:8px 0px;
   padding:14px 20px;
   background-color:#04AA6D;
   border:none;
   color:white;
   cursor:pointer;
   
}
button:hover {
  opacity: 0.8;
}
.cancel{
 width:auto;
 padding:10px 16px;
 background-color:#f44336
}
.imagecontainer{
 margin:24px 0 12px 0;
 text-align:center;
}

img.image{

  width:40%;
  border-radius:50%;
}
.container{
  padding:16px;
}
span.psw{
   float:right;
   padding-top:16px;
}

@media screen and (max-width:300px){
span.psw {
    display: block;
    float: none;
  }
  .cancel {
    width: 100%;
  }
}

.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancel{
     width: 100%;
  }
}

</style>
</head>
<body>
<h1>Login</h1>
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
<div id="id01" class="modal">
  <form class="modal-content animate"  method=post action=LoginServlet>
    <div class=imagecontainer>
      <img src="login page.jpg" alt="image" class="image">
    </div>
    <div class=container>
     <label for=name><b>UserName</b></label>
    <input type="text" name="username" id="username" placeholder="Enter username">
    <label for=name><b>Password</b></label>
    <input type=password name="password " placeholder="Enter password">
    <button type="submit" >Login</button>
    <label>
    <input type=checkbox name="remember" checked=checked>Remember me
    </label>
    </div>
    
    
     <div class="container" style="background-color:#f1f1f1">
     <button  class="cancel" type="button"  >Cancel</button>
     <span class="psw"><a href="register.jsp">Register?</a></span>
      </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>


</body>
</html>