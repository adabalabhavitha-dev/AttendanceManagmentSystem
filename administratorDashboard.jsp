<%@ page language="java" %>

<%
String adminName = (String)session.getAttribute("administrator_name");

if(adminName==null)
{
    response.sendRedirect("administratorLogin.html");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Administrator Dashboard</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    background:#f4f6f9;
}

.header{
    background:#003366;
    color:white;
    padding:20px;
    text-align:center;
}

.header h1{
    margin-bottom:8px;
}

.container{
    width:90%;
    margin:40px auto;
}

.cards{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:30px;
}

.card{
    background:white;
    border-radius:15px;
    padding:35px;
    text-align:center;
    box-shadow:0 5px 15px rgba(0,0,0,0.15);
    transition:.3s;
}

.card:hover{
    transform:translateY(-8px);
}

.card i{
    font-size:60px;
    color:#003366;
    margin-bottom:20px;
}

.card h2{
    color:#003366;
    margin-bottom:10px;
}

.card p{
    color:#666;
    margin-bottom:25px;
}

.btn{
    text-decoration:none;
    background:#003366;
    color:white;
    padding:12px 30px;
    border-radius:30px;
    font-weight:bold;
}

.btn:hover{
    background:#0055aa;
}

.logout{
    text-align:center;
    margin-top:40px;
}

.logout a{
    text-decoration:none;
    background:#d9534f;
    color:white;
    padding:12px 35px;
    border-radius:30px;
    font-weight:bold;
}

.logout a:hover{
    background:#c9302c;
}

</style>

</head>

<body>

<div class="header">

<h1>Administrator Dashboard</h1>

<h3>Welcome, <%= adminName %></h3>

</div>

<div class="container">

<div class="cards">

<div class="card">

<i class="fas fa-book"></i>

<h2>Regulations</h2>

<p>Add, Update and Delete Regulations.</p>

<a href="regulation.jsp" class="btn">Open</a>

</div>

<div class="card">

<i class="fas fa-graduation-cap"></i>

<h2>Courses</h2>

<p>Add, Update and Delete Courses.</p>

<a href="course.jsp" class="btn">Open</a>

</div>

<div class="card">

<i class="fas fa-building"></i>

<h2>Departments</h2>

<p>Add, Update and Delete Departments.</p>

<a href="department.jsp" class="btn">Open</a>

</div>

<div class="card">

<i class="fas fa-users"></i>

<h2>Faculty</h2>

<p>Add, Update and Delete Faculty.</p>

<a href="faculty.jsp" class="btn">Open</a>
</div>
<div class="card">
<div>
    <i class="fas fa-tasks"></i>
    </div>

    <h2>Assigned Faculty</h2>

    <p>
        Assign Sections, Semesters and Subjects to Faculty Members.
    </p>

    <a href="facultyAssignment.jsp" class="btn">
        Open
    </a>
    

</div>

</div>

<div class="logout">

<a href="logout.jsp">
<i class="fas fa-sign-out-alt"></i> Logout
</a>

</div>

</div>

</body>
</html>

