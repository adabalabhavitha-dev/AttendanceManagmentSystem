<%@ page import="java.sql.*" %>

<%
String regulationId = request.getParameter("regulation_id");
String regulationName = request.getParameter("regulation_name");

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
        "INSERT INTO regulation(regulation_id, regulation_name) VALUES(?,?)"
    );

    ps.setString(1, regulationId);
    ps.setString(2, regulationName);

    int i = ps.executeUpdate();

    if(i > 0)
    {
        response.sendRedirect("regulation.jsp");
    }
    else
    {
%>

<script>
alert("Regulation Not Added");
window.location="addRegulation.jsp";
</script>

<%
    }

}
catch(Exception e)
{
%>

<script>
alert("<%=e.getMessage()%>");
window.location="addRegulation.jsp";
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

