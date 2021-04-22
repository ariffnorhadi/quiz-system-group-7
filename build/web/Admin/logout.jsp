<%-- 
    Document   : logout
    Created on : May 4, 2020, 8:13:29 AM
    Author     : farhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    session = request.getSession();
    session.invalidate();
    
    response.sendRedirect("../Lecturer/log-in.jsp");
    

%>
