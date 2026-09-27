<%@ page import="java.sql.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try
{
    // Load MySQL Driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Database Connection
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    // Check Administrator Login
    String sql = "SELECT * FROM administrator WHERE username=? AND password=?";

    ps = con.prepareStatement(sql);

    ps.setString(1, username);
    ps.setString(2, password);

    rs = ps.executeQuery();

    if(rs.next())
    {
session.setAttribute("administrator_id", rs.getInt("administrator_id"));
session.setAttribute("administrator_name", rs.getString("administrator_name"));
session.setAttribute("username", rs.getString("username"));
                        response.sendRedirect("administratorDashboard.jsp");
    }
    else
    {
%>

<script>
alert("Invalid Username or Password");
window.location="administratorLogin.html";
</script>

<%
    }

}
catch(Exception e)
{
    out.println("<h3>Error : " + e.getMessage() + "</h3>");
}
finally
{
    try
    {
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>
