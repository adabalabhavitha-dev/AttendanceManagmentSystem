<%@ page import="java.sql.*" %>

<%

String attendance_id=request.getParameter("attendance_id");
String attendance_date=request.getParameter("attendance_date");
String status=request.getParameter("status");


try{

Class.forName("com.mysql.cj.jdbc.Driver");


Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/projectdb",
"root",
""
);


PreparedStatement ps=con.prepareStatement(
"update attendance set attendance_date=?, status=? where attendance_id=?"
);


ps.setString(1,attendance_date);
ps.setString(2,status);
ps.setInt(3,Integer.parseInt(attendance_id));


int i=ps.executeUpdate();


if(i>0)
{

%>

<script>
alert("Attendance Updated Successfully");
window.location="viewAttendance.jsp";
</script>

<%

}
else
{

%>

<script>
alert("Update Failed");
window.location="viewAttendance.jsp";
</script>

<%

}


con.close();

}

catch(Exception e)
{
out.println(e);
}

%>
