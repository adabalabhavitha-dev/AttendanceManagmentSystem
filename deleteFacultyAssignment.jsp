<%@ page import="java.sql.*" %>

<%
String facultyId=request.getParameter("facultyId");
String semester=request.getParameter("semester");
String section=request.getParameter("section");

Connection con=null;
PreparedStatement ps=null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/projectdb",
    "root",
    "");

    ps=con.prepareStatement(
    "DELETE FROM faculty_section WHERE Faculty_id=? AND Semester=? AND Section=?");

    ps.setString(1,facultyId);
    ps.setString(2,semester);
    ps.setString(3,section);

    int i=ps.executeUpdate();

    if(i>0)
    {
%>

<script>

alert("Assignment Deleted Successfully");

window.location="facultyAssignment.jsp";

</script>

<%
    }
    else
    {
%>

<script>

alert("Record Not Found");

window.location="facultyAssignment.jsp";

</script>

<%
    }

}
catch(Exception e)
{
    out.println("Error : "+e.getMessage());
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