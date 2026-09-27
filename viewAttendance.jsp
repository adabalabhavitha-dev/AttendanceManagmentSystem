<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>

<title>View Attendance</title>

<style>

body{
    font-family:Arial;
    background:#eef2f7;
}

.header{

width:100%;
    background:#003366;
    color:white;
    padding:20px 30px;
    text-align:center;
}

.header h2{
    color:white;
    margin:0;

}


.container{
    width:95%;
    margin:40px auto;
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0px 0px 15px gray;
}


h2{
    text-align:center;
    color:#003366;
    margin-bottom:25px;
}


table{
    width:100%;
    border-collapse:collapse;
}


th{
    background:#003366;
    color:white;
    padding:12px;
}


td{
    padding:10px;
    text-align:center;
    border:1px solid #ddd;
}


.edit{
    background:#28a745;
    color:white;
    padding:6px 12px;
    text-decoration:none;
    border-radius:5px;
}


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

</div>


<div class="container">


<h2>Attendance Details</h2>


<table>

<tr>

<th>Attendance ID</th>
<th>Student ID</th>
<th>Student Name</th>
<th>Course</th>
<th>Department</th>
<th>Semester</th>
<th>Section</th>
<th>Date</th>
<th>Status</th>
<th>Edit</th>

</tr>


<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");


Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/projectdb",
"root",
""
);



String sql =
"SELECT a.attendance_id, " +
"a.student_id, " +
"s.student_name, " +
"c.course_name, " +
"d.department_name, " +
"s.semester, " +
"s.section, " +
"a.attendance_date, " +
"a.status " +
"FROM attendance a " +
"INNER JOIN student s ON a.student_id = s.student_id " +
"INNER JOIN course c ON s.course_id = c.course_id " +
"INNER JOIN department d ON s.department_id = d.department_id";


Statement st = con.createStatement();

ResultSet rs = st.executeQuery(sql);



while(rs.next())
{

%>


<tr>

<td><%=rs.getInt("attendance_id")%></td>

<td><%=rs.getString("student_id")%></td>

<td><%=rs.getString("student_name")%></td>

<td><%=rs.getString("course_name")%></td>

<td><%=rs.getString("department_name")%></td>

<td><%=rs.getString("semester")%></td>

<td><%=rs.getString("section")%></td>

<td><%=rs.getString("attendance_date")%></td>

<td><%=rs.getString("status")%></td>


<td>

<a class="edit"
href="editAttendance.jsp?id=<%=rs.getInt("attendance_id")%>">
Edit
</a>

</td>

</tr>


<%

}


con.close();


}

catch(Exception e)
{
out.println(e);
}

%>


</table>



<div class="backDashboard">

<a href="attendance.jsp">
Back to Mark Attendance
</a>

</div>


</div>


</body>
</html>
