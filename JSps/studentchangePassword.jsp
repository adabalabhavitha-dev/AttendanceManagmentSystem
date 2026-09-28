
<%@ page import="java.sql.*" %>

<%
String student_id=(String)session.getAttribute("student_id");

if(student_id==null){
    response.sendRedirect("studentLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Change Password</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
}

body{
background:#eef3f9;
}

.container{
width:40%;
margin:60px auto;
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.1);
}

h2{
text-align:center;
color:#1e3a8a;
margin-bottom:25px;
}

label{
display:block;
margin-top:15px;
font-weight:bold;
}

input{
width:100%;
padding:12px;
margin-top:8px;
border:1px solid #ccc;
border-radius:6px;
}

button{
width:100%;
margin-top:25px;
padding:12px;
background:#2563eb;
color:white;
border:none;
border-radius:6px;
font-size:16px;
cursor:pointer;
}

button:hover{
background:#1d4ed8;
}

.back{
display:block;
text-align:center;
margin-top:20px;
text-decoration:none;
color:#1e3a8a;
font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<h2>Change Password</h2>

<form action="updatestudentpassword.jsp" method="post">

<label>Current Password</label>
<input type="password" name="oldPassword" required>

<label>New Password</label>
<input type="password" name="newPassword" required>

<label>Confirm Password</label>
<input type="password" name="confirmPassword" required>

<button type="submit">

Change Password

</button>

</form>

<a href="studentDashboard.jsp" class="back">

Back to Dashboard

</a>

</div>

</body>

</html>