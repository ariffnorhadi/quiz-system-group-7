<%-- 
    Document   : view-result
    Created on : May 29, 2020, 11:32:29 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="dao.PerformanceDAO"%>
<%@page import="model.Performance"%>
<%@page import="dao.QuestionDAO"%>
<%@page import="model.Question"%>
<%@page import="java.util.List"%>
<%@page import="model.Lecturer"%>
<%@page import="dao.LecturerDAO"%>
<%@page import="model.Subject"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="model.Quiz"%>
<%@page import="dao.QuizDAO"%>
<%@page import="model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Result(s)</title>
    </head>
    <body class="bg-dark text-white">
        <jsp:include page="../Lecturer/bootstrap.jsp"/>
        <%
            Student student = (Student) request.getSession().getAttribute("student");
//            out.print("Student ID: ");
//            out.print(student.getId());
//            out.print("<br>");

            String sQuiz_id = request.getParameter("quizID");

            int quiz_id = Integer.parseInt(sQuiz_id);

            Quiz quiz = QuizDAO.getRecord(quiz_id);
            Subject subject = SubjectDAO.getRecord(quiz.getSubjectID());
            Lecturer lecturer = LecturerDAO.getRecord(subject.getLectID());

            int totalQuestion = QuizDAO.getNoOfQuestion(quiz_id);

            String choices[] = new String[totalQuestion];

            for (int i = 0; i < choices.length; i++) {
                if (request.getParameter("choice" + i).isEmpty()) {
                    choices[i] = "Not answered";
                } else {
                    choices[i] = request.getParameter("choice" + i);

                }

            }

            String answer[] = new String[totalQuestion];
            System.arraycopy(QuizDAO.answerList(quiz_id), 0, answer, 0, answer.length);
            double marks = 0;
            for (int i = 0; i < answer.length; i++) {
                if (choices[i].equals(answer[i])) {
                    marks++;
                }
            }
//
//            out.print("Quiz ID: " + quiz_id);
//            out.print("<br>");
//            out.print("Total Question: " + totalQuestion);
//            out.print("<br>");
//            int i = 1;
//            out.print("Your Answer:");
//            out.print("<br>");
//            for (String string : choices) {
//
//                out.print(i + ". ");
//                out.print(string);
//                out.print("<br>");
//                i++;
//
//            }

//            int k = 1;
//            out.print("Correct Answer:");
//            out.print("<br>");
//            for (String string : answer) {
//
//                out.print(k + ". ");
//                out.print(string);
//                out.print("<br>");
//                k++;
//
//            }
            double percentage = (marks / totalQuestion) * 100;
            //out.print(percentage);


        %>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navbar.jsp"/>
        <div class='bg-dark' style='border-radius:30px;padding:20px;width:80%;margin:auto;border:1px solid grey;margin-top:10px;margin-bottom:10px;'>
            <center>
                <a class="btn btn-outline-light rounded-pill" href="dashboard.jsp"><span class="material-icons">home</span></a>
                <a class="btn btn-outline-light rounded-pill" href="play-quiz.jsp?id=<%=quiz_id%>"><span class="material-icons">replay</span></a>
                <a class="btn btn-outline-light rounded-pill " href="view-quiz-performance.jsp?id=<%=quiz_id%>"><span class="material-icons">speed</span></a>
                <a onclick="window.print()" class="btn btn-outline-light rounded-pill "><span class="material-icons">save</span></a>
                <br>
            </center>
            <br>
            <h3 style="text-align: center;">
                <%
                    if (marks == totalQuestion) {
                        out.print("Congratulations !");
                    }

                %>
            </h3>
            <h3 style="text-align: center;">Your Result ( <%out.print((int) marks + "/" + totalQuestion);%> )</h3>
            <br>
            <div class="progress">
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: <%=percentage%>%"></div>
                <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" style="width: <%=(100 - percentage)%>%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <table class=" table table-dark text-white table-hover">
                <thead>
                    <tr>
                        <th scope="col">Lecturer</th>
                        <th scope="col">Subject</th>
                        <th scope="col">Category</th>
                        <th style="text-align: center" scope="col">Marks</th>
                        <th style="text-align: center" scope="col">Percentage</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=lecturer.getLectName()%></td>
                        <td><%=subject.getSubjectCode()%>: <%=subject.getSubjectName()%></td>
                        <td><%=quiz.getQuizCategory()%></td>
                        <td style="text-align: center"><%out.print((int) marks + "/" + totalQuestion);%></td>
                        <td style="text-align: center"><%=String.format("%1$,.2f", percentage)%></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <%
                List<Question> questionlist = QuestionDAO.getAllQuestionsAndAnswersbyQuizID(quiz_id);

            %>
            <div class='d-flex justify-content-center flex-wrap'>

                <%                    for (int q = 0; q < questionlist.size(); q++) {


                %>
                <div style='text-align:left; margin: 10px;' class='w-25 bg-dark'>
                    <div style="border-radius: 30px;"  class="card-deck">
                        <div style="border-radius: 30px;border:5px solid"  class="card border-<%= (choices[q].equals(questionlist.get(q).getAnswer()) ? "success" : "danger")%>">
                            <div style="border-radius: 30px;" class="card-body btn-outline-<%= (choices[q].equals(questionlist.get(q).getAnswer()) ? "success" : "danger")%>">
                                <h5 class="card-title text-dark" style="text-align: left;">Question <%=q + 1%></h5>

                                <ul class="list-group">
                                    <li style='color:black ' class="list-group-item list-group-item-primary"><%=questionlist.get(q).getQuestionName()%></li>
                                    <li style='color:black ' class="list-group-item list-group-item-<%= (questionlist.get(q).getAnswer().equals("A") ? "success" : "white")%>">A. <%=questionlist.get(q).getChoiceOne()%> <%= (choices[q].equals("A")) ? "<span class='badge badge-pill badge-secondary'>My answer</span>" : ""%></li>
                                    <li style='color:black ' class="list-group-item list-group-item-<%= (questionlist.get(q).getAnswer().equals("B") ? "success" : "white")%>">B. <%=questionlist.get(q).getChoiceTwo()%> <%= (choices[q].equals("B")) ? "<span class='badge badge-pill badge-secondary'>My answer</span>" : ""%></li>
                                    <li style='color:black ' class="list-group-item list-group-item-<%= (questionlist.get(q).getAnswer().equals("C") ? "success" : "white")%>">C. <%=questionlist.get(q).getChoiceThree()%> <%= (choices[q].equals("C")) ? "<span class='badge badge-pill badge-secondary'>My answer</span>" : ""%></li>
                                    <li style='color:black ' class="list-group-item list-group-item-<%= (questionlist.get(q).getAnswer().equals("D") ? "success" : "white")%>">D. <%=questionlist.get(q).getChoiceFour()%> <%= (choices[q].equals("D")) ? "<span class='badge badge-pill badge-secondary'>My answer</span>" : ""%></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>

                <%

                    }
                %>


            </div>


            <br>
        </div>
        <%
            Performance performance = new Performance(marks, student.getId(), quiz_id, percentage, totalQuestion);
            int result = 0;
            result = PerformanceDAO.add(performance);
            if (result > 0) {
                out.print("<script>");
                out.print("alert(\"Your attempt has been marked\");");
                out.print("</script>");
            }


        %>
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