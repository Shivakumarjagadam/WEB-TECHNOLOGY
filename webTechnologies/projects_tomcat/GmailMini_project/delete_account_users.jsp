<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <%
String str=request.getParameter("msg");
if(str!=null){
  out.println("<font size=25 color=red >"+str+"</font");
}

  %>


<form action="./Deleted_account.jsp">
</div class="delete_container">
  <div class="field">
    <input type="mail" name="usermail" id="usermail" placeholder="enter usermail"> <br> <br>

  </div>
  <div class="field">
    
    <input type="password" name="pwd" id="pwd"  placeholder="password"> <br> <br>

  </div>

</div>
<input type="submit" value="delete_Account">

</form>
  
</body>
</html>