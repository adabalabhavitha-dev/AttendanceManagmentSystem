<%@ page import="java.sql.*" %>

<%
String id=request.getParameter("id");

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

String course_id="";
String course_name="";
String duration="";

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/projectdb",
"root",
""
);

ps=con.prepareStatement("SELECT * FROM course WHERE course_id=?");
ps.setString(1,id);

rs=ps.executeQuery();

if(rs.next()){

course_id=rs.getString("course_id");
course_name=rs.getString("course_name");
duration=rs.getString("duration");

}

}catch(Exception e){

out.println(e);

}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Course</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:#eef5ff;
}

.container{

width:520px;
background:white;
padding:40px;
border-radius:25px;
box-shadow:0 15px 40px rgba(0,0,0,.15);
border-top:8px solid #2563eb;

}

.icon{

width:90px;
height:90px;
margin:auto;
border-radius:50%;
background:linear-gradient(135deg,#2563eb,#7c3aed);
display:flex;
justify-content:center;
align-items:center;
margin-bottom:20px;

}

.icon i{

font-size:40px;
color:white;

}

h2{

text-align:center;
color:#1e3a8a;
margin-bottom:30px;

}

.input-box{

margin-bottom:20px;

}

.input-box label{

display:block;
margin-bottom:8px;
font-weight:bold;
color:#374151;

}

.input-box input{

width:100%;
padding:14px;
border:2px solid #dbeafe;
border-radius:12px;
outline:none;
font-size:15px;

}

.input-box input:focus{

border-color:#2563eb;

}

.btn-group{

display:flex;
gap:15px;

}

.update-btn{

flex:1;
padding:15px;
border:none;
border-radius:50px;
background:linear-gradient(135deg,#10b981,#059669);
color:white;
font-size:17px;
font-weight:bold;
cursor:pointer;
transition:.3s;

}

.update-btn:hover{

transform:translateY(-3px);

}

.reset-btn{

flex:1;
padding:15px;
border:none;
border-radius:50px;
background:linear-gradient(135deg,#f59e0b,#ea580c);
color:white;
font-size:17px;
font-weight:bold;
cursor:pointer;

}

.back{

margin-top:25px;
text-align:center;

}

.back a{

text-decoration:none;
color:#2563eb;
font-weight:bold;

}

</style>

</head>

<body>

<div class="container">

<div class="icon">

<i class="fas fa-pen-to-square"></i>

</div>

<h2>Edit Course</h2>

<form action="updateCourse.jsp" method="post">

<div class="input-box">

<label>

Course ID

</label>

<input
type="text"
name="course_id"
value="<%=course_id%>"
readonly>

</div>

<div class="input-box">

<label>

Course Name

</label>

<input
type="text"
name="course_name"
value="<%=course_name%>"
required>

</div>

<div class="input-box">

<label>

Duration

</label>

<input
type="text"
name="duration"
value="<%=duration%>"
required>

</div>

<div class="btn-group">

<button type="submit" class="update-btn">

<i class="fas fa-pen"></i>

Update

</button>

<button type="reset" class="reset-btn">

<i class="fas fa-rotate-left"></i>

Reset

</button>

</div>

</form>

<div class="back">

<a href="course.jsp">

<i class="fas fa-arrow-left"></i>

Back to Courses

</a>

</div>

</div>

</body>
</html>


