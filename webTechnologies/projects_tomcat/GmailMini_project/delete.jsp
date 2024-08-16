<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*"%>
<%
String target=request.getParameter("target");
String[] selectedMails = request.getParameterValues("del");
int mid=0,i;

if (selectedMails != null) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gmail", "root", "Shivasql@05");
        Statement st=conn.createStatement();

        if("sentbox".equals(target)){
         for(int n=0;n< selectedMails.length;n++){
      mid=Integer.parseInt(selectedMails[n]);
      i=st.executeUpdate("update mails set sentbox=0 where mid="+mid);
      response.sendRedirect("Retrieve_SentBox.jsp");
      }

       }
      else if("inbox".equals(target)){
        for(int n=0;n< selectedMails.length;n++){
            mid=Integer.parseInt(selectedMails[n]);
            i=st.executeUpdate("update mails set Inbox=0 where mid="+mid);
            response.sendRedirect("inbox.jsp");
            }
      
      }
    
     if("trash".equals(target)){
        for(int n=0;n< selectedMails.length;n++){
            mid=Integer.parseInt(selectedMails[n]);
            i=st.executeUpdate("update mails set Inbox=2 , sentbox=2 where mid="+mid);
            response.sendRedirect("trash.jsp");
        }

    }
        
    } catch (Exception e) {
        e.printStackTrace();
    }
} else {
    response.sendRedirect("composemails.jsp?msg=No Mails Selected");
}

%>
