<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%


String user_mail=request.getParameter("usermail");

String pwd=request.getParameter("pwd");

try
{
         Class.forName("com.mysql.jdbc.Driver");   
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gmail", "root", "Shivasql@05");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("delete from users where emailid='"+user_mail+"' and pwd='"+ pwd +"'  ");

        if(i>0){
       response.sendRedirect("login.jsp?msg= 'account deleted successfully!'  ");
        }
        

        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>



