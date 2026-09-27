<%@ page import="java.sql.*" %>

<%
String department_id = request.getParameter("id");

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

    String sql = "DELETE FROM department WHERE department_id=?";

    ps = con.prepareStatement(sql);

    ps.setString(1, department_id);

    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>

alert("Department Deleted Successfully.");

window.location="department.jsp";

</script>

<%
    }
    else
    {
%>

<script>

alert("Department Not Found.");

window.location="department.jsp";

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