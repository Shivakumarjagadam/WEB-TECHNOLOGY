<%@ page import="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection" %>


<%

String str=request.getParameter("msg");

 String emailstr="";
 if(session.getAttribute("emailid")!=null);
   emailstr=session.getAttribute("emailid").toString();


 if(str!=null)
 out.println("<font size=32 color=red>"+str+"</font>");


 int mid=Integer.parseInt(request.getParameter("mid"));
 String driver="com.mysql.jdbc.Driver";
 String connectionUrl="jdbc:mysql://localhost:3306/";

 String database="gmail";
 String user_id="root";
 String password="Shivasql@05";
 int i=0; 

 try{
   Class.forName(driver);
 }catch(ClassNotFoundException e){
   e.printStackTrace();
 }

 Connection connection=null;
 Statement statement=null;
 ResultSet resultSet=null;

 try{
   connection=DriverManager.getConnection(connectionUrl + database,user_id,password);

   statement=connection.createStatement();
   String sql="update mails set sentbox=0 where mid="+mid;
   i =statement.executeUpdate(sql);
  if(i>0){
    response.sendRedirect("Retrieve_SentBox.jsp");
  }


 }  
 catch(Exception e){
 out.println(e.getMessage());
 }


%>