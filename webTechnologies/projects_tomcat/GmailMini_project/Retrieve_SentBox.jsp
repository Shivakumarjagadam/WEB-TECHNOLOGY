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
String email_id=session.getAttribute("emailid").toString();

%>



<!DOCTYPE html>
<html>
<head><style>
*{
text-align:center;
}
th,td{
font-size:32px;
}

</style></head>
<body>
  <table  border="1"  align="center" width="90%">
    <tr>
      <td><a href="./inbox.jsp">inbox</a></td>
      <td><a href="./Retrieve_SentBox.jsp">Retrieve_SentBox</a></td>
      <td> <a href="./composemails.jsp">compose mails</a> </td>
      <td><a href="./login.jsp">Logout</a> </td>
      <td><a href="./trash.jsp">trash</a> </td>
    </tr>
  </table>
<form action="./delete.jsp">
 
<h1>Retrieve_SentBox  </h1>
<table border="1" align="center" width="80%">
<tr>
<th>MTo</th>
<th>Subject</th>
<th>text</th>
<th><input type="submit"  id="delete"  value="delete"></th>

</tr>
<%
int mid=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from mails where MFrom= '"+email_id +"' and SentBox=1"; 
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
  mid=resultSet.getInt("mid");

%>
<tr>
<td><%=resultSet.getString("MTo") %></td>
<td><a href="readmail_sent.jsp?mid=<%=mid%>"><%=resultSet.getString("Subject") %></a></td>
<td><%=resultSet.getString("Mtext") %></td>
<td><input type="checkbox" name="del" value="<%=mid%>">  </td>


</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println("something went wrong!");
}
%>
</table> 
<input type="hidden" name="target" value="sentbox">
<!-- <input type="submit"  id="delete"  value="delete"> -->
</form>

<a href="./composemails.jsp">Back to composemails</a>
<!-- <a href="./inbox.jsp">inbox</a> -->
</body>
</html>