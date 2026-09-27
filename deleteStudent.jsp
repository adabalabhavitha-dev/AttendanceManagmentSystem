<%@ page import="java.sql.*" %>

<%
String student_id = request.getParameter("id");

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

    String sql = "DELETE FROM student WHERE student_id=?";

    ps = con.prepareStatement(sql);

    ps.setString(1, student_id);

    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>

alert("Student Deleted Successfully.");

window.location="studentManagement.jsp";

</script>

<%
    }
    else
    {
%>

<script>

alert("Unable to Delete Student.");

window.location="studentManagement.jsp";

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