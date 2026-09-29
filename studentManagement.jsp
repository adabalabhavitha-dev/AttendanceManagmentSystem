<%@page import="java.sql.*"%>

<%
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/projectdb",
"root",
"");

Statement st=con.createStatement();

ResultSet rs = st.executeQuery(

"SELECT s.student_id, s.student_name, s.gender, s.dob, " +
"s.mobile, s.email, s.address, " +
"r.regulation_name, " +
"c.course_name, " +
"d.department_name, " +
"s.semester, s.section " +
"FROM student s " +
"INNER JOIN regulation r ON s.regulation_id = r.regulation_id " +
"INNER JOIN course c ON s.course_id = c.course_id " +
"INNER JOIN department d ON s.department_id = d.department_id"

);
%>

<!DOCTYPE html>

<html>

<head>

<title>Student Management</title>

<style>

table{

width:100%;
border-collapse:collapse;

}

th{

background:blue;
color:white;
padding:12px;

}

td{

padding:12px;
text-align:center;
border:1px solid #ddd;

}

.edit{

background:green;
color:white;
padding:8px 15px;
text-decoration:none;
border-radius:5px;

}

.delete{

background:red;
color:white;
padding:8px 15px;
text-decoration:none;
border-radius:5px;

}

.add{

background:#1e3a8a;
color:white;
padding:12px 25px;
text-decoration:none;
float:right;
margin-bottom:20px;

}

</style>

</head>

<body>

<h2>Student Details</h2>


<table>

<tr>

<th> student ID</th>

<th>Name</th>

<th>Gender</th>
<th>date of birth</th>
<th>Mobile</th>
<th>Email</th>
<th>Address</th>
<th>Regulation</th>
<th>Course</th>
<th>Department</th>

<th>Semester</th>
<th>section</th>

<th>Edit</th>

<th>Delete</th>

</tr>

<%

while(rs.next())
{

%>

<tr>

<td><%=rs.getString("student_id")%></td>

<td><%=rs.getString("student_name")%></td>

<td><%=rs.getString("gender")%></td>
<td><%=rs.getString("dob")%></td>
<td><%=rs.getString("mobile")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("address")%></td>
<td><%=rs.getString("regulation_name")%></td>
<td><%=rs.getString("course_name")%></td>
<td><%=rs.getString("department_name")%></td>
<td><%=rs.getString("semester")%></td>
<td><%=rs.getString("section")%></td>


<td>

<a class="edit"

href="editStudent.jsp?id=<%=rs.getString("student_id")%>">

Edit

</a>

</td>

<td>

<a class="delete"

onclick="return confirm('Delete Student?')"

href="deleteStudent.jsp?id=<%=rs.getString("student_id")%>">

Delete

</a>

</td>

</tr>

<%

}

%>

</table>

</body>

</html>