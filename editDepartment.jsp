<%@ page import="java.sql.*" %>

<%
String department_id = request.getParameter("id");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String department_name = "";
String course_id = "";

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    ps = con.prepareStatement(
        "SELECT * FROM department WHERE department_id=?"
    );

    ps.setString(1, department_id);

    rs = ps.executeQuery();

    if(rs.next())
    {
        department_name = rs.getString("department_name");
        course_id = rs.getString("course_id");
    }

}
catch(Exception e)
{
    out.println(e);
}
%>

<!DOCTYPE html>

<html>

<head>

<title>Edit Department</title>

<style>

body{
font-family:Arial;
background:#eef3f9;
}

.container{

width:500px;
margin:50px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0px 0px 10px gray;

}

h2{

text-align:center;
color:#1e3a8a;
margin-bottom:25px;

}

label{

display:block;
margin-top:15px;
margin-bottom:8px;
font-weight:bold;

}

input,
select{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:6px;

}

button{

margin-top:25px;
background:#2563eb;
color:white;
padding:12px 25px;
border:none;
border-radius:6px;
cursor:pointer;
font-size:16px;

}

button:hover{

background:#1d4ed8;

}

</style>

</head>

<body>

<div class="container">

<h2>Edit Department</h2>

<form action="updateDepartment.jsp" method="post">

<label>Department ID</label>

<input
type="text"
name="department_id"
value="<%=department_id%>"
readonly>

<label>Department Name</label>

<input
type="text"
name="department_name"
value="<%=department_name%>"
required>

<label>Course</label>

<select name="course_id" required>

<option value="">Select Course</option>

<%
Statement stCourse = con.createStatement();

ResultSet rsCourse = stCourse.executeQuery(
"SELECT course_id, course_name FROM course ORDER BY course_name");

while(rsCourse.next())
{
    String cid = rsCourse.getString("course_id");
    String cname = rsCourse.getString("course_name");
%>

<option value="<%=cid%>"
<%=cid.equals(course_id) ? "selected" : ""%>>

<%=cname%>

</option>

<%
}

rsCourse.close();
stCourse.close();
%>

</select>

<center>

<button type="submit">

Update Department

</button>

</center>

</form>

</div>

</body>

</html>

<%
if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(con!=null) con.close();
%>