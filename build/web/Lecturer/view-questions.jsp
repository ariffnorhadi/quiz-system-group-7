<%-- 
    Document   : view-questions
    Created on : Apr 29, 2020, 11:50:41 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="database.MySQL"%>
<%@page import="model.Question"%>
<%@page import="dao.QuestionDAO"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QMS | View Questions</title>
        <jsp:include page="bootstrap.jsp"/>

    </head>
    <%

        String sQuizID = request.getParameter("id");
        int quizID = Integer.parseInt(sQuizID);
        Statement stmt = MySQL.getConnection().createStatement();
        Quiz quiz = QuizDAO.getRecord(quizID);
        Subject subject = SubjectDAO.getRecord(quiz.getSubjectID());

    %>
    <body class="bg-dark" style="padding-bottom: 10%">
        <div class="d-flex flex-column bd-highlight justify-content-center flex-wrap">
            <jsp:include page="header.jsp"/>
            <jsp:include page="navbar.jsp"/>

            <a style="text-align: center;padding: 10px;" class='bg-dark text-decoration-none text-muted' href="view-quizzes.jsp?id=<%=subject.getSubjectID()%>">Back</a>

            <div>
                <div style="text-align: center" class="bg-dark p-4 text-white"><%=subject.getSubjectCode()%>: <%=subject.getSubjectName()%></div>
                <div style="text-align: center" class="bg-dark p-4 text-white"><%=quiz.getQuizCategory()%></div>
            </div>

            <%
                String sqlExists = "SELECT COUNT(1) FROM questions WHERE quiz_id=" + quizID;
                ResultSet rsExist = stmt.executeQuery(sqlExists);
                int record = 0;
                if (rsExist.next()) {
                    record = rsExist.getInt(1);
                }

                if (record == 0) {
                    out.print("<div style='text-align: center' class='alert alert-danger' role='alert'>");
                    out.print("You have no question yet");
                    out.print("</div>");
                    out.print("<br>");

                    out.print("<div class='d-flex justify-content-center flex-wrap'>");
                    out.print("<div style='text-align:right' class='w-25 p-3'>");
                    out.print("<form action='process-questions.jsp'><input type='hidden' name='quizID' value='" + quizID + "' />");
                    out.print("<ul style='padding: 0' class='list-group'>");
                    out.print("<li style='text-align: right;padding:0' class='list-group-item bg-dark'><div class='btn-group' role='group' aria-label='Basic example'><button type='button' class='btn btn-outline-info'><span class='material-icons' >info</span></button><button type='submit' name='operation' value='add' class='btn btn-outline-success'><span class='material-icons' >add</span></button></div> </li>");
                    out.print("<li style='text-align:left' class='list-group-item list-group-item-action list-group-item-dark'>My First Question . . .</li>");
                    out.print("<li style='padding:1%' class='list-group-item list-group-item-action list-group-item-dark'> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'>Question</span></div><input placeholder='Type here...' name='question' type='text' aria-label='First name' class='form-control'></div></li>");
                    out.print("<li style='padding:1%' class='list-group-item list-group-item-action list-group-item-dark'> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input checked='' type='radio' name='choice' value='A'></span><span class='input-group-text'>A</span></div><input placeholder='Choice One...' name='choiceOne' type='text' aria-label='First name' class='form-control'></div></li>");
                    out.print("<li style='padding:1%' class='list-group-item list-group-item-action list-group-item-dark'> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input type='radio' name='choice' value='B'></span><span class='input-group-text'>B</span></div><input placeholder='Choice Two...' name='choiceTwo' type='text' aria-label='First name' class='form-control'></div></li>");
                    out.print("<li style='padding:1%' class='list-group-item list-group-item-action list-group-item-dark'> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input type='radio' name='choice' value='C'></span><span class='input-group-text'>C</span></div><input placeholder='Choice Three...' name='choiceThree' type='text' aria-label='First name' class='form-control'></div></li>");
                    out.print("<li style='padding:1%' class='list-group-item list-group-item-action list-group-item-dark pb-2'> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input type='radio' name='choice' value='D'></span><span class='input-group-text'>D</span></div><input placeholder='Choice Four..' name='choiceFour' type='text' aria-label='First name' class='form-control'></div></li>");
                    out.print("</ul>");
                    out.print("</form>");
                    out.print("</div>");
                    out.print("</div>");

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
                        out.print("<div style='text-align:right' class='w-25 p-3'>");
                        out.print("<div class='btn-group' role='group' aria-label='Basic example'>");
                        out.print("<button data-toggle='modal' data-target='#editQuestion" + list.get(i).getQuestionID() + "' type='button' class='btn btn-outline-secondary'><span class='material-icons'>create</span ></button>");
                        out.print("<a href='delete-question.jsp?id=" + list.get(i).getQuestionID() + "' onclick=\"return confirm('Are you sure want to delete this question?')\" class='btn btn-outline-danger text-danger'><span class='material-icons'>clear</span ></a>");
                        out.print("</div>");
                        out.print("<ul style='text-align:left' class='list-group'>");
                        out.print("<li class='list-group-item'>Question " + (i + 1) + "</li>");
                        out.print("<li class='list-group-item list-group-item-primary'>" + list.get(i).getQuestionName() + "</li>");
                        out.print("<li class='list-group-item list-group-item-" + ((list.get(i).getAnswer().equalsIgnoreCase("A")) ? "success" : "danger") + "'>A. " + list.get(i).getChoiceOne() + "</li>");
                        out.print("<li class='list-group-item list-group-item-" + ((list.get(i).getAnswer().equalsIgnoreCase("B")) ? "success" : "danger") + "'>B. " + list.get(i).getChoiceTwo() + "</li>");
                        out.print("<li class='list-group-item list-group-item-" + ((list.get(i).getAnswer().equalsIgnoreCase("C")) ? "success" : "danger") + "'>C. " + list.get(i).getChoiceThree() + "</li>");
                        out.print("<li class='list-group-item list-group-item-" + ((list.get(i).getAnswer().equalsIgnoreCase("D")) ? "success" : "danger") + "'>D. " + list.get(i).getChoiceFour() + "</li>");
                        out.print("</ul>");
                        out.print("</div>");

                        out.print("<div class='modal fade' id='editQuestion" + list.get(i).getQuestionID() + "' data-backdrop='static' tabindex='-1' role='dialog' aria-labelledby='staticBackdropLabel' aria-hidden='true'><div class='modal-dialog' role='document'>"
                                + "<div class='modal-content'>"
                                + "<div class='modal-header'>"
                                + "<h5 class='modal-title' id='staticBackdropLabel'>Question</h5>"
                                + "<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                                + "<span aria-hidden='true'>&times;</span>"
                                + "</button>"
                                + "</div>"
                                + "<form action='process-questions.jsp'>"
                                + "<div class='modal-body'>"
                                + "<div style='' class='input-group mb-3'>"
                                + "<div class='input-group-prepend'>"
                                + "<span class='input-group-text' id='basic-addon1'>Question</span>"
                                + "</div>"
                                + "<input autofocus='' name='question' type='text' value='" + list.get(i).getQuestionName() + "' class='form-control' placeholder='Type here...' aria-label='Question' aria-describedby='basic-addon1'><div class='input-group mt-2'>"
                                + "<div class='input-group-prepend'>"
                                + "<span class='input-group-text'>"
                                + "<input " + ((list.get(i).getAnswer().equalsIgnoreCase("A")) ? "checked" : "") + " value='A' name='choice' type='radio' aria-label='Radio button for following text input'></span>"
                                + "<span class='input-group-text'>A</span>"
                                + "</div>"
                                + "<input name='choiceOne' value='" + list.get(i).getChoiceOne() + "' type='text' class='form-control' aria-label='choices' placeholder='Choice one..' ></div>"
                                + "<div class='input-group mt-2'>"
                                + "<div class='input-group-prepend'>"
                                + "<span class='input-group-text'>"
                                + "<input " + ((list.get(i).getAnswer().equalsIgnoreCase("B")) ? "checked" : "") + " value='B' name='choice' type='radio' aria-label='Radio button for following text input'>"
                                + "</span>"
                                + "<span class='input-group-text'>B</span>"
                                + "</div>"
                                + "<input name='choiceTwo' value='" + list.get(i).getChoiceTwo() + "' type='text' class='form-control' aria-label='choices' placeholder='Choice two..' >"
                                + "</div>"
                                + "<div class='input-group mt-2'><div class='input-group-prepend'><span class='input-group-text'>"
                                + "<input " + ((list.get(i).getAnswer().equalsIgnoreCase("C")) ? "checked" : "") + " value='C' name='choice' type='radio' aria-label='Radio button for following text input'>"
                                + "</span>"
                                + "<span class='input-group-text'>C</span>"
                                + "</div>"
                                + "<input name='choiceThree' value='" + list.get(i).getChoiceThree() + "' type='text' class='form-control' aria-label='choices' placeholder='Choice three..' >"
                                + "</div>"
                                + "<div class='input-group mt-2 mb-2'>"
                                + "<div class='input-group-prepend'><span class='input-group-text'>"
                                + "<input " + ((list.get(i).getAnswer().equalsIgnoreCase("D")) ? "checked" : "") + " value='D' name='choice' type='radio' aria-label='Radio button for following text input'>"
                                + "</span>"
                                + "<span class='input-group-text'>D</span>"
                                + "</div>"
                                + "<input name='choiceFour' value='" + list.get(i).getChoiceFour() + "' type='text' class='form-control' aria-label='choices' placeholder='Choice four..' >"
                                + "</div>"
                                + "<div style='text-align:right;width:100%' class='modal-footer'>"
                                + "<input type='hidden' name='quizID' value='" + list.get(i).getQuizID() + "'/>"
                                + "<input type='hidden' name='questionID' value='" + list.get(i).getQuestionID() + "'/>"
                                + "<button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>"
                                + "<button type='submit' name='operation' value='updateQuestion' class='btn btn-primary'>Save</button>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</form>"
                                + "</div>"
                                + "</div>"
                                + "</div>");

                    }
                    out.print("<div style='text-align:right' class='w-25 p-3'>");
                    out.print("<form action='process-questions.jsp'><input type='hidden' name='quizID' value='" + quizID + "' />");
                    out.print("<ul style='padding: 0' class='list-group'>");
                    out.print("<li style='text-align: right;padding:0' class='list-group-item bg-dark'><div class='btn-group' role='group' aria-label='Basic example'><button type='button' class='btn btn-outline-info'><span class='material-icons' >help</span></button><button type='submit' name='operation' value='add' class='btn btn-outline-success'><span class='material-icons' >add</span></button></div> </li>");
                    out.print("<li style='text-align:left' class='list-group-item list-group-item-action list-group-item-dark'>Next Question . . .</li>");
                    out.print("<li style='padding:1%' class='list-group-item list-group-item-action list-group-item-dark'> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'>Question</span></div><input placeholder='Type here...' name='question' type='text' aria-label='First name' class='form-control'></div></li>");
                    out.print("<li style='padding:1%' class='list-group-item list-group-item-action list-group-item-dark'> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input checked='' type='radio' name='choice' value='A'></span><span class='input-group-text'>A</span></div><input placeholder='Choice One...' name='choiceOne' type='text' aria-label='First name' class='form-control'></div></li>");
                    out.print("<li style='padding:1%' class='list-group-item list-group-item-action list-group-item-dark'> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input type='radio' name='choice' value='B'></span><span class='input-group-text'>B</span></div><input placeholder='Choice Two...' name='choiceTwo' type='text' aria-label='First name' class='form-control'></div></li>");
                    out.print("<li style='padding:1%' class='list-group-item list-group-item-action list-group-item-dark'> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input type='radio' name='choice' value='C'></span><span class='input-group-text'>C</span></div><input placeholder='Choice Three...' name='choiceThree' type='text' aria-label='First name' class='form-control'></div></li>");
                    out.print("<li style='padding:1%' class='list-group-item list-group-item-action list-group-item-dark pb-2'> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input type='radio' name='choice' value='D'></span><span class='input-group-text'>D</span></div><input placeholder='Choice Four..' name='choiceFour' type='text' aria-label='First name' class='form-control'></div></li>");
                    out.print("</ul>");
                    out.print("</form>");
                    out.print("</div>");

                    out.print("</div>");

                }


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