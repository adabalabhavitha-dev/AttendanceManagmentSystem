<%@ page import="java.sql.*" %>

<%
String faculty_id = request.getParameter("id");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String faculty_name = "";
String username = "";
String password = "";
String gender = "";
String dob = "";
String mobile = "";
String email = "";
String address = "";
String department_id = "";
String designation = "";
String qualification = "";

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    ps = con.prepareStatement(
    "SELECT * FROM faculty WHERE faculty_id=?");

    ps.setString(1, faculty_id);

    rs = ps.executeQuery();

    if(rs.next())
    {
        faculty_name = rs.getString("faculty_name");
        username = rs.getString("username");
        password = rs.getString("password");
        gender = rs.getString("gender");
        dob = rs.getString("dob");
        mobile = rs.getString("mobile");
        email = rs.getString("email");
        address = rs.getString("address");
        department_id = rs.getString("department_id");
        designation = rs.getString("designation");
        qualification = rs.getString("qualification");
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

<title>Edit Faculty</title>

<style>

body{
font-family:Arial;
background:#eef3f9;
}

.container{
width:700px;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0px 0px 10px gray;
}

h2{
text-align:center;
color:#1e3a8a;
margin-bottom:20px;
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
font-weight:bold;
margin-bottom:8px;
}

input,
select,
textarea{
width:100%;
padding:10px;
border:1px solid #ccc;
border-radius:6px;
}

textarea{
height:80px;
resize:none;
}

button{
margin-top:20px;
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

<h2>Edit Faculty</h2>

<form action="updateFaculty.jsp" method="post">

<div class="row">

<div class="col">

<label>Faculty ID</label>

<input type="text"
name="faculty_id"
value="<%=faculty_id%>"
readonly>

</div>

<div class="col">

<label>Faculty Name</label>

<input type="text"
name="faculty_name"
value="<%=faculty_name%>"
required>

</div>

</div>

<div class="row">

<div class="col">

<label>Username</label>

<input type="text"
name="username"
value="<%=username%>"
required>

</div>

<div class="col">

<label>Password</label>

<input type="text"
name="password"
value="<%=password%>"
required>

</div>

</div>

<div class="row">

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

<div class="col">

<label>Date of Birth</label>

<input type="date"
name="dob"
value="<%=dob%>">

</div>

</div>

<div class="row">

<div class="col">

<label>Mobile</label>

<input type="text"
name="mobile"
value="<%=mobile%>">

</div>

<div class="col">

<label>Email</label>

<input type="email"
name="email"
value="<%=email%>">

</div>

</div>

<label>Address</label>

<textarea name="address"><%=address%></textarea>

<br><br>

<label>Department</label>

<select name="department_id">

<%
Statement stDept = con.createStatement();

ResultSet rsDept = stDept.executeQuery(
"SELECT * FROM department");

while(rsDept.next())
{
%>

<option value="<%=rsDept.getString("department_id")%>"

<%=department_id.equals(rsDept.getString("department_id"))?"selected":""%>>

<%=rsDept.getString("department_name")%>

</option>

<%
}

rsDept.close();
stDept.close();
%>

</select>

<br><br>

<div class="row">

<div class="col">

<label>Designation</label>

<input type="text"
name="designation"
value="<%=designation%>">

</div>

<div class="col">

<label>Qualification</label>

<input type="text"
name="qualification"
value="<%=qualification%>">

</div>

</div>

<center>

<button type="submit">

Update Faculty

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