<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%


String user_mail=request.getParameter("usermail");
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
String mobile=request.getParameter("mobile");
String type=request.getParameter("type");
try
{
         Class.forName("com.mysql.jdbc.Driver");   
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gmail", "root", "Shivasql@05");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into users(emailid,name,pwd,mobile,type) values('"+user_mail+"','"+name+"', '"+ pwd +"','"+mobile+"', '"+ type+"')");

        if(i>0){
        response.sendRedirect("register.jsp?msg= 'registered successfully!' ");
        }
        

        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>

