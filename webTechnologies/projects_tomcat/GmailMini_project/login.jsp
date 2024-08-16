<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

<style>
    body{
        padding: 0;
        margin: 0;
    }
    html,body{
        display: grid;
        place-items: center;
        height: 100%;
        background-color: #f2f2f2;
    }
    
    .login-container{
        width:250px;
        height: 320px;
        border: 2px solid black;
   
       


    }
    .field{
        margin: 20px;
        text-align: center;
        padding:10px 35px;
    }
    .buttons{
        margin-bottom: 50px;
    }
</style>

</head>

<body align="center">
    

        <%
        String str=request.getParameter("msg");
        if(str!=null)
        out.println("<font size=32 color=red>"+str+"</font>");
        %>
    
        <form name="f1" action="validateLogin.jsp"  method="post">

        <div class="login-container">
            <div class="login-formm">
                <h3  align="center">Login</h3>
            </div>
            <div class="field">
                <input type="mail" name="usermail" id="usermail" placeholder="enter usermail">
       
    
            </div>
            <div class="field">
                
                <input type="password" name="pwd" id="pwd"  placeholder="password">
    
            </div>

            <div class="buttons" align="center" style="margin-bottom:15px;">
                    <input type="submit" id="login" value="login">
                    <button type="reset" value="reset">reset</button>
                    <a href="./register.jsp">register here</a> 
            </div>
            
        </div>
        <a href="./delete_account_users.jsp"> To_delete_account</a>
        </form>  
      
       


</body>
</html>