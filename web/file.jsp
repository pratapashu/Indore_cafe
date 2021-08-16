<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%  
MultipartRequest m = new MultipartRequest(request, "C:/Users/atikr/Documents/NetBeansProjects/cafeWebsite/web/images/"); 
response.sendRedirect("admin.jsp");
%>