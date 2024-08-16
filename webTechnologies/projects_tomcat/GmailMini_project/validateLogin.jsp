<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "gmail";
String userid = "root";
String password = "Shivasql@05";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String user_id=request.getParameter("usermail");
String user_pwd=request.getParameter("pwd");
int flag=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where emailid='"+user_id+"' and pwd='"+user_pwd+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    flag=1;
}
if(flag==1){
  session.setAttribute("emailid",user_id);
    response.sendRedirect("composemails.jsp");
}
else{
    response.sendRedirect("login.jsp?msg='Invalid Crendential!<br>Please try again'");
}
connection.close();
}
catch(Exception e){
    out.println(e);

}
%>