<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "project";
    String userid = "root";
    String password = "008769";
    String selectedBranch = request.getParameter("br");

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
    <form method="get" action="selected2.jsp">
        <label>Branch :</label>
        <option value="cse" <% if ("cse".equals(selectedBranch)) out.print("selected"); %>>CSE</option>
            <option value="ece" <% if ("ece".equals(selectedBranch)) out.print("selected"); %>>ECE</option>
            <option value="cse" <% if ("cse".equals(selectedBranch)) out.print("selected"); %>>CSE</option>
            <option value="ece" <% if ("ece".equals(selectedBranch)) out.print("selected"); %>>ECE</option>
            <option value="eee" <% if ("eee".equals(selectedBranch)) out.print("selected"); %>>EEE</option>
            <option value="civl" <% if ("civl".equals(selectedBranch)) out.print("selected"); %>>CIVL</option>
            <option value="mech" <% if ("mech".equals(selectedBranch)) out.print("selected"); %>>MECH</option>
            <option value="mme" <% if ("mme".equals(selectedBranch)) out.print("selected"); %>>MME</option>
        </select><br><br>

        <table border="1" align="center" width="60%">
            <tr>
                <th>ID</th>
                <th>FACALITY</th>
                <th>DEPARTMENT</th>
                <th>SELECT</th>
            </tr>
            <%
                try {
                    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM department";
                    if (selectedBranch != null && !selectedBranch.isEmpty()) {
                        sql += " WHERE department = '" + selectedBranch + "'";
                    }
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
                <td>
                    <input type="checkbox" name="id" value="<%= resultSet.getString("id") %>">
                </td>
            </tr>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    out.println("Something went wrong");
                }
            %>
        </table>
        <input type="submit" value="select" style="align-items: center; width: 100px; height: 30px; margin-left: 450px; margin-top: 20px; background-color: aqua; color: rgb(15, 13, 13); border-radius: 5px;">
    </form>
</body>

</html>