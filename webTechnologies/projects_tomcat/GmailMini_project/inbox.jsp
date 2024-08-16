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
  <table  style="border: 1px solid black;"  border="1"  align="center" width="90%"> 
    <tr>
      <td><a href="./inbox.jsp">inbox</a></td>
      <td><a href="./Retrieve_SentBox.jsp">Retrieve_SentBox</a></td>
      <td> <a href="./composemails.jsp">compose mails</a> </td>
      <td><a href="./login.jsp">Logout</a> </td>
      <td><a href="./trash.jsp">trash</a> </td>
    </tr>
  </table>
<form action="./delete.jsp">

<h1>inbox  </h1>
<table border="1" align="center" width="80%">
<tr>
<th>MFrom</th>
<th>Subject</th>
<th>text</th>
<th><input type="submit"  id="delete"  value="delete"></th>

</tr>
<%
int mid=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from mails where MTo= '"+email_id +"' and Inbox=1"; 
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
  mid=resultSet.getInt("mid");

%>
<tr>
<td><%=resultSet.getString("MFrom") %></td>
<td><%=resultSet.getString("Subject") %></td>
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
<input type="hidden" name="target" value="inbox">
<!-- <input type="submit"  id="delete"  value="delete"> -->
</form>

<a href="./composemails.jsp">Back to composemails</a>
<!-- <a href="./Retrieve_SentBox.jsp">Retrieve_SentBox</a> -->
</body>
</html>