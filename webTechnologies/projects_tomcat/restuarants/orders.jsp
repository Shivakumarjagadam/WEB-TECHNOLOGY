<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int dosa= Integer.parseInt( request.getParameter("dosa"));
int idli=Integer.parseInt( request.getParameter("idli"));
int vada=Integer.parseInt( request.getParameter("vada"));



Integer total = dosa*10 + idli*20 + vada*30;

String TOTAL = total.toString();

Integer d1= dosa*10;
Integer i1= idli*20;
Integer v1= vada*30;

String D1 = d1.toString();
String I1 = i1.toString();
String V1 = v1.toString();




try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdev", "root", "Shivasql@05");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("update orders set   no_plates='"+dosa+"'  where id=1   ");
           int j=st.executeUpdate("update orders set   no_plates='"+idli+"'    where id=2   ");
           int k=st.executeUpdate("update orders set   no_plates='"+vada+"'    where id=3   ");
        if(i>0){
        session.setAttribute("TOTAL",TOTAL);
        session.setAttribute("D1",D1);
        session.setAttribute("I1",I1);
        session.setAttribute("V1",V1);
        response.sendRedirect("retrieve.jsp");
        }
           else
        out.println("<center><b>Error editing profile. Try Again!</b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e.getMessage());
        e.printStackTrace();
        }
 %>
