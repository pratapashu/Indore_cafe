<%-- 
    Document   : logout
    Created on : 18 Sep, 2020, 6:19:26 PM
    Author     : atikr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.removeAttribute("username");
        session.removeAttribute("email");
        response.sendRedirect("index.jsp");
        %>
    </body>
</html>
