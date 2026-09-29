<%@ page import="java.sql.*" %>

<%
String student_id=(String)session.getAttribute("student_id");

String oldPassword=request.getParameter("oldPassword");
String newPassword=request.getParameter("newPassword");
String confirmPassword=request.getParameter("confirmPassword");

if(student_id==null){
    response.sendRedirect("studentLogin.jsp");
    return;
}

if(!newPassword.equals(confirmPassword)){
%>

<script>
alert("New Password and Confirm Password do not match.");
history.back();
</script>

<%
return;
}

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/projectdb",
"root",
""
);

ps=con.prepareStatement(
"SELECT * FROM student WHERE student_id=? AND password=?");

ps.setString(1,student_id);
ps.setString(2,oldPassword);

rs=ps.executeQuery();

if(rs.next()){

PreparedStatement ps2=con.prepareStatement(
"UPDATE student SET password=? WHERE student_id=?");

ps2.setString(1,newPassword);
ps2.setString(2,student_id);

int i=ps2.executeUpdate();

if(i>0){
%>

<script>
alert("Password Changed Successfully");
window.location="studentDashboard.jsp";
</script>

<%
}else{
%>

<script>
alert("Password Update Failed");
history.back();
</script>

<%
}

ps2.close();

}else{
%>

<script>
alert("Current Password is Incorrect");
history.back();
</script>

<%
}

}catch(Exception e){
%>

<h2>Database Error</h2>

<pre><%=e%></pre>

<%
}finally{

if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(con!=null) con.close();

}
%>