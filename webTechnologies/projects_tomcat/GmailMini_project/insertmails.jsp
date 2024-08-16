<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%


String From=request.getParameter("MFrom");
String To=request.getParameter("MTo");
String text=request.getParameter("Mtext");
String Subjects=request.getParameter("Subject");

try {
  Class.forName("com.mysql.jdbc.Driver");   
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gmail", "root", "Shivasql@05");
 
  Statement st= conn.createStatement();
  int i =st.executeUpdate("insert into mails(MFrom,MTo,Mtext,Subject,Inbox,Sentbox) values('"+From +"','"+To+"',' "+text+"','"+Subjects +"','1','1')");  
  response.sendRedirect("composemails.jsp?msg='Mail Sent Successfully'");

        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>