<%-- 
    Document   : process-logout
    Created on : May 27, 2020, 9:57:55 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>


<%

    session = request.getSession();
    session.invalidate();

    response.sendRedirect("../Lecturer/log-in.jsp");


%>


<!--
 Copyright (C) Ariff Norhadi - All Rights Reserved
 You may use, distribute and modify this code under the
 terms of the XYZ license, which unfortunately won't be
 written for another century.
 
 You should have received a copy of the XYZ license with
 this file. If not, please write to: ariffnorhadi@gmail.com ,
 or visit https://t.me/ariffnorhadi
-->