<%@ page import="java.sql.*" %>

<%
String course_id = request.getParameter("course_id");
String course_name = request.getParameter("course_name");
String duration = request.getParameter("duration");

Connection con = null;
PreparedStatement ps = null;

try{

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    ps = con.prepareStatement(
        "UPDATE course SET course_name=?, duration=? WHERE course_id=?"
    );

    ps.setString(1, course_name);
    ps.setString(2, duration);
    ps.setString(3, course_id);

    int i = ps.executeUpdate();

    if(i > 0){
%>

<script>

alert("✅ Course Updated Successfully!");

window.location="course.jsp";

</script>

<%
    }
    else{
%>

<script>

alert("❌ Course Update Failed!");

window.location="editCourse.jsp?id=<%=course_id%>";

</script>

<%
    }

}
catch(Exception e){
%>

<script>

alert("Error : <%=e.getMessage()%>");

window.location="editCourse.jsp?id=<%=course_id%>";

</script>

<%
}
finally{

    if(ps!=null)
        ps.close();

    if(con!=null)
        con.close();

}
%>

