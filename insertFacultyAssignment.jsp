<%@ page import="java.sql.*" %>

<%
String facultyId=request.getParameter("facultyId");
String semester=request.getParameter("semester");
String section=request.getParameter("section");
String subject=request.getParameter("subject");

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con=DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/projectdb",
    "root",
    "");

    // Check Duplicate Subject
    ps=con.prepareStatement(
    "SELECT * FROM faculty_section WHERE Faculty_id=? AND Semester=? AND Section=? AND Subject=?");

    ps.setString(1,facultyId);
    ps.setString(2,semester);
    ps.setString(3,section);
    ps.setString(4,subject);

    rs=ps.executeQuery();

    if(rs.next())
    {
%>

<script>
alert("Subject Already Assigned");
window.location="facultyAssignment.jsp";
</script>

<%
    }
    else
    {
        rs.close();
        ps.close();

        ps=con.prepareStatement(
        "INSERT INTO faculty_section(Faculty_id,Semester,Section,Subject) VALUES(?,?,?,?)");

        ps.setString(1,facultyId);
        ps.setString(2,semester);
        ps.setString(3,section);
        ps.setString(4,subject);

        int i=ps.executeUpdate();

        if(i>0)
        {
%>

<script>
alert("Faculty Assigned Successfully");
window.location="facultyAssignment.jsp";
</script>

<%
        }
        else
        {
%>

<script>
alert("Assignment Failed");
window.location="facultyAssignment.jsp";
</script>

<%
        }
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
        if(rs!=null) rs.close();
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }
    catch(Exception e){}
}
%>