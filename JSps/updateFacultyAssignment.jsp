<%@ page import="java.sql.*" %>

<%
String facultyId = request.getParameter("facultyId");
String oldSemester = request.getParameter("oldSemester");
String oldSection = request.getParameter("oldSection");

String semester = request.getParameter("semester");
String section = request.getParameter("section");
String subjects = request.getParameter("subjects");

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

    // Delete old records
    ps = con.prepareStatement(
        "DELETE FROM faculty_section WHERE Faculty_id=? AND Semester=? AND Section=?"
    );

    ps.setString(1, facultyId);
    ps.setString(2, oldSemester);
    ps.setString(3, oldSection);

    ps.executeUpdate();
    ps.close();

    // Insert new records
    ps = con.prepareStatement(
        "INSERT INTO faculty_section(Faculty_id, Semester, Section, Subject) VALUES(?,?,?,?)"
    );

    String[] arr = subjects.split(",");

    for(int i=0; i<arr.length; i++)
    {
        String sub = arr[i].trim();

        if(!sub.equals(""))
        {
            ps.setString(1, facultyId);
            ps.setString(2, semester);
            ps.setString(3, section);
            ps.setString(4, sub);

            ps.executeUpdate();
        }
    }

%>

<script>
alert("Updated Successfully");
window.location="facultyAssignment.jsp";
</script>

<%

}
catch(Exception e)
{
    out.println("Error : " + e.getMessage());
}
finally
{
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>