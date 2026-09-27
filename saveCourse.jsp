<%@ page import="java.sql.*" %>

<%
String course_id=request.getParameter("course_id");
String course_name=request.getParameter("course_name");
String duration=request.getParameter("duration");

Connection con=null;
PreparedStatement ps=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/projectdb",
"root",
""
);

ps=con.prepareStatement(
"INSERT INTO course(course_id,course_name,duration) VALUES(?,?,?)"
);

ps.setString(1,course_id);
ps.setString(2,course_name);
ps.setString(3,duration);

int i=ps.executeUpdate();

if(i>0){
%>

<script>

alert("✅ Course Added Successfully!");

window.location="course.jsp";

</script>

<%
}

}
catch(SQLIntegrityConstraintViolationException e){
%>

<script>

alert("⚠ Course ID Already Exists!");

window.location="addCourse.jsp";

</script>

<%
}
catch(Exception e){
%>

<script>

alert("❌ Error : <%=e.getMessage()%>");

window.location="addCourse.jsp";

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


