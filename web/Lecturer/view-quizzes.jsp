<%-- 
    Document   : view-quizzes
    Created on : Apr 28, 2020, 10:23:19 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="database.MySQL"%>
<%@page import="model.Subject"%>
<%@page import="dao.SubjectDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QMS | View Quiz(s)</title>
        <jsp:include page="bootstrap.jsp"/>
        <link rel="stylesheet" href="extra.css"/>
    </head>
    <body class="bg-dark" style="">


        <div class="d-flex flex-column bd-highlight">
            <jsp:include page="header.jsp"/>
            <jsp:include page="navbar.jsp"/>
            <a style="text-align: center;padding: 10px;" class='bg-dark text-decoration-none text-muted' href="lecturer-dashboard.jsp">Back</a>
            <jsp:include page="view-quizzes-main.jsp"/>
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