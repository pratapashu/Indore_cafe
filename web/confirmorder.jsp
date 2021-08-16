<%-- 
    Document   : confirmorder
    Created on : 18 Sep, 2020, 7:19:40 PM
    Author     : atikr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Placed</title>
    </head>
    <body style="background-color: #f7f7f7;">
        <%
        
         try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");
        Statement st =  (Statement) con.createStatement();
         String name = (String)session.getAttribute("username");
        String email = (String)session.getAttribute("email");
        if(name == null && email == null)
            {
            response.sendRedirect("login.jsp");
            }
        
        if(request.getParameter("confirmOrder")!=null)
        {
            String amount = request.getParameter("amount");
        String sql = "insert into cart(username,email,amount) values('"+name+"','"+email+"',"+amount+")";        
        st.executeUpdate(sql);
        response.sendRedirect("confirmorder.jsp");
        }
        }
catch(Exception e)
        {
        out.println("error("+e+")");
        }


%>        
        <h1><center>Order has been placed Click Me and go to the Home</center></h1>
        <span><center><a href="index.jsp"><img src="images/confirmOrder.gif" alt=""></a></center></span>
    </body>
</html>
