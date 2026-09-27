<%@ page import="java.sql.*" %>

<%
Connection con=null;
Statement st=null;
ResultSet rs=null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con=DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );
}
catch(Exception e){
    out.println(e);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Regulation Management</title>

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

.header{
background:#1e3a8a;
color:white;
padding:20px;
font-size:28px;
font-weight:bold;
}

.container{
width:90%;
margin:30px auto;
}

.top{
display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:25px;
}

.top h2{
color:#1e3a8a;
}

.add-btn{
background:#2563eb;
color:white;
padding:12px 20px;
text-decoration:none;
border-radius:8px;
font-weight:bold;
}

.add-btn:hover{
background:#1d4ed8;
}

table{
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0 5px 15px rgba(0,0,0,.1);
}

th{
background:#2563eb;
color:white;
padding:15px;
}

td{
padding:15px;
text-align:center;
border-bottom:1px solid #ddd;
}

tr:hover{
background:#f4f8ff;
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

.back{
margin-top:25px;
}

.back a{
text-decoration:none;
background:#1e3a8a;
color:white;
padding:10px 20px;
border-radius:8px;
}

</style>

</head>

<body>

<div class="header">
Attendance Management System
</div>

<div class="container">

<div class="top">

<h2>Regulation Management</h2>

<a href="addRegulation.jsp" class="add-btn">
<i class="fas fa-plus"></i> Add Regulation
</a>

</div>

<table>

<tr>
<th>Regulation ID</th>
<th>Regulation Name</th>
<th>Action</th>
</tr>

<%

try{

st=con.createStatement();

rs=st.executeQuery("select * from regulation");

while(rs.next()){

%>

<tr>

<td><%=rs.getString("regulation_id")%></td>

<td><%=rs.getString("regulation_name")%></td>

<td>

<a class="edit"
href="editRegulation.jsp?id=<%=rs.getString("regulation_id")%>">

Edit

</a>

&nbsp;

<a class="delete"
href="deleteRegulation.jsp?id=<%=rs.getString("regulation_id")%>"
onclick="return confirm('Delete this regulation?')">

Delete

</a>

</td>

</tr>

<%
}

}catch(Exception e){
out.println(e);
}
%>

</table>

<div class="back">

<a href="administratorDashboard.jsp">

<i class="fas fa-arrow-left"></i>

Back to Dashboard

</a>

</div>

</div>

</body>
</html>