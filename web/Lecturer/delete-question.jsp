<%-- 
    Document   : delete-question
    Created on : May 2, 2020, 4:31:38 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Question"%>
<%@page import="dao.QuestionDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Put your title here</title>
        <jsp:include page="bootstrap.jsp"/>
    </head>
    <body class="bg-dark" style="text-align: center;padding-top: 10%">
        <button class="btn btn-warning" type="button" disabled>
            <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
            Processing...
        </button>
        <%
            String sQuestionID = request.getParameter("id");
            int questionID = Integer.parseInt(sQuestionID);
            QuestionDAO qdao = new QuestionDAO();
            Question question = qdao.getRecord(questionID);
            int result = qdao.delete(question);
            if (result > 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("window.location=document.referrer;");
                out.println("</script>");
            } else {
                out.print("Question Name: " + question.getQuestionName());
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Unable to delete. Please try again.');");
                out.println("window.location=document.referrer;");
                out.println("</script>");
            }


        %>
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