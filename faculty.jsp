<%@ page import="java.sql.*" %>

<%
Connection con = null;
Statement st = null;
PreparedStatement ps = null;
ResultSet rs = null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    

    if(request.getParameter("save") != null)
    {
        String faculty_id = request.getParameter("faculty_id");
        String faculty_name = request.getParameter("faculty_name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String mobile = request.getParameter("mobile");

if(!mobile.matches("[6-9][0-9]{9}")){
%>
<script>
alert("Please enter a valid 10-digit mobile number.");
history.back();
</script>
<%
return;
}
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String department_id = request.getParameter("department_id");
        String designation = request.getParameter("designation");
        String qualification = request.getParameter("qualification");

        ps = con.prepareStatement(
        "INSERT INTO faculty(faculty_id,faculty_name,username,password,gender,dob,mobile,email,address,department_id,designation,qualification) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");

        ps.setString(1, faculty_id);
        ps.setString(2, faculty_name);
        ps.setString(3, username);
        ps.setString(4, password);
        ps.setString(5, gender);
        ps.setString(6, dob);
        ps.setString(7, mobile);
        ps.setString(8, email);
        ps.setString(9, address);
        ps.setString(10, department_id);
        ps.setString(11, designation);
        ps.setString(12, qualification);

        ps.executeUpdate();
%>

<script>

alert("Faculty Added Successfully");

window.location="faculty.jsp";

</script>

<%
    }
%>

<!DOCTYPE html>

<html>

<head>

<title>Faculty Management</title>

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

input,
select,
textarea{

width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;

}

textarea{
height:80px;
resize:none;
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
white-space: nowrap;

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

<i class="fas fa-chalkboard-teacher"></i>

Faculty Management

</h1>

<div class="form-box">

<form method="post">

<div class="row">

<div class="col">
<label>Faculty ID</label>
<input type="text" name="faculty_id" required>
</div>

<div class="col">
<label>Faculty Name</label>
<input type="text" name="faculty_name" required>
</div>

</div>

<div class="row">

<div class="col">
<label>Username</label>
<input type="text" name="username" required>
</div>
<div class="col"> 
<label>Password</label> 
<input type="password" 
name="password" required> 
</div>
</div>



<div class="row">

<div class="col">
<label>Gender</label>

<select name="gender">

<option>Male</option>
<option>Female</option>

</select>

</div>

<div class="col">

<label>Date of Birth</label>

<input type="date" name="dob">

</div>

</div>

<div class="row">

<div class="col">

<label>Mobile</label>

<input type="tel"
       name="mobile"
       pattern="[6-9][0-9]{9}"
       maxlength="10"
       minlength="10"
       placeholder="Enter 10-digit mobile number"
       required>
</div>

<div class="col">

<label>Email</label>

<input type="email" name="email">

</div>

</div>

<div class="row">

<div class="col">

<label>Address</label>

<textarea name="address"></textarea>

</div>

<div class="col">

<label>Department</label>

<select name="department_id" required>

<option value="">Select Department</option>

<%
Statement stDept = con.createStatement();

ResultSet rsDept = stDept.executeQuery(
"SELECT department_id, department_name FROM department ORDER BY department_name");

while(rsDept.next())
{
%>

<option value="<%=rsDept.getString("department_id")%>">

<%=rsDept.getString("department_name")%>

</option>

<%
}

rsDept.close();
stDept.close();
%>

</select>

</div>

</div>

<div class="row">

<div class="col">

<label>Designation</label>

<input type="text" name="designation">

</div>

<div class="col">

<label>Qualification</label>

<input type="text" name="qualification">

</div>

</div>

<button type="submit" name="save" class="save-btn">
    <i class="fas fa-save"></i> Save Faculty
</button>

</form>

</div>
<table>

<tr>

<th>Faculty ID</th>

<th>Faculty Name</th>
<th>username</th>

<th>gender</th>
<th>Dob</th>
<th>Mobile</th>
<th>Email</th>
<th>address</th>

<th>Department</th>

<th>Designation</th>

<th>Qualification</th>

<th>Edit</th>

<th>Delete</th>

</tr>

<%

st = con.createStatement();

rs = st.executeQuery(

"SELECT " +

"f.faculty_id, " +
"f.faculty_name, " +
"f.username, " +

"f.gender, " +
"f.dob, " +
"f.mobile, " +
"f.email, " +
"f.address, " +
"d.department_name, " +
"f.designation, " +
"f.qualification " +

"FROM faculty f " +

"INNER JOIN department d " +

"ON f.department_id = d.department_id " +

"ORDER BY f.faculty_id"

);

while(rs.next())
{

%>

<tr>

<td><%=rs.getString("faculty_id")%></td>

<td><%=rs.getString("faculty_name")%></td>
<td><%=rs.getString("username")%></td>

<td><%=rs.getString("gender")%></td>
<td class="dob"><%=rs.getString("dob")%></td>
<td><%=rs.getString("mobile")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("address")%></td>
<td><%=rs.getString("department_name")%></td>
<td><%=rs.getString("designation")%></td>
<td><%=rs.getString("qualification")%></td>

<td>

<a class="edit"

href="editFaculty.jsp?id=<%=rs.getString("faculty_id")%>">

Edit

</a>

</td>

<td>

<a class="delete"

href="deleteFaculty.jsp?id=<%=rs.getString("faculty_id")%>"

onclick="return confirm('Delete this Faculty?')">

Delete

</a>

</td>

</tr>

<%

}

%>

</table>

<br><br>

<a href="administratorDashboard.jsp"
style="background:#2563eb;
color:white;
padding:12px 20px;
text-decoration:none;
border-radius:6px;
font-weight:bold;">

 Back to Administrator Dashboard

</a>

</div>

</body>

</html>

<%

}
catch(Exception e)
{
    out.println("<h3>"+e+"</h3>");
}
finally
{
    if(rs!=null) rs.close();

    if(st!=null) st.close();

    if(ps!=null) ps.close();

    if(con!=null) con.close();
}

%>