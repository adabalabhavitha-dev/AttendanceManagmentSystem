<%@ page import="java.sql.*" %>

<%
String department_id = request.getParameter("department_id");
String department_name = request.getParameter("department_name");
String course_id = request.getParameter("course_id");

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
    "UPDATE department SET department_name=?, course_id=? WHERE department_id=?";

    ps = con.prepareStatement(sql);

    ps.setString(1, department_name);
    ps.setString(2, course_id);
    ps.setString(3, department_id);

    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>

alert("Department Updated Successfully.");

window.location="department.jsp";

</script>

<%
    }
    else
    {
%>

<script>

alert("Department Update Failed.");

window.location="department.jsp";

</script>

<%
    }

}
catch(Exception e)
{
%>

<script>
alert("Error: <%=e.getMessage()%>");
window.location="department.jsp";
</script>

<%
}
finally
{
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>