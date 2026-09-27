<%@ page import="java.sql.*" %>

<%

String id = request.getParameter("id");

String student_id="";
String attendance_date="";
String status="";


try{

Class.forName("com.mysql.cj.jdbc.Driver");


Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/projectdb",
"root",
""
);


PreparedStatement ps=con.prepareStatement(
"select a.*,s.student_name,s.course_name,s.dept_name,s.semester,s.section " +
"from attendance a join student s " +
"on a.student_id=s.student_id " +
"where a.attendance_id=?"
);


ps.setInt(1,Integer.parseInt(id));


ResultSet rs = ps.executeQuery();


if(rs.next())
{

student_id = rs.getString("student_id");
attendance_date = rs.getString("attendance_date");
status = rs.getString("status");

}


con.close();

}

catch(Exception e)
{
out.println(e);
}

%>


<!DOCTYPE html>
<html>

<head>

<title>Edit Attendance</title>


<style>

body{
font-family:Arial;
background:#eef2f7;
margin:0;
}


/* TOP HEADER */

.header{

width:100%;
background:#003366;
color:white;
padding:20px 0;
text-align:center;

}


.header h2{

color:white;
margin:0;
font-size:32px;

}



.container{

width:450px;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0px 0px 15px gray;

}


h2{

text-align:center;
color:#003366;

}


label{

font-weight:bold;
display:block;
margin-top:15px;

}


input,select{

width:100%;
padding:10px;
margin-top:5px;
border:1px solid #ccc;
border-radius:5px;

}


button{

margin-top:20px;
width:100%;
padding:12px;
background:#003366;
color:white;
border:none;
border-radius:5px;
font-size:16px;

}


button:hover{

background:#0055aa;

}


/* BACK BUTTON */

.back{

text-align:center;
margin-top:25px;

}


.back a{

background:#003366;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:5px;

}


</style>


</head>


<body>


<div class="header">

<h2>Attendance Management System</h2>

</div>



<div class="container">


<h2>Edit Attendance</h2>


<form action="updateAttendance.jsp" method="post">


<input type="hidden" name="attendance_id" value="<%=id%>">


<label>Student ID</label>

<input type="text"
name="student_id"
value="<%=student_id%>"
readonly>



<label>Attendance Date</label>

<input type="date"
name="attendance_date"
value="<%=attendance_date%>"
required>



<label>Status</label>


<select name="status">


<option value="Present"
<%=status.equals("Present")?"selected":""%>>
Present
</option>


<option value="Absent"
<%=status.equals("Absent")?"selected":""%>>
Absent
</option>


</select>



<button type="submit">
Update Attendance
</button>


</form>



<div class="back">

<a href="viewAttendance.jsp">
← Back to View Attendance
</a>

</div>


</div>


</body>

</html>
