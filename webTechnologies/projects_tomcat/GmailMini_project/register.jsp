

 
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
     
     .register-container{
         width:250px;
       
         border: 2px solid black;
    
        
 
 
     }
     .field{
         margin: 20px;
         text-align: center;
         padding:10px 35px;
     }
     .buttons{
        margin-bottom: 15px;
     }
 </style>
 
 </head>
 
 <body>
     
 
         <%
         String str=request.getParameter("msg");
         if(str!=null)
         out.println("<font size=32 color=red>"+str+"</font>");
         %>
     
         <form name="f1" method="post" action="register_users.jsp" >
 
         <div class="register-container">
             <div class="login-form">
                 <h3  align="center">register</h3>
             </div>
             <div class="field">
                 <input type="mail" name="usermail" id="usermail" placeholder="enter usermail">
        
     
             </div>
             <div class="field">
                 
                <input type="text" name="name" id="name"  placeholder="enter name:">
    
            </div>

             <div class="field">
                 
                 <input type="password" name="pwd" id="pwd"  placeholder="password">
     
             </div>
             <div class="field">
                 
                <input type="text" name="mobile" id="mobile"  placeholder="Mobile no:">
    
            </div>
            <div class="field">
                 
                <input type="text" name="type" id="type"  placeholder="enter user/admin:">
    
            </div>


 
             <div class="buttons" align="center">
                     <input type="submit" id="register" value="register">
                     <button type="reset" value="reset">reset</button>
             </div>
          
        <a href="./login.jsp">have an account? login here</a> 
         </div>   
       
         </form>
        
    
     
 
 
 </body>
 </html>