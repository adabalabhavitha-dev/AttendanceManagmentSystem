<%@ page import="java.sql.*" %>

<%
String student_id = request.getParameter("student_id");
String password = request.getParameter("password");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/projectdb",
    "root",
    ""
    );

    ps = con.prepareStatement(
    "SELECT * FROM student WHERE student_id=? AND password=?");

    ps.setString(1, student_id);
    ps.setString(2, password);

    rs = ps.executeQuery();

    if(rs.next())
    {
        session.setAttribute("student_id", rs.getString("student_id"));
        session.setAttribute("student_name", rs.getString("student_name"));
%>

<script>

alert("Student Login Successful");

window.location="studentDashboard.jsp";

</script>

<%
    }
    else
    {
%>

<script>

alert("Invalid Student ID or Password");

window.location="studentLogin.jsp";

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
    try{
        if(rs!=null) rs.close();
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }
    catch(Exception ex){}
}
%>