<%@ page import="java.sql.*" %>

<%
String facultyId = (String)session.getAttribute("faculty_id");

String facultyName = (String)session.getAttribute("faculty_name");

if(facultyId == null){
    response.sendRedirect("Facultylogin.html");
    return;
}

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );
ps = con.prepareStatement(
"SELECT Section, Semester, COUNT(Subject) AS TotalSubjects FROM faculty_section WHERE Faculty_id=? GROUP BY Section, Semester");

ps.setString(1, facultyId);

rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>

<title>Faculty Dashboard</title>

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

.header{
background:#003366;
color:white;
padding:18px 40px;
display:flex;
justify-content:space-between;
align-items:center;
}

.logout{
background:red;
color:white;
text-decoration:none;
padding:10px 18px;
border-radius:6px;
}

.logout:hover{
background:#c40000;
}

.container{
width:90%;
margin:40px auto;
}

.welcome{
background:white;
padding:20px;
border-radius:10px;
box-shadow:0 4px 10px rgba(0,0,0,.15);
margin-bottom:30px;
}

.cards{
display:flex;
flex-wrap:wrap;
gap:25px;
}

.card{
width:300px;
background:white;
padding:25px;
border-radius:12px;
box-shadow:0 5px 15px rgba(0,0,0,.15);
text-align:center;
transition:.3s;
}

.card:hover{
transform:translateY(-8px);
}

.card h3{
color:#003366;
margin-bottom:15px;
}

.card p{
margin:8px;
font-size:16px;
}

.btn{
display:inline-block;
margin-top:15px;
background:#003366;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:6px;
}

.btn:hover{
background:#0055aa;
}

</style>

</head>

<body>

<div class="header">

<h2>Faculty Dashboard</h2>

<a href="logout.jsp" class="logout">Logout</a>

</div>

<div class="container">

<div class="welcome">

<h2>Welcome, <%=facultyName%></h2>
<p><b>Faculty ID :</b> <%=facultyId%></p>

</div>

<div class="cards">

<%
while(rs.next()){
%>

<div class="card">

<h3>Section : <%=rs.getString("Section")%></h3>

<p><b>Semester :</b> <%=rs.getString("Semester")%></p>

<p><b>Subjects Assigned :</b> <%=rs.getInt("TotalSubjects")%></p>

<a class="btn"
href="subjects.jsp?section=<%=rs.getString("Section")%>&semester=<%=rs.getString("Semester")%>">

Open

</a>

</div>

<%
}
%>

</div>

</div>

</body>
</html>

<%
}
catch(Exception e){
    out.println(e);
}
finally{
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>