<%-- 
    Document   : allowuser
    Created on : 18 Sep, 2020, 3:41:28 PM
    Author     : atikr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.* " %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website?serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "root");
        Statement st =  (Statement) con.createStatement();
        String allow = request.getParameter("allow");
        if(allow.equals("Delete"))
        {
            String id = request.getParameter("allow_checking");
            st.executeUpdate("delete from feedback where feed_id="+id);
            response.sendRedirect("admin.jsp"); 
        }
        else if(allow.equals("Allow"))
        {
          String id = request.getParameter("allow_checking");
          int temp = 1;
          String sql = "Update feedback set active = "+temp+" where feed_id ="+id ;
          
            st.executeUpdate(sql);
         response.sendRedirect("admin.jsp");
                }
            }
                    catch(Exception e)
        {
        out.println("error("+e+")");
        }

   %>
    </body>
</html>
