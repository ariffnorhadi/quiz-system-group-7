<%-- 
    Document   : lecturer - dashboard
    Created on : Apr 23, 2020, 7:31:59 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="model.Subject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Lecturer"%>
<%@page import="database.MySQL"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="model.Subject"%>
<%@page import="dao.SubjectDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QMS | Lecturer - Dashboard</title>
        <jsp:include page="bootstrap.jsp"/>
    </head>
    <body class="bg-dark">
        <%

            Lecturer lecturer = (Lecturer) request.getSession().getAttribute("lecturer");

        %>
        <div class="d-flex flex-column bd-highlight" >
            <jsp:include page="header.jsp"/>
            <jsp:include page="navbar.jsp"/>
            <a style="text-align: center;padding: 10px;" class='bg-dark text-decoration-none text-white' href="lecturer-dashboard.jsp">Welcome, <%=lecturer.getLectName()%></a>
            <jsp:include page="lecturer-dashboard-main.jsp"/>

        </div>
        <script>
            window.location.hash = "no-back-button";
            window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
            window.onhashchange = function () {
                window.location.hash = "no-back-button";
            }
           
        </script>


    </body>
</html>

<!--
 Copyright (C) Ariff Norhadi - All Rights Reserved
 You may use, distribute and modify this code under the
 terms of the XYZ license, which unfortunately won't be
 written for another century.
 
 You should have received a copy of the XYZ license with
 this file. If not, please write to: ariffnorhadi@gmail.com ,
 or visit https://t.me/ariffnorhadi
-->