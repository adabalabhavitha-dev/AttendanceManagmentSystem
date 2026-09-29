<%@ page import="java.sql.*" %>

<%
Connection con=null;
PreparedStatement psFaculty=null;
PreparedStatement psTable=null;
ResultSet rsFaculty=null;
ResultSet rsTable=null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/projectdb",
    "root",
    "");

    psFaculty=con.prepareStatement(
    "SELECT Faculty_id,Faculty_name FROM faculty ORDER BY Faculty_name");

    rsFaculty=psFaculty.executeQuery();

    psTable=con.prepareStatement(
    "SELECT MIN(fs.Assignment_id) AS Assignment_id,"+
    "fs.Faculty_id,"+
    "f.Faculty_name,"+
    "fs.Semester,"+
    "fs.Section,"+
    "GROUP_CONCAT(fs.Subject ORDER BY fs.Subject SEPARATOR ', ') AS Subjects "+
    "FROM faculty_section fs "+
    "INNER JOIN faculty f ON fs.Faculty_id=f.Faculty_id "+
    "GROUP BY fs.Faculty_id,fs.Semester,fs.Section "+
    "ORDER BY f.Faculty_name");

    rsTable=psTable.executeQuery();
%>

<!DOCTYPE html>

<html>

<head>

<title>Assigned Faculty</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

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
width:90%;
margin:30px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.15);
}

h1{
text-align:center;
color:#1e3a8a;
margin-bottom:30px;
}

form{
display:grid;
grid-template-columns:repeat(2,1fr);
gap:20px;
margin-bottom:30px;
}

select,
input{
padding:12px;
font-size:16px;
border:1px solid #ccc;
border-radius:6px;
}

button{
padding:12px;
background:#1e3a8a;
color:white;
border:none;
border-radius:6px;
cursor:pointer;
font-size:16px;
}

button:hover{
background:#163172;
}

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
}

th{
background:#1e3a8a;
color:white;
padding:12px;
}

td{
padding:12px;
text-align:center;
border:1px solid #ddd;
}

.edit{
background:#28a745;
color:white;
padding:8px 16px;
text-decoration:none;
border-radius:5px;
margin-right:10px;
}

.delete{
background:red;
color:white;
padding:8px 16px;
text-decoration:none;
border-radius:5px;
}

.back{
display:inline-block;
margin-top:20px;
background:#555;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:6px;
}

</style>

</head>

<body>

<div class="container">

<h1>
<i class="fas fa-user-check"></i>
Faculty Assignment
</h1>

<form action="insertFacultyAssignment.jsp" method="post">

<select name="facultyId" required>

<option value="">Select Faculty</option>

<%
while(rsFaculty.next()){
%>

<option value="<%=rsFaculty.getString("Faculty_id")%>">
<%=rsFaculty.getString("Faculty_name")%>
</option>

<%
}
%>

</select>

<select name="semester" required>

<option value="">Select Semester</option>

<option>1-1</option>
<option>1-2</option>
<option>2-1</option>
<option>2-2</option>
<option>3-1</option>
<option>3-2</option>
<option>4-1</option>
<option>4-2</option>

</select>

<input
type="text"
name="section"
placeholder="Section"
required>

<input
type="text"
name="subject"
placeholder="Subject"
required>

<button type="submit">

Assign Faculty

</button>

</form>

<table>

<tr>

<th>Faculty</th>

<th>Semester</th>

<th>Section</th>

<th>Subjects</th>

<th>Action</th>

</tr>
<%
boolean found=false;

while(rsTable.next())
{
found=true;
%>

<tr>

<td>

<%=rsTable.getString("Faculty_name")%>

</td>

<td>

<%=rsTable.getString("Semester")%>

</td>

<td>

<%=rsTable.getString("Section")%>

</td>

<td style="text-align:left;">

<%=rsTable.getString("Subjects")%>

</td>

<td>

<a class="edit"
href="editFacultyAssignment.jsp?facultyId=<%=rsTable.getString("Faculty_id")%>&semester=<%=rsTable.getString("Semester")%>&section=<%=rsTable.getString("Section")%>">
Edit
</a>
<a class="delete"
href="deleteFacultyAssignment.jsp?facultyId=<%=rsTable.getString("Faculty_id")%>&semester=<%=rsTable.getString("Semester")%>&section=<%=rsTable.getString("Section")%>"
onclick="return confirm('Are you sure you want to delete this assignment?');">
Delete
</a>
</td>

</tr>

<%
}

if(!found)
{
%>

<tr>

<td colspan="5" style="color:red;font-weight:bold;">

No Faculty Assignments Found

</td>

</tr>

<%
}
%>

</table>

<br>

<a href="administratorDashboard.jsp" class="back">

<i class="fas fa-arrow-left"></i>

Back to Dashboard

</a>
</div>

</body>

</html>

<%
}
catch(Exception e)
{
    out.println("<h3>Error : " + e.getMessage() + "</h3>");
}
finally
{
    try
    {
        if(rsFaculty!=null)
            rsFaculty.close();

        if(rsTable!=null)
            rsTable.close();

        if(psFaculty!=null)
            psFaculty.close();

        if(psTable!=null)
            psTable.close();

        if(con!=null)
            con.close();
    }
    catch(Exception e)
    {
    }
}
%>