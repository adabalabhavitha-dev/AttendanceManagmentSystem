<%@ page import="java.sql.*" %>

<%
String student_id = request.getParameter("student_id");
String student_name = request.getParameter("student_name");
String gender = request.getParameter("gender");
String dob = request.getParameter("dob");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String address = request.getParameter("address");
String regulation_id = request.getParameter("regulation_id");
String course_id = request.getParameter("course_id");
String department_id = request.getParameter("department_id");
String semester = request.getParameter("semester");
String section = request.getParameter("section");

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
    "UPDATE student SET " +
    "student_name=?, " +
    "gender=?, " +
    "dob=?, " +
    "mobile=?, " +
    "email=?, " +
    "address=?, " +
    "regulation_id=?, " +
    "course_id=?, " +
    "department_id=?, " +
    "semester=?, " +
    "section=? " +
    "WHERE student_id=?";

    ps = con.prepareStatement(sql);

    ps.setString(1, student_name);
    ps.setString(2, gender);
    ps.setString(3, dob);
    ps.setString(4, mobile);
    ps.setString(5, email);
    ps.setString(6, address);
    ps.setString(7, regulation_id);
    ps.setString(8, course_id);
    ps.setString(9, department_id);
    ps.setInt(10, Integer.parseInt(semester));
    ps.setString(11, section);
    ps.setString(12, student_id);

    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>

alert("Student Details Updated Successfully.");

window.location="studentManagement.jsp";

</script>

<%
    }
    else
    {
%>

<script>

alert("Student Update Failed.");

history.back();

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