<%@ page import="java.sql.*" %>

<%
String student_id=(String)session.getAttribute("student_id");

if(student_id==null){
    response.sendRedirect("studentDashboard.jsp");
    return;
}

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

String student_name="";
String gender="";
String dob="";
String mobile="";
String email="";
String address="";
String regulation_id="";
String course_id="";
String department_id="";
String semester="";
String section="";

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/projectdb",
"root",
"");

ps = con.prepareStatement(
"SELECT s.*, d.department_name, c.course_name, r.regulation_name " +
"FROM student s " +
"INNER JOIN department d ON s.department_id = d.department_id " +
"INNER JOIN course c ON s.course_id = c.course_id " +
"INNER JOIN regulation r ON s.regulation_id = r.regulation_id " +
"WHERE s.student_id=?");ps.setString(1,student_id);

rs=ps.executeQuery();

if(rs.next()){

student_name=rs.getString("student_name");
gender=rs.getString("gender");
dob=rs.getString("dob");
mobile=rs.getString("mobile");
email=rs.getString("email");
address=rs.getString("address");
regulation_id=rs.getString("regulation_id");
course_id=rs.getString("course_name");
department_id=rs.getString("department_name");
semester=rs.getString("semester");
section=rs.getString("section");

}

}catch(Exception e){
out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Student Profile</title>

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
width:60%;
margin:40px auto;
background:#fff;
padding:30px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.1);
}

h2{
text-align:center;
color:#1e3a8a;
margin-bottom:25px;
}

table{
width:100%;
border-collapse:collapse;
}

td{
padding:14px;
border-bottom:1px solid #ddd;
}

td:first-child{
font-weight:bold;
color:#1e3a8a;
width:35%;
}

.back{
display:inline-block;
margin-top:25px;
background:#2563eb;
color:white;
padding:12px 20px;
text-decoration:none;
border-radius:8px;
}

.back:hover{
background:#1d4ed8;
}

</style>

</head>

<body>

<div class="container">

<h2>Student Profile</h2>

<table>

<tr>
<td>Student ID</td>
<td><%=student_id%></td>
</tr>

<tr>
<td>Student Name</td>
<td><%=student_name%></td>
</tr>

<tr>
<td>Gender</td>
<td><%=gender%></td>
</tr>

<tr>
<td>Date of Birth</td>
<td><%=dob%></td>
</tr>

<tr>
<td>Mobile</td>
<td><%=mobile%></td>
</tr>

<tr>
<td>Email</td>
<td><%=email%></td>
</tr>

<tr>
<td>Address</td>
<td><%=address%></td>
</tr>

<tr>
<td>Regulation</td>
<td><%=regulation_id%></td>
</tr>

<tr>
<td>Course</td>
<td><%=course_id%></td>
</tr>

<tr>
<td>Department</td>
<td><%=department_id%></td>
</tr>

<tr>
<td>Semester</td>
<td><%=semester%></td>
</tr>

<tr>
<td>Section</td>
<td><%=section%></td>
</tr>

</table>

<center>

<a href="studentDashboard.jsp" class="back">

Back to Dashboard

</a>

</center>

</div>

</body>
</html>

<%
if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(con!=null) con.close();
%>