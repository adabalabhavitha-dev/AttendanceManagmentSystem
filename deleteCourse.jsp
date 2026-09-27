<%@ page import="java.sql.*" %>

<%
String course_id = request.getParameter("id");

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
        "DELETE FROM course WHERE course_id=?"
    );

    ps.setString(1, course_id);

    int i = ps.executeUpdate();

    if(i > 0){
%>

<script>

alert("🗑️ Course Deleted Successfully!");

window.location="course.jsp";

</script>

<%
    }
    else{
%>

<script>

alert("Course Not Found!");

window.location="course.jsp";

</script>

<%
    }

}
catch(Exception e){
%>

<script>

alert("Error : <%=e.getMessage()%>");

window.location="course.jsp";

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



