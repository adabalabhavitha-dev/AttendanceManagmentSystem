<%@ page import="java.sql.*" %>

<%
String faculty_id = request.getParameter("faculty_id");
String faculty_name = request.getParameter("faculty_name");
String username = request.getParameter("username");
String password = request.getParameter("password");
String gender = request.getParameter("gender");
String dob = request.getParameter("dob");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String address = request.getParameter("address");
String department_id = request.getParameter("department_id");
String designation = request.getParameter("designation");
String qualification = request.getParameter("qualification");

Connection con = null;
PreparedStatement ps = null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

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

    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>

alert("Faculty Saved Successfully");

window.location="faculty.jsp?action=new";

</script>

<%
    }
    else
    {
%>

<script>

alert("Failed to Save Faculty");

window.location="faculty.jsp?action=new";

</script>

<%
    }

}
catch(Exception e)
{
%>

<h2>Database Error</h2>

<pre>

<%=e%>

</pre>

<%
}
finally
{
    try
    {
        if(ps!=null)
            ps.close();

        if(con!=null)
            con.close();
    }
    catch(Exception e)
    {
    }
}
%>