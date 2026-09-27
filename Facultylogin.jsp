<%@ page import="java.sql.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try{

    // Load MySQL Driver
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Connect to Database
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    // Check Admin Login
    String sql = "SELECT * FROM faculty WHERE username=? AND password=?";

    PreparedStatement ps = con.prepareStatement(sql);

    ps.setString(1, username);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();

    if(rs.next())
{
    session.setAttribute("faculty_id", rs.getString("faculty_id"));
    session.setAttribute("faculty_name", rs.getString("faculty_name"));
    session.setAttribute("username", rs.getString("username"));

    response.sendRedirect("FacultyDashboard.jsp");
}
else
{
    out.println("<script>");
    out.println("alert('Invalid Username or Password');");
    out.println("location='facultylogin.html';");
    out.println("</script>");
}

    rs.close();
    ps.close();
    con.close();

}catch(Exception e){

    out.println("<h3>Database Connection Error</h3>");
    out.println(e);

}
%>


