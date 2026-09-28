<%@ page import="java.sql.*" %>

<%
String admin_id = request.getParameter("id");

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

    String sql = "DELETE FROM faculty WHERE faculty_id=?";

    ps = con.prepareStatement(sql);

    ps.setString(1, admin_id);

    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>

alert("Faculty Deleted Successfully.");

window.location="faculty.jsp";

</script>

<%
    }
    else
    {
%>

<script>

alert("Faculty Record Not Found.");

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