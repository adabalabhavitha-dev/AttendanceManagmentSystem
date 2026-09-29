<%@ page import="java.sql.*" %>

<%
String facultyId=(String)session.getAttribute("faculty_id");

if(facultyId==null)
{
    response.sendRedirect("Facultylogin.html");
    return;
}

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

    String semester=request.getParameter("semester");
    String section=request.getParameter("section");

    ps=con.prepareStatement(
    "SELECT Subject FROM faculty_section WHERE Faculty_id=? AND Semester=? AND Section=?");

    ps.setString(1,facultyId);
    ps.setString(2,semester);
    ps.setString(3,section);

    rs=ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>

<title>Subjects</title>

<style>

body{
font-family:Arial,sans-serif;
background:#eef3f9;
margin:0;
}

.container{
width:90%;
margin:40px auto;
}

h2{
text-align:center;
color:#1e3a8a;
margin-bottom:30px;
}

.cards{
display:flex;
flex-wrap:wrap;
justify-content:center;
gap:25px;
}

.card{
width:220px;
background:#fff;
padding:25px;
text-align:center;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.15);
transition:.3s;
}

.card:hover{
transform:translateY(-8px);
}

.card h3{
color:#1e3a8a;
margin-bottom:20px;
}

.card a{
display:inline-block;
padding:10px 20px;
background:#2563eb;
color:#fff;
text-decoration:none;
border-radius:6px;
}

.card a:hover{
background:#1d4ed8;
}

.back{
display:inline-block;
margin-top:30px;
text-decoration:none;
background:#555;
color:white;
padding:10px 20px;
border-radius:6px;
}

</style>

</head>

<body>

<div class="container">

<h2>
Semester : <%=semester%> |
Section : <%=section%>
</h2>

<div class="cards">

<%
while(rs.next())
{
%>

<div class="card">

<h3><%=rs.getString("Subject")%></h3>

<a href="studentList.jsp?semester=<%=semester%>&section=<%=section%>&subject=<%=rs.getString("Subject")%>">

Open

</a>

</div>

<%
}
%>

</div>

<br>

<a href="FacultyDashboard.jsp" class="back">
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