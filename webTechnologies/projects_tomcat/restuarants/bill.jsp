<%
String bill = (String) session.getAttribute("TOTAL");
String Dosa= (String) session.getAttribute("D1");
String Idli = (String) session.getAttribute("I1");
String Vada = (String) session.getAttribute("V1");

if (bill== null) {
    response.sendRedirect("menu.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome:</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body align="center">
    <h3>final data:</h3><br> <hr>
  <h5>   TOTAL Dosa: <%= Dosa %></h5> 

  <h5>   TOTAL Idli: <%= Idli %></h5> 
  <h5>   TOTALVada: <%= Vada %></h5> <br> 


    <h2>TOTAL BILL: <%= bill %>!</h2>
    <p>Ordered successfully!</p>


    <button onclick="window.print()">print </button>
    <a href="./menu.jsp">MENU</a>
</body>
</html>
