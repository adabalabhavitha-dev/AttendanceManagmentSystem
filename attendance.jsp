<%@ page import="java.sql.*" %>

<%
String student_id = request.getParameter("student_id");

String student_name="";
String course_name="";
String department_name="";
String semester="";
String section="";

Connection con=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/projectdb",
"root",
""
);


if(student_id!=null)
{

PreparedStatement ps = con.prepareStatement(
"SELECT s.student_name, c.course_name, d.department_name, " +
"s.semester, s.section " +
"FROM student s " +
"JOIN course c ON s.course_id = c.course_id " +
"JOIN department d ON s.department_id = d.department_id " +
"WHERE s.student_id=?"
);

ps.setString(1,student_id);

ResultSet rs=ps.executeQuery();

if(rs.next())
{
    student_name = rs.getString("student_name");
    course_name = rs.getString("course_name");
    department_name = rs.getString("department_name");
    semester = rs.getString("semester");
    section = rs.getString("section");
}

}


Statement st=con.createStatement();

ResultSet students=st.executeQuery(
"select student_id from student"
);

%>


<!DOCTYPE html>
<html>

<head>

<title>Attendance Management System</title>


<style>

body{
font-family:Arial;
background:#eef2f7;
margin:0;
}


/* TOP HEADER */

.header{

background:#003366;
color:white;
padding:20px 30px;
display:flex;
justify-content:space-between;
align-items:center;

}


.header h2{
margin:0;
}


/* VIEW BUTTON */

.viewBtn{

background:#28a745;
color:white;
padding:10px 15px;
text-decoration:none;
border-radius:5px;

}


/* FORM BOX */

.container{

width:650px;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0px 0px 15px gray;

}


.container h2{

text-align:center;
color:#003366;

}


.row{

display:flex;
gap:20px;

}


.col{

width:50%;

}


label{

font-weight:bold;
display:block;
margin-top:15px;

}


input,select{

width:100%;
padding:10px;
margin-top:5px;
border:1px solid #ccc;
border-radius:5px;

}


button{

margin-top:20px;
padding:12px;
width:100%;
background:#003366;
color:white;
border:none;
border-radius:5px;
font-size:16px;

}


button:hover{

background:#0055aa;

}


/* BACK BUTTON */

.backDashboard{

text-align:center;
margin-top:25px;

}


.backDashboard a{

background:#003366;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:5px;

}


</style>


</head>


<body>


<div class="header">

<h2>Attendance Management System</h2>


<a href="viewAttendance.jsp" class="viewBtn">
View Attendance
</a>


</div>



<div class="container">


<h2>Mark Attendance</h2>



<form method="post" action="attendance.jsp">


<label>Student ID</label>


<select name="student_id" required>


<option value="">
Select Student
</option>


<%

while(students.next())
{

%>


<option value="<%=students.getString("student_id")%>"

<%=student_id!=null && student_id.equals(students.getString("student_id"))?"selected":""%>>

<%=students.getString("student_id")%>

</option>


<%

}

%>


</select>


<button type="submit">
Get Student Details
</button>


</form>




<form action="saveAttendance.jsp" method="post">


<label>Student ID</label>

<input type="text"
name="student_id"
value="<%=student_id==null?"":student_id%>"
readonly>



<div class="row">

<div class="col">

<label>Student Name</label>

<input type="text"
value="<%=student_name%>"
readonly>

</div>


<div class="col">

<label>Course</label>

<input type="text"
value="<%=course_name%>"
readonly>

</div>

</div>



<div class="row">

<div class="col">

<label>Department</label>

<input type="text"
value="<%=department_name%>"
readonly>

</div>


<div class="col">

<label>Semester</label>

<input type="text"
value="<%=semester%>"
readonly>

</div>

</div>



<label>Section</label>

<input type="text"
value="<%=section%>"
readonly>



<label>Attendance Date</label>

<input type="date"
name="attendance_date"
required>



<label>Status</label>

<select name="status">

<option value="Present">
Present
</option>

<option value="Absent">
Absent
</option>

</select>



<button type="submit">
Save Attendance
</button>



</form>



<div class="backDashboard">

<a href="F
acultyDashboard.jsp">
Back to Dashboard
</a>

</div>



</div>


</body>

</html>


<%

con.close();

}

catch(Exception e)
{
out.println(e);
}

%>


