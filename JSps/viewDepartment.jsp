<%@ page import="java.sql.*" %>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    st = con.createStatement();

    rs = st.executeQuery(
        "SELECT d.department_id, d.department_name, c.course_name " +
        "FROM department d " +
        "INNER JOIN course c ON d.course_id = c.course_id " +
        "ORDER BY d.department_id"
    );

}
catch(Exception e)
{
    out.println("<h3>" + e + "</h3>");
}
%>

<!DOCTYPE html>
<html>

<head>

<title>View Departments</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial, sans-serif;
}

body{
background:#eef3f9;
}

.container{
width:90%;
margin:40px auto;
}

h2{
text-align:center;
color:#1e3a8a;
margin-bottom:25px;
}

table{
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0 5px 15px rgba(0,0,0,.15);
}

table th{
background:#1e3a8a;
color:white;
padding:15px;
}

table td{
padding:12px;
text-align:center;
border-bottom:1px solid #ddd;
}

table tr:hover{
background:#f5f5f5;
}

.back-btn{
margin-top:30px;
background:#2563eb;
color:white;
padding:12px 25px;
border:none;
border-radius:6px;
font-size:16px;
cursor:pointer;
}

.back-btn:hover{
background:#1d4ed8;
}

</style>

</head>

<body>

<div class="container">

<h2>Department Details</h2>

<table>

<tr>
<th>Department ID</th>
<th>Department Name</th>
<th>Course Name</th>
</tr>

<%
while(rs.next())
{
%>

<tr>

<td><%=rs.getString("department_id")%></td>

<td><%=rs.getString("department_name")%></td>

<td><%=rs.getString("course_name")%></td>

</tr>

<%
}
%>

</table>

<center>

<a href="FacultyDashboard.jsp">

<button class="back-btn">

&#8592; Back to Admin Dashboard

</button>

</a>

</center>

</div>

</body>

</html>

<%
try
{
    if(rs!=null) rs.close();
    if(st!=null) st.close();
    if(con!=null) con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>