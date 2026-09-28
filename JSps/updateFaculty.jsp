<%@ page import="java.sql.*" %>

<%
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

    String sql =
    "UPDATE faculty SET faculty_name=?, username=?, password=?, gender=?, dob=?, mobile=?, email=?, address=?, department_id=?, designation=?, qualification=? WHERE faculty_id=?";

    ps = con.prepareStatement(sql);

    ps.setString(1, faculty_name);
    ps.setString(2, username);
    ps.setString(3, password);
    ps.setString(4, gender);
    ps.setString(5, dob);
    ps.setString(6, mobile);
    ps.setString(7, email);
    ps.setString(8, address);
    ps.setString(9, department_id);
    ps.setString(10, designation);
    ps.setString(11, qualification);
    ps.setString(12, faculty_id);

    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>

alert("Faculty Updated Successfully.");

window.location="faculty.jsp";

</script>

<%
    }
    else
    {
%>

<script>

alert("Faculty Update Failed.");

window.location="faculty.jsp";

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
    if(ps!=null)
        ps.close();

    if(con!=null)
        con.close();
}
%>