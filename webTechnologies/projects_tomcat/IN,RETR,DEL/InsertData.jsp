<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,java.util.*"%>

<%

int user_id=Integer.parseInt(request.getParameter("uid"));
String user_name=request.getParameter("uname");
try
{
         Class.forName("com.mysql.jdbc.Driver");  
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdev", "root", "Shivasql@05");
           Statement st=conn.createStatement(); 
           int i=st.executeUpdate("insert into student(id,name)values("+user_id+",'"+user_name+"')");
        out.println("<center><b>Data is successfully inserted!<br><a href='RetrieveData.jsp'>Check Now</a></b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>

 <!-- 
 Connection: Represents a connection to the database.
DriverManager: Manages a list of database drivers.
Statement: Used to execute a static SQL statement and return the results it produces.
PreparedStatement: A SQL statement that is precompiled and stored in a PreparedStatement object, which can then be used to efficiently execute this statement multiple times.
ResultSet: Represents the result set of a database query.
SQLException: 
 -->