<%-- 
    Document   : play-quiz
    Created on : May 28, 2020, 12:33:49 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Question"%>
<%@page import="java.util.List"%>
<%@page import="dao.QuestionDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Subject"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="dao.QuizDAO"%>
<%@page import="model.Quiz"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.MySQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Put your title here</title>
    </head>
    <body class="bg-dark">
        <jsp:include page="../Lecturer/bootstrap.jsp"/>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navbar.jsp"/>

        <%
            String sQuizID = request.getParameter("id");
            int quizID = Integer.parseInt(sQuizID);
            Statement stmt = MySQL.getConnection().createStatement();
            Quiz quiz = QuizDAO.getRecord(quizID);
            Subject subject = SubjectDAO.getRecord(quiz.getSubjectID());


        %>
        <div class="d-flex flex-column bd-highlight">
            <a style="text-align: center;padding: 10px;" class='bg-dark text-decoration-none text-muted' href="view-quizzes.jsp?id=<%=subject.getSubjectID()%>">Back</a>
        </div>
        <div>
            <div style="text-align: center" class="bg-dark p-4 text-white"><%=subject.getSubjectCode()%>: <%=subject.getSubjectName()%></div>
            <div style="text-align: center" class="bg-dark p-4 text-white"><%=quiz.getQuizCategory()%></div>
        </div>
        <form action="../Student by ariffnorhadi/view-result.jsp">
            <%
                String sqlExists = "SELECT COUNT(1) FROM questions WHERE quiz_id=" + quizID;
                ResultSet rsExist = stmt.executeQuery(sqlExists);
                int record = 0;
                if (rsExist.next()) {
                    record = rsExist.getInt(1);
                }

                if (record == 0) {
                    out.print("<div style='text-align: center' class='alert alert-danger' role='alert'>");
                    out.print("No questions available");
                    out.print("</div>");
                    out.print("<br>");

                } else {
                    String sqlCountQues = "select count(1) from questions where quiz_id=" + quizID;
                    ResultSet rs = stmt.executeQuery(sqlCountQues);
                    if (rs.next()) {
                        out.print("<div style='text-align: center' class='alert alert-success' role='alert'>");
                        out.print(rs.getInt(1) + " question (s)");
                        out.print("</div>");
                        out.print("<br>");
                    }

                    List<Question> list = QuestionDAO.getAllQuestionsAndAnswersbyQuizID(quizID);

                    out.print("<div class='d-flex justify-content-center flex-wrap'>");

                    for (int i = 0; i < list.size(); i++) {
                        out.print("<div style='text-align:right' class='w-25 p-5'>");
                        out.print("<div class='btn-group' role='group' aria-label='Basic example'>");

                        out.print("</div>");
                        out.print("<ul style='text-align:left' class='list-group'>");
                        out.print("<li class='list-group-item'>Question " + (i + 1) + "</li>");
                        out.print("<li class='list-group-item list-group-item-primary'>" + list.get(i).getQuestionName() + "</li>");
                        out.print("<li style='display:none' class='list-group-item list-group-item-secondary'><input checked='checked' value='Not answered' type='radio' name='choice" + i + "'></li>");
                        out.print("<li class='list-group-item list-group-item-secondary'><input value='A' type='radio' name='choice" + i + "'> A. " + list.get(i).getChoiceOne() + "</li>");
                        out.print("<li class='list-group-item list-group-item-secondary'><input value='B' type='radio' name='choice" + i + "'> B. " + list.get(i).getChoiceTwo() + "</li>");
                        out.print("<li class='list-group-item list-group-item-secondary'><input value='C' type='radio' name='choice" + i + "'> C. " + list.get(i).getChoiceThree() + "</li>");
                        out.print("<li class='list-group-item list-group-item-secondary'><input value='D' type='radio' name='choice" + i + "'> D. " + list.get(i).getChoiceFour() + "</li>");
                        out.print("</ul>");
                        out.print("</div>");

                    }

                    out.print("</div>");

                }


            %>

            <input type="hidden" value="<%=quizID%>" name="quizID"/>
            <%
                if (record == 0) {

                } else {
                    out.print(" <button onclick=\"return confirm('Are you sure?')\" type='submit' class='btn btn-warning btn-lg btn-block'>Submit Now</button>");
                }
            %>

        </form>
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