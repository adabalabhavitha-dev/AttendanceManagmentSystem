<%@ page import="java.sql.*" %>

<%
String regulationId = request.getParameter("id");

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
        "DELETE FROM regulation WHERE regulation_id=?"
    );

    ps.setString(1, regulationId);

    int i = ps.executeUpdate();

    if(i > 0)
    {
%>

<script>
alert("Regulation Deleted Successfully");
window.location="regulation.jsp";
</script>

<%
    }
    else
    {
%>

<script>
alert("Delete Failed");
window.location="regulation.jsp";
</script>

<%
    }

}
catch(Exception e)
{
%>

<script>
alert("<%=e.getMessage()%>");
window.location="regulation.jsp";
</script>

<%
}
finally
{
    try
    {
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }
    catch(Exception e){}
}
%>