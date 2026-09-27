<%@ page import="java.sql.*" %>

<%
String student_id = request.getParameter("id");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String student_name = "";
String gender = "";
String dob = "";
String mobile = "";
String email = "";
String address = "";
String regulation_id = "";
String course_id = "";
String department_id = "";
int semester = 0;
String section = "";

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    ps = con.prepareStatement(
    "SELECT * FROM student WHERE student_id=?");

    ps.setString(1, student_id);

    rs = ps.executeQuery();

    if(rs.next())
    {
        student_name = rs.getString("student_name");
        gender = rs.getString("gender");
        dob = rs.getString("dob");
        mobile = rs.getString("mobile");
        email = rs.getString("email");
        address = rs.getString("address");
        regulation_id= rs.getString("regulation_id");
        course_id = rs.getString("course_id");
        department_id = rs.getString("department_id");
        semester = rs.getInt("semester");
        section = rs.getString("section");
    }

}catch(Exception e)
{
    out.println(e);
}
%>

<!DOCTYPE html>

<html>

<head>

<title>Edit Student</title>

<style>

body{

font-family:Arial;
background:#eef3f9;

}

.container{

width:700px;
margin:30px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0px 0px 10px gray;

}

h2{

text-align:center;
color:#1e3a8a;

}

.row{

display:flex;
gap:20px;
margin-bottom:15px;

}

.col{

flex:1;

}

label{

display:block;
margin-bottom:5px;
font-weight:bold;

}

input,select,textarea{

width:100%;
padding:10px;
border:1px solid #ccc;
border-radius:5px;

}

textarea{

height:80px;

}

button{

background:#1e3a8a;
color:white;
padding:12px 25px;
border:none;
border-radius:5px;
cursor:pointer;
font-size:16px;

}

button:hover{

background:#2563eb;

}

</style>

</head>

<body>

<div class="container">

<h2>Edit Student Details</h2>

<form action="updateStudent.jsp" method="post">

<input type="hidden"
name="student_id"
value="<%=student_id%>">

<div class="row">

<div class="col">

<label>Student Name</label>

<input type="text"
name="student_name"
value="<%=student_name%>"
required>

</div>

<div class="col">

<label>Gender</label>

<select name="gender">

<option value="Male"
<%=gender.equals("Male")?"selected":""%>>

Male

</option>

<option value="Female"
<%=gender.equals("Female")?"selected":""%>>

Female

</option>

</select>

</div>

</div>

<div class="row">

<div class="col">

<label>Date of Birth</label>

<input type="date"
name="dob"
value="<%=dob%>">

</div>

<div class="col">

<label>Mobile</label>

<input type="text"
name="mobile"
value="<%=mobile%>">

</div>

</div>

<div class="row">

<div class="col">

<label>Email</label>

<input type="email"
name="email"
value="<%=email%>">

</div>

<div class="col">

<label>Semester</label>

<select name="semester">

<%
for(int i=1;i<=8;i++)
{
%>

<option value="<%=i%>"
<%=semester==i?"selected":""%>>

<%=i%>

</option>

<%
}
%>

</select>

</div>

</div>

<label>Address</label>

<textarea
name="address"><%=address%></textarea>

<br><br>

<div class="row">

<div class="col">

<label>Regulation</label>

<input type="text"
name="regulation_id"
value="<%=regulation_id%>">

</div>

<div class="col">

<label>Course</label>

<input type="text"
name="course_id"
value="<%=course_id%>">

</div>

</div>

<div class="row">

<div class="col">

<label>Department</label>

<input type="text"
name="department_id"
value="<%=department_id%>">

</div>

<div class="col">

<label>Section</label>

<input type="text"
name="section"
value="<%=section%>">

</div>

</div>

<br>

<center>

<button type="submit">

Update Student

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