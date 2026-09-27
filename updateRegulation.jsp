<%@ page import="java.sql.*" %>

<%
String oldId = request.getParameter("old_regulation_id");
String newId = request.getParameter("regulation_id");
String regulationName = request.getParameter("regulation_name");

Connection con = null;
PreparedStatement ps = null;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/projectdb",
        "root",
        ""
    );

    ps = con.prepareStatement(
        "UPDATE regulation SET regulation_id=?, regulation_name=? WHERE regulation_id=?"
    );

    ps.setString(1, newId);
    ps.setString(2, regulationName);
    ps.setString(3, oldId);

    int i = ps.executeUpdate();

    if(i > 0){
        response.sendRedirect("regulation.jsp");
    }else{
        out.println("Update Failed");
    }

}catch(Exception e){
    out.println(e);
}finally{
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>
