<%-- 
    Document   : process-questions
    Created on : May 1, 2020, 12:06:02 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Processing Questions . . .</title>
        <jsp:include page="bootstrap.jsp"/>
    </head>
    <body class="bg-dark" style="text-align: center;padding-top: 10%">
        <button class="btn btn-warning" type="button" disabled>
            <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
            Processing . . .
        </button>
        <%

            String option = request.getParameter("operation");
            String sQuizID = request.getParameter("quizID");
            int quizID = Integer.parseInt(sQuizID);
            int result;

            switch (option) {
                case "add":
                    String question = request.getParameter("question");
                    String choiceOne = request.getParameter("choiceOne");
                    String choiceTwo = request.getParameter("choiceTwo");
                    String choiceThree = request.getParameter("choiceThree");
                    String choiceFour = request.getParameter("choiceFour");
                    String answer = request.getParameter("choice");
                    if (question.isEmpty() || choiceOne.isEmpty() || choiceTwo.isEmpty() || choiceThree.isEmpty() || choiceFour.isEmpty() || answer.isEmpty()) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please fill in the form and choose an answer');");
                        out.println("location=history.back(-2);");
                        out.println("</script>");

                    } else {
                        Question questiontobeAdded = new Question(quizID, question, choiceOne, choiceTwo, choiceThree, choiceFour, answer);

                        result = QuestionDAO.add(questiontobeAdded);
                        if (result > 0) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("window.location=document.referrer;");
                            out.println("</script>");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Registration Failed. ');");
                            out.println("location=history.back(-2)");
                            out.println("</script>");
                        }

                    }

                    break;
                case "updateQuestion":
                    String sQuestionID = request.getParameter("questionID");
                    int questionIDup = Integer.parseInt(sQuestionID);
                    Question quiz = QuestionDAO.getRecord(questionIDup);
                    question = request.getParameter("question");
                    choiceOne = request.getParameter("choiceOne");
                    choiceTwo = request.getParameter("choiceTwo");
                    choiceThree = request.getParameter("choiceThree");
                    choiceFour = request.getParameter("choiceFour");
                    answer = request.getParameter("choice");
                    Question upQuestion = new Question(quizID, questionIDup, question, choiceOne, choiceTwo, choiceThree, choiceFour, answer);
                    result = QuestionDAO.update(upQuestion);
                    if (result > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("window.location=document.referrer;");
                        out.println("</script>");
                        //response.sendRedirect("view-quizzes.jsp?id=" + quiz.getQuizID());
                        //response.sendRedirect("view-quizzes.jsp");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Unable to update. Please try again.');");
                        out.println("window.location.reload(history.back());");
                        out.println("</script>");
                    }

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