<%@ page import="java.sql.*" %>

<%
Connection con = null;
PreparedStatement ps = null;
PreparedStatement check = null;
ResultSet rs = null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    String[] studentId = request.getParameterValues("student_id");
    String[] studentName = request.getParameterValues("student_name");
    String[] presentStudents = request.getParameterValues("present");

    String semester = request.getParameter("semester");
    String section = request.getParameter("section");
    String subject = request.getParameter("subject");
    String attendanceDate = request.getParameter("attendance_date");
    String period = request.getParameter("period");
out.println("Period = " + period + "<br>");
out.println("Date = " + request.getParameter("attendance_date") + "<br>");
    if(studentId == null)
    {
        out.println("No Students Found");
        return;
    }

    if(period == null || period.trim().equals(""))
    {
        out.println("Period not selected.");
        return;
    }

    // Check duplicate attendance
    check = con.prepareStatement(
    "SELECT COUNT(*) FROM attendance WHERE semester=? AND section=? AND subject=? AND attendance_date=? AND period=?");

    check.setString(1, semester);
    check.setString(2, section);
    check.setString(3, subject);
    check.setString(4, attendanceDate);
    check.setString(5, period);

    rs = check.executeQuery();

    if(rs.next() && rs.getInt(1) > 0)
    {
%>

<script>
alert("Attendance already marked for this period.");
location="FacultyDashboard.jsp";
</script>

<%
        return;
    }

    String sql = "INSERT INTO attendance(student_id,student_name,semester,section,subject,attendance_date,period,status) VALUES(?,?,?,?,?,?,?,?)";

    ps = con.prepareStatement(sql);

    for(int i=0;i<studentId.length;i++)
    {
        String status="Absent";

        if(presentStudents!=null)
        {
            for(String id : presentStudents)
            {
                if(id.equals(studentId[i]))
                {
                    status="Present";
                    break;
                }
            }
        }

        ps.setString(1, studentId[i]);
        ps.setString(2, studentName[i]);
        ps.setString(3, semester);
        ps.setString(4, section);
        ps.setString(5, subject);
        ps.setString(6, attendanceDate);
        ps.setString(7, period);
        ps.setString(8, status);

        ps.executeUpdate();
    }

%>

<script>
alert("Attendance Saved Successfully");
location="FacultyDashboard.jsp";
</script>

<%

}
catch(Exception e)
{
    out.println("Database Error : " + e);
}
finally
{
    if(rs!=null) rs.close();
    if(check!=null) check.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>