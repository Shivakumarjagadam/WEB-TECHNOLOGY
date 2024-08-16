<!-- 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%
int delete_id = Integer.parseInt(request.getParameter("delete_id"));

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdev", "root", "Shivasql@05");
    Statement st = conn.createStatement();

    int i = st.executeUpdate("DELETE FROM student WHERE id=" + delete_id);

    if (i > 0) {
        out.println("<center><b>Data deleted successfully!</b></center>");
    } else {
        out.println("<center><b>Failed to delete data.</b></center>");
    }

} catch (Exception e) {
    System.out.print(e);
    e.printStackTrace();
} 
%>
 -->



 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
 <%
 int delete_id = Integer.parseInt(request.getParameter("delete_id"));
 
 try {
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdev", "root", "Shivasql@05");
     Statement st = conn.createStatement();
 
     int i = st.executeUpdate("DELETE FROM student WHERE id=" + delete_id);
 
     if (i > 0) {
       out.println("<center><b>Data is successfully deleted!<br><a href='RetrieveData.jsp'>Check Now</a></b></center>");
   } else {
         out.println("<center><b>Failed to delete data.</b></center>");
     }
 
 } catch (Exception e) {
     System.out.print(e);
     e.printStackTrace();
 }
 %>
 

