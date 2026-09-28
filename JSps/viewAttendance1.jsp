<%@ page import="java.sql.*" %>


<%
String student_id=(String)session.getAttribute("student_id");


if(student_id==null){
response.sendRedirect("studentDashboard.jsp");
return;
}


Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;


try{


Class.forName("com.mysql.cj.jdbc.Driver");


con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/projectdb",
"root",
"");


ps=con.prepareStatement(


"SELECT attendance_date,status FROM attendance WHERE student_id=? ORDER BY attendance_date DESC"


);


ps.setString(1,student_id);


rs=ps.executeQuery();


}catch(Exception e){


out.println(e);


}
%>


<!DOCTYPE html>
<html>
<head>


<title>My Attendance</title>


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
background:#fff;
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
background:#f5f8ff;
}


.present{
color:green;
font-weight:bold;
}


.absent{
color:red;
font-weight:bold;
}


.back{
display:inline-block;
margin-top:20px;
background:#1e3a8a;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:8px;
}


</style>


</head>


<body>


<div class="container">


<h2>My Attendance</h2>


<table>


<tr>
<th>Date</th>
<th>Status</th>
</tr>


<%
while(rs.next()){
String status=rs.getString("status");
%>


<tr>


<td><%=rs.getString("attendance_date")%></td>



<td class="<%= "Present".equalsIgnoreCase(status) ? "present" : "absent" %>">
<%=status%>


</td>


</tr>


<%
}
%>


</table>


<a href="studentDashboard.jsp" class="back">


Back to Dashboard


</a>


</div>


</body>
</html>


<%
if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(con!=null) con.close();
%>