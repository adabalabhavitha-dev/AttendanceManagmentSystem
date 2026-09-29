
<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<%
String studentId=(String)session.getAttribute("student_id");
String studentName=(String)session.getAttribute("student_name");

if(studentId==null){
    response.sendRedirect("studentLogin.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Student Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

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

.header{
background:#1e3a8a;
color:white;
padding:20px 40px;
display:flex;
justify-content:space-between;
align-items:center;
}

.header h2{
font-size:28px;
}

.logout{
background:red;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:6px;
}

.logout:hover{
background:#c40000;
}

.container{
width:90%;
margin:40px auto;
}

.welcome{
background:white;
padding:25px;
border-radius:10px;
box-shadow:0 5px 15px rgba(0,0,0,.1);
margin-bottom:30px;
}

.welcome h2{
color:#1e3a8a;
}

.cards{
display:flex;
gap:30px;
justify-content:center;
flex-wrap:wrap;
}

.card{
width:260px;
background:white;
padding:30px;
text-align:center;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.1);
transition:.3s;
}

.card:hover{
transform:translateY(-8px);
}

.card i{
font-size:45px;
color:#2563eb;
margin-bottom:20px;
}

.card h3{
margin-bottom:15px;
color:#1e3a8a;
}

.card a{
display:inline-block;
margin-top:15px;
background:#2563eb;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:6px;
}

.card a:hover{
background:#1d4ed8;
}

</style>

</head>

<body>

<div class="header">

<h2>Student Dashboard</h2>

<a href="logoutStudent.jsp" class="logout">
<i class="fa fa-sign-out-alt"></i> Logout
</a>

</div>

<div class="container">

<div class="welcome">

<h2>Welcome <%=studentName%></h2>

<p><b>Student ID :</b> <%=studentId%></p>

</div>

<div class="cards">

<div class="card">

<i class="fa fa-user"></i>

<h3>My Profile</h3>

<a href="studentProfile.jsp">

Open

</a>

</div>

<div class="card">

<i class="fa fa-calendar-check"></i>

<h3>My Attendance</h3>

<a href="viewAttendance1.jsp">

Open

</a>

</div>

<div class="card">

<i class="fa fa-key"></i>

<h3>Change Password</h3>

<a href="studentchangePassword.jsp">

Open

</a>

</div>

</div>

</div>

</body>
</html>