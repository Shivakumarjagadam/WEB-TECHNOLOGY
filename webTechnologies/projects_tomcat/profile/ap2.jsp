a<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "project";
    String userid = "root";
    String password = "008769";
    String[] selectedIds = request.getParameterValues("id");

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

<head>
    <style>
        * {
            text-align: center;
        }

        th,
        td {
            font-size: 32px;
        }
    </style>
</head>

<body>
    <h1>Selected Records</h1>
    <table border="1" align="center" width="60%">
        <tr>
            <th>ID</th>
            <th>FACALITY</th>
            <th>DEPARTMENT</th>
        </tr>
        <%
            try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                statement = connection.createStatement();

                if (selectedIds != null && selectedIds.length > 0) {
                    for (String id : selectedIds) {
                        String sql = "SELECT * FROM department WHERE id = '" + id + "'";
                        resultSet = statement.executeQuery(sql);

                        while (resultSet.next()) {
        %>
        <tr>
            <td>
                <%= resultSet.getString("id") %>
            </td>
            <td>
                <%= resultSet.getString("facality") %>
            </td>
            <td>
                <%= resultSet.getString("department") %>
            </td>
        </tr>
        <%
                        }
                    }
                } else {
                    out.println("No records selected");
                }
                connection.close();
            } catch (Exception e) {
                out.println("Something went wrong");
            }
        %>
    </table>
</body>

</html>