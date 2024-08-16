<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "webdev";
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
<form action="bill.jsp">
<h1>you ordered food items:</h1>
<table border="1" align="center" width="60%">
<tr>
<th>ID</th>
<th>item</th>
<th>price</th>
<th>no_plates</th>

</tr>
<%

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from orders"; 
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("item") %></td>
<td><%=resultSet.getString("amount") %></td>
<td><%=resultSet.getString("no_plates") %></td>


</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println("something went wrong!");
}
%>
</table> 

<input type="submit"  value="Bill">
</form>
<a href="./menu.jsp">MENU PAGE</a> <br> <a href="./bill.jsp">BILL</a>


</body>
</html>