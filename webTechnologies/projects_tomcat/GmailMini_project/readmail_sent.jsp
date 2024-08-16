<%@ page import="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

<style>
  html,body{
    display: grid;
    place-items: center ;
    height: 80%;
  }

   .compose-container{

    width:400px;
    border: 1px solid black;
   }

   .sentdetails{
    display: flex;
  justify-content: space-between;
    align-items: center;
    margin-top: 10px;
    margin-bottom: 10px;
   }
</style>

</head>

<body>
    

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

        try{
          Class.forName(driver);
        }catch(ClassNotFoundException e){
          e.printStackTrace();
        }

        Connection connection=null;
        Statement statement=null;
        ResultSet resultSet=null;
        String  MFrom_str="", MTo_str="",Mtext_str="",Subject_str="" ,attachment="";
        try{
          connection=DriverManager.getConnection(connectionUrl + database,user_id,password);

          statement=connection.createStatement();
          String sql="select * from mails where mid="+mid;
          resultSet=statement.executeQuery(sql);
          while(resultSet.next()){
           MFrom_str=resultSet.getString("MFrom");
            MTo_str=resultSet.getString("MTo");
            Mtext_str=resultSet.getString("Mtext");
            Subject_str=resultSet.getString("Subject");

          }
     

        }
        catch(Exception e){
        out.println(e.getMessage());
        }


%>
    
        <table border="1" width="90%" align="center" >
          <tr>
            <td><a href="./inbox.jsp">inbox</a></td>
            <td><a href="./Retrieve_SentBox.jsp">Retrieve_SentBox</a></td>
            <td> <a href="./composemails.jsp">compose mails</a> </td>
            <td><a href="./login.jsp">Logout</a> </td>
            <td><a href="./trash.jsp">trash</a> </td>
          </tr>
        </table>

        <form name="f1" action="./deletemail_sent.jsp">
          <div class="compose-container">

          <table border="1" width=100% align="center">
           
            <tr>
             <td width="20%">FROM:</td><td>      <input type="text" name="MFrom" id="MFrom"    height="20" value="<%= MFrom_str%>" ></td>
            </tr>
            <tr>
              <td >TO:</td> <td> <input type="text" name="MTo"  id="MTo"  value="<%=MTo_str %>"  height="20"  ></td>
            </tr>
            <tr>
              <td>Subject:</td><td><input type="text"  name="Subject"  id="Subject" height="20 "  value="<%=Subject_str %>"></td>
            </tr>
            <tr>
              <td >TEXT: </td> <td> <textarea name="Mtext"  id="Mtext"  placeholder="reply message!" rows="7" cols="30"  > <%=Mtext_str %> </textarea></td>
            </tr>


          </table>
          
        <div class="sentdetails" >
          <!-- <input type="submit" id="sentbox"  value="Sentbox">  -->
           <input type="hidden" name="mid" value="<%=mid %>">
          <input type="submit"  name="delete" value="delete" >
          <input type="reset"  id="reset" value="reset">
          <button onclick="history.back()">Go Back</button>

        </div>
        </div>
       
        </form>

   
    


</body>
</html>