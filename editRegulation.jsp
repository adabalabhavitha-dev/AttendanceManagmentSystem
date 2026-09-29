<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String regulationId = "";
String regulationName = "";

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    ps = con.prepareStatement(
        "SELECT * FROM regulation WHERE regulation_id=?"
    );

    ps.setString(1, id);

    rs = ps.executeQuery();

    if(rs.next())
    {
        regulationId = rs.getString("regulation_id");
        regulationName = rs.getString("regulation_name");
    }

}
catch(Exception e)
{
    out.println(e);
}
finally
{
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>

<!DOCTYPE html>
<html>

<head>

<title>Edit Regulation</title>

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
width:450px;
margin:50px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.2);
}

.container h2{
text-align:center;
color:#1e3a8a;
margin-bottom:25px;
}

label{
font-weight:bold;
display:block;
margin-top:15px;
margin-bottom:8px;
}

input{
width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;
}

.buttons{
margin-top:30px;
display:flex;
justify-content:space-between;
}

.update{
background:#16a34a;
color:white;
border:none;
padding:12px 25px;
border-radius:8px;
cursor:pointer;
font-size:16px;
}

.cancel{
background:#dc2626;
color:white;
text-decoration:none;
padding:12px 25px;
border-radius:8px;
}

</style>

</head>

<body>

<div class="header">
Attendance Management System
</div>

<div class="container">

<h2>Edit Regulation</h2>

<form action="updateRegulation.jsp" method="post">

    <input type="hidden"
           name="old_regulation_id"
           value="<%= regulationId %>">

    <label>Regulation ID</label>

    <input
    type="text"
    name="regulation_id"
    value="<%= regulationId %>"
    readonly>

    <label>Regulation Name</label>

    <input
    type="text"
    name="regulation_name"
    value="<%= regulationName %>"
    required>

    <div class="buttons">

        <button type="submit" class="update">
            <i class="fas fa-edit"></i>
            Update
        </button>

        <a href="regulation.jsp" class="cancel">
            Cancel
        </a>

    </div>

</form>

</div>

</body>
</html>