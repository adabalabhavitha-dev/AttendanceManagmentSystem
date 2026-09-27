<%@ page import="java.sql.*" %>

<%
String currentSemester = request.getParameter("semester");
String currentSection = request.getParameter("section");
String currentSubject = request.getParameter("subject");

Connection con = null;
Statement st = null;
ResultSet reg = null;
ResultSet course = null;
ResultSet dept = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    st = con.createStatement();

    reg = st.executeQuery("SELECT * FROM regulation");

}catch(Exception e){
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Add Student</title>

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
padding:20px;
font-size:28px;
font-weight:bold;
text-align:center;
}

.container{
width:85%;
margin:30px auto;
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.15);
}

h2{
text-align:center;
color:#1e3a8a;
margin-bottom:25px;
}

.row{
display:flex;
gap:20px;
margin-bottom:20px;
}

.col{
flex:1;
}

label{
display:block;
font-weight:bold;
margin-bottom:8px;
color:#333;
}

input,
select,
textarea{
width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;
outline:none;
}

input:focus,
select:focus,
textarea:focus{
border:1px solid #2563eb;
}

textarea{
height:90px;
resize:none;
}

.btn{
background:#2563eb;
color:white;
border:none;
padding:12px 25px;
border-radius:8px;
font-size:16px;
cursor:pointer;
}

.btn:hover{
background:#1d4ed8;
}

.back{
background:#dc3545;
color:white;
padding:12px 25px;
border-radius:8px;
text-decoration:none;
margin-left:10px;
}

</style>

</head>

<body>

<div class="header">
Attendance Management System
</div>

<div class="container">

<h2>Add Student</h2>

<form action="saveStudent.jsp" method="post">

<input type="hidden" name="currentSemester" value="<%=currentSemester%>">
<input type="hidden" name="currentSection" value="<%=currentSection%>">
<input type="hidden" name="currentSubject" value="<%=currentSubject%>">

<div class="row">

<div class="col">

<label>Student ID</label>

<input type="text"
name="student_id"
required>

</div>

<div class="col">

<label>Student Name</label>

<input type="text"
name="student_name"
required>

</div>

</div>

<div class="row">

<div class="col">

<label>Gender</label>

<select name="gender" required>

<option value="">Select Gender</option>

<option value="Male">Male</option>

<option value="Female">Female</option>

</select>

</div>

<div class="col">

<label>Date of Birth</label>

<input type="date"
name="dob"
required>

</div>

</div>

<div class="row">

<div class="col">

<label>Mobile</label>

<input type="text"
name="mobile"
maxlength="10"
required>

</div>

<div class="col">

<label>Email</label>

<input type="email"
name="mail"
required>

</div>

</div>

<label>Address</label>

<textarea
name="address"
required></textarea>

<br><br>

<div class="row">

<div class="col">

<label>Regulation</label>

<select name="regulation_id" required>

<option value="">Select Regulation</option>

<%
while(reg.next()){
%>

<option value="<%=reg.getString("regulation_id")%>">
<%=reg.getString("regulation_name")%>
</option>

<%
}
%>

</select>

</div>
<div class="col">

<label>Course</label>

<select name="course_id" required>

<option value="">Select Course</option>

<%
course = st.executeQuery("SELECT * FROM course");

while(course.next()){
%>

<option value="<%=course.getString("course_id")%>">
<%=course.getString("course_name")%>
</option>

<%
}
%>

</select>

</div>

</div>

<div class="row">

<div class="col">

<label>Department</label>

<select name="department_id" required>

<option value="">Select Department</option>

<%
department = st.executeQuery("SELECT * FROM department");

while(department.next()){
%>

<option value="<%=department.getString("department_id")%>">
<%=department.getString("department_name")%>
</option>

<%
}
%>

</select>

</div>

<div class="col">

<label>Semester</label>

<select name="semester" required>

<option value="1-1" <%= "1-1".equals(currentSemester)?"selected":"" %>>1-1</option>
<option value="1-2" <%= "1-2".equals(currentSemester)?"selected":"" %>>1-2</option>
<option value="2-1" <%= "2-1".equals(currentSemester)?"selected":"" %>>2-1</option>
<option value="2-2" <%= "2-2".equals(currentSemester)?"selected":"" %>>2-2</option>
<option value="3-1" <%= "3-1".equals(currentSemester)?"selected":"" %>>3-1</option>
<option value="3-2" <%= "3-2".equals(currentSemester)?"selected":"" %>>3-2</option>
<option value="4-1" <%= "4-1".equals(currentSemester)?"selected":"" %>>4-1</option>
<option value="4-2" <%= "4-2".equals(currentSemester)?"selected":"" %>>4-2</option>

</select>

</div>

</div>

<div class="row">

<div class="col">

<label>Section</label>

<input
type="text"
name="section"
value="<%=currentSection%>"
required>

</div>

<div class="col">

<label>Password</label>

<input
type="text"
name="password"
required>

</div>

</div>

<br>

<center>

<button type="submit" class="btn">
Save Student
</button>

<a href="studentList.jsp?semester=<%=currentSemester%>&section=<%=currentSection%>&subject=<%=currentSubject%>" class="back">
Back
</a>

</center>

</form>

</div>

</body>

</html>

<%
if(reg!=null) reg.close();
if(course!=null) course.close();
if(dept!=null) dept.close();
if(st!=null) st.close();
if(con!=null) con.close();
%>