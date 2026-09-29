<%@ page import="java.sql.*" %>

<%
String facultyId=request.getParameter("facultyId");
String semester=request.getParameter("semester");
String section=request.getParameter("section");

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/projectdb",
    "root",
    "");

    ps=con.prepareStatement(
    "SELECT GROUP_CONCAT(Subject ORDER BY Subject SEPARATOR ', ') AS Subjects FROM faculty_section WHERE Faculty_id=? AND Semester=? AND Section=?");

    ps.setString(1,facultyId);
    ps.setString(2,semester);
    ps.setString(3,section);

    rs=ps.executeQuery();

    String subjects="";

    if(rs.next())
    {
        subjects=rs.getString("Subjects");

        if(subjects==null)
        {
            subjects="";
        }
    }
%>

<!DOCTYPE html>

<html>

<head>

<title>Edit Faculty Assignment</title>

<style>

body{
font-family:Arial;
background:#eef3f9;
}

.container{
width:500px;
margin:40px auto;
background:#fff;
padding:30px;
border-radius:10px;
box-shadow:0 5px 15px rgba(0,0,0,.2);
}

h2{
text-align:center;
color:#1e3a8a;
margin-bottom:20px;
}

label{
display:block;
margin-top:15px;
font-weight:bold;
}

input{
width:100%;
padding:12px;
margin-top:8px;
border:1px solid #ccc;
border-radius:6px;
}

button{
width:100%;
padding:12px;
margin-top:20px;
background:#1e3a8a;
color:white;
border:none;
border-radius:6px;
cursor:pointer;
}

button:hover{
background:#163172;
}

.back{
text-decoration:none;
    background:#d9534f;
    color:white;
    padding:12px 35px;
    border-radius:30px;
    font-weight:bold;
}
.back a:hover{
    background:#c9302c;
}

</style>

</head>

<body>

<div class="container">

<h2>Edit Faculty Assignment</h2>

<form action="updateFacultyAssignment.jsp" method="post">

<input type="hidden" name="facultyId" value="<%=facultyId%>">

<input type="hidden" name="oldSemester" value="<%=semester%>">

<input type="hidden" name="oldSection" value="<%=section%>">

<label>Semester</label>

<input type="text" name="semester"
value="<%=semester%>" required>

<label>Section</label>

<input type="text" name="section"
value="<%=section%>" required>

<label>Subjects (Comma Separated)</label>

<input type="text"
name="subjects"
value="<%=subjects%>"
required>

<button type="submit">

Update

</button>

</form>
<br></br>
<a href="facultyAssignment.jsp" class="back">

Back

</a>

</div>

</body>

</html>

<%
}
catch(Exception e)
{
out.println("Error : "+e.getMessage());
}
finally
{
if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(con!=null) con.close();
}
%>