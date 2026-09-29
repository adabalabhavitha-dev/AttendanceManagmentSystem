<%@ page import="java.sql.*" %>

<%
Connection con=null;
Statement st=null;
PreparedStatement ps=null;
ResultSet rs=null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con=DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    // INSERT NEW DEPARTMENT

    if(request.getParameter("save")!=null)
    {
        String department_id=request.getParameter("department_id");
        String department_name=request.getParameter("department_name");
        String course_id=request.getParameter("course_id");

        ps=con.prepareStatement(
        "INSERT INTO department(department_id,department_name,course_id) VALUES(?,?,?)");

        ps.setString(1,department_id);
        ps.setString(2,department_name);
        ps.setString(3,course_id);

        ps.executeUpdate();
%>

<script>

alert("Department Added Successfully");

window.location="department.jsp";

</script>

<%
    }
%>

<!DOCTYPE html>

<html>

<head>

<title>Department Management</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI;
}

body{
background:#eef3f9;
}

.container{

width:95%;
margin:30px auto;

}

h1{

color:#1e3a8a;
margin-bottom:25px;

}

.form-box{

background:white;
padding:25px;
border-radius:12px;
box-shadow:0px 5px 12px rgba(0,0,0,.15);

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
margin-bottom:8px;
font-weight:bold;

}

input,select{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;

}

button{

background:#2563eb;
color:white;
padding:12px 25px;
border:none;
border-radius:8px;
cursor:pointer;
font-size:15px;

}

button:hover{

background:#1d4ed8;

}

table{

margin-top:35px;
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0px 5px 12px rgba(0,0,0,.15);

}

table th{

background:#1e3a8a;
color:white;
padding:15px;

}

table td{

padding:14px;
text-align:center;
border-bottom:1px solid #ddd;

}

.edit{

background:#0ea5e9;
color:white;
padding:8px 16px;
text-decoration:none;
border-radius:5px;

}

.delete{

background:#ef4444;
color:white;
padding:8px 16px;
text-decoration:none;
border-radius:5px;

}

</style>

</head>

<body>

<div class="container">

<h1>

<i class="fas fa-building"></i>

Department Management

</h1>

<div class="form-box">

<form method="post">

<div class="row">

<div class="col">

<label>Department ID</label>

<input type="text"
name="department_id"
required>

</div>

<div class="col">

<label>Department Name</label>

<input type="text"
name="department_name"
required>

</div>

<div class="col">

<label>Course</label>

<select name="course_id" required>

<option value="">Select Course</option>

<%
Statement stCourse = con.createStatement();

ResultSet rsCourse = stCourse.executeQuery(
"SELECT course_id, course_name FROM course ORDER BY course_name");

while(rsCourse.next())
{
%>

<option value="<%=rsCourse.getString("course_id")%>">

<%=rsCourse.getString("course_name")%>

</option>

<%
}

rsCourse.close();
stCourse.close();
%>

</select>

</div>

</div>

<button type="submit" name="save">

<i class="fas fa-save"></i>

Save Department

</button>

</form>

</div>

<table>

<tr>

<th>Department ID</th>

<th>Department Name</th>

<th>Course Name</th>

<th>Edit</th>

<th>Delete</th>

</tr>

<%

st=con.createStatement();

rs = st.executeQuery(

"SELECT d.department_id,d.department_name,c.course_name " +

"FROM department d " +

"INNER JOIN course c " +

"ON d.course_id=c.course_id " +

"ORDER BY d.department_id"

);

while(rs.next())
{

%>

<tr>

<td><%=rs.getString("department_id")%></td>

<td><%=rs.getString("department_name")%></td>

<td><%=rs.getString("course_name")%></td>

<td>

<a class="edit"

href="editDepartment.jsp?id=<%=rs.getString("department_id")%>">

Edit

</a>

</td>

<td>

<a class="delete"

href="deleteDepartment.jsp?id=<%=rs.getString("department_id")%>"

onclick="return confirm('Delete this Department?')">

Delete

</a>

</td>

</tr>

<%

}

%>

</table>
</table>

<br><br>

<center>

<a href="administratorDashboard.jsp">

<button type="button" style="
background:#16a34a;
color:white;
padding:12px 25px;
border:none;
border-radius:8px;
font-size:16px;
cursor:pointer;">

<i class="fas fa-arrow-left"></i>

Back to Dashboard

</button>

</a>

</center>

</div>

</body>

</html>



<%

}
catch(Exception e)
{
out.println(e);
}
finally
{
if(rs!=null) rs.close();
if(st!=null) st.close();
if(ps!=null) ps.close();
if(con!=null) con.close();
}
%>