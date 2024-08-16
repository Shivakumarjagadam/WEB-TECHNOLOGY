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

        <form name="f1" action="insertmails.jsp">
          <div class="compose-container">

          <table border="1" width=100% align="center">
           </a>
            <tr>
             <td width="20%">FROM:</td><td>      <input type="text" name="MFrom" id="MFrom"    height="20" value="<%=emailstr %>" ></td>
            </tr>
            <tr>
              <td >TO:</td> <td> <input type="text" name="MTo"  id="MTo"   height="20"  ></td>
            </tr>
            <tr>
              <td>Subject:</td><td><input type="text"  name="Subject"  id="Subject" height="20"></td>
            </tr>
            <tr>
              <td >TEXT: </td> <td> <textarea name="Mtext"  id="Mtext"  placeholder="reply message!" rows="7" cols="30"></textarea></td>
            </tr>


          </table>
          
        <div class="sentdetails" >
          <input type="submit" id="sentbox"  value="Sentbox"> 
          <input type="button"  id="back" value="Back">
          <input type="reset"  id="reset" value="reset">
        </div>
        </div>
       
        </form>

   
    


</body>
</html>