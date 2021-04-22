<%-- 
    Document   : view-quizzes
    Created on : May 28, 2020, 11:15:28 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="database.MySQL"%>
<%@page import="java.util.*"%>
<jsp:include page="../Lecturer/bootstrap.jsp"/>
<jsp:include page="header.jsp"/>
<body class="bg-dark">
    <jsp:include page="navbar.jsp"/>
    <div class="d-flex flex-column bd-highlight">
        <a style="text-align: center;padding: 10px;" class='bg-dark text-decoration-none text-muted' href="dashboard.jsp">Back</a>
    </div>

    <div>

        <%
            String sSubjectID = request.getParameter("id");
            int subjectID = Integer.parseInt(sSubjectID);
            Subject subject = SubjectDAO.getRecord(subjectID);

            Statement stmt = MySQL.getConnection().createStatement();

            String sqlExist = "select count(1) from quizzes where subject_id=" + subjectID;
            ResultSet rsExist = stmt.executeQuery(sqlExist);

            int record = 0;
            if (rsExist.next()) {
                record = rsExist.getInt(1);
            }

            if (record == 0) {
                out.print("<div style='' class='bg-dark text-white p-4'><h5 style='padding-left:20%'>" + subject.getSubjectCode() + ": " + subject.getSubjectName() + "</h5></div>");
                out.print("<div style='padding-left:20%' class='alert alert-danger' role='alert'>");
                out.print("No quizzes available ");
                out.print("</button>");
                out.print("</div>");
            } else {
                out.print("<div class='bg-dark text-white p-4'><h5 style='padding-left:20%'>" + subject.getSubjectCode() + ": " + subject.getSubjectName() + "<h5></div>");
                out.print("<div class='bg-dark' style='border-radius:30px;padding:20px;width:60%;margin:auto;border:1px solid grey;margin-top:10px;margin-bottom:10px;'>");
                out.print("<table class='table table-hover table-dark'>");
                out.print("<thead class='thead-dark' style=''>");
                out.print("<tr>");
                out.print("<th>No</th>");
                out.print("<th>Category</th>");
                out.print("<th style='text-align:center'>Questions</th>");
                out.print("<th style='text-align:center'>");
                out.print("Actions");
                out.print("</th>");
                out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody>");
            }

            List<Quiz> list = QuizDAO.getAllbySubjectID(subjectID);

            for (int i = 0; i < list.size(); i++) {
                out.print("<tr>");
                out.print("<td>");
                out.print(i + 1);
                out.print("</td>");
                out.print("<td>");
                out.print(list.get(i).getQuizCategory());
                out.print("</td>");
                out.print("<td style='text-align:center'>");
                int quesCount = QuizDAO.getNoOfQuestion(list.get(i).getQuizID());
                out.print(quesCount);
                out.print("</td>");
                out.print("<td style='text-align:center'>");
                if (quesCount == 0) {

                    out.print("<a class='btn btn-success disabled' href=play-quiz.jsp?id=" + list.get(i).getQuizID() + "><span class='material-icons'>play_circle_outline</span ></a> ");
                    out.print("<a href=view-quiz-performance.jsp?id=" + list.get(i).getQuizID() + " class='btn btn-light disabled'><span class='material-icons'>speed</span ></a> ");

                } else {

                    out.print("<a class='btn btn-outline-success' href=play-quiz.jsp?id=" + list.get(i).getQuizID() + "><span class='material-icons'>play_circle_outline</span ></a> ");
                    out.print("<a href=view-quiz-performance.jsp?id=" + list.get(i).getQuizID() + " class='btn btn-outline-light'><span class='material-icons'>speed</span ></a> ");
                }

                out.print("</td>");
                out.print("</tr>");

            }

            out.print("</tbody>");
            out.print("</table>");
            out.print("</div>");


        %> 
    </div>  
    <script>
        window.location.hash = "no-back-button";
        window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
        window.onhashchange = function () {
            window.location.hash = "no-back-button";
        }
    </script>
</body> 

<!--
 Copyright (C) Ariff Norhadi - All Rights Reserved
 You may use, distribute and modify this code under the
 terms of the XYZ license, which unfortunately won't be
 written for another century.
 
 You should have received a copy of the XYZ license with
 this file. If not, please write to: ariffnorhadi@gmail.com ,
 or visit https://t.me/ariffnorhadi
-->