<%-- 
    Document   : jumbotron
    Created on : Apr 30, 2020, 12:48:29 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>
<%@page import="model.Lecturer"%>
<%
    Lecturer lecturer = (Lecturer) request.getSession().getAttribute("lecturer");

%>

<div style="margin-bottom: 0;" class="p-5 bg-dark text-white">
    <h1 class="display-6">Hi, <%=lecturer.getLectName() %>!</h1>
   <!-- <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
    <hr class="my-4">
    <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
    <a target="_blank" class="btn btn-dark btn-lg" href="https://www.undp.org/content/undp/en/home/sustainable-development-goals/goal-4-quality-education.html" role="button">I want to contribute to the world</a>-->
</div>

<!--
 Copyright (C) Ariff Norhadi - All Rights Reserved
 You may use, distribute and modify this code under the
 terms of the XYZ license, which unfortunately won't be
 written for another century.
 
 You should have received a copy of the XYZ license with
 this file. If not, please write to: ariffnorhadi@gmail.com ,
 or visit https://t.me/ariffnorhadi
-->