<%-- 
    Document   : view-quizzes-main
    Created on : Apr 30, 2020, 11:07:49 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="database.MySQL"%>
<%@page import="java.util.*"%>
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
            out.print("You have no quiz yet for this subject ");
            out.print("<button class='btn btn-outline-secondary' data-toggle='modal' data-target='#addQuiz'>");
            out.print("Register Now");
            out.print("</button>");
            out.print("</div>");
        } else {
            out.print("<div class='bg-dark text-white p-4'><h5 style='padding-left:20%'>" + subject.getSubjectCode() + ": " + subject.getSubjectName() + "<h5></div>");
            out.print("<div class='bg-dark' style='border-radius:30px;padding:20px;width:60%;margin:auto;border:1px solid grey;margin-top:10px;margin-bottom:10px;'>");
            out.print("<table class='table table-hover table-dark'>");
            out.print("<thead class='thead-dark' style=''>");
            out.print("<tr>");
            out.print("<th>No</th>");
            //out.print("<th>Quiz ID</th>");
            out.print("<th>Quiz Category</th>");
            out.print("<th style='text-align:center'>Questions</th>");
            out.print("<th style='text-align:right'>Performance</th>");
            out.print("<th style='text-align:right'><button class='btn btn-outline-light' data-toggle='modal' data-target='#addQuiz'>");
            out.print("<span class='material-icons'>add</span >");
            out.print("</button></th>");
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
            //out.print("<td>");
            //out.print(rs.getInt(1));
            //out.print("</td>");
            out.print("<td>");
            out.print(list.get(i).getQuizCategory());
            out.print("</td>");
            out.print("<td style='text-align:center'>");
            int quesCount = QuizDAO.getNoOfQuestion(list.get(i).getQuizID());
            out.print(quesCount);
            out.print("</td>");
            out.print("<td style='text-align:right'>");
            out.print("<a class='btn btn-outline-light' href=view-quiz-performance.jsp?id=" + list.get(i).getQuizID() + "><span class='material-icons'>speed</span ></a>");
            out.print("</td>");
            out.print("<td style='text-align:right'>");
            out.print("<a class='btn btn-outline-info' href=view-questions.jsp?id=" + list.get(i).getQuizID() + "><span class='material-icons'>forward</span ></a> ");
            out.print("<button data-toggle='modal' data-target='#editQuiz" + list.get(i).getQuizID() + "' type='button' class='btn btn-outline-secondary'><span class='material-icons'>create</span ></button> ");
            out.print("<a onclick=\"return confirm('Are you sure?')\" class='btn btn-outline-danger' href=../ProcessQuiz?id=" + list.get(i).getQuizID() + "&operation=delete><span class='material-icons'>remove_circle</span ></a>");
            out.print("</td>");
            out.print("</tr>");

            out.print("<div class='modal fade' id='editQuiz" + list.get(i).getQuizID() + "' data-backdrop='static' tabindex='-1' role='dialog' aria-labelledby='staticBackdropLabel' aria-hidden='true'>"
                    + "<div class='modal-dialog' role='document'>"
                    + "<div class='modal-content'>"
                    + "<div class='modal-header'>"
                    + "<h5 class='modal-title' id='staticBackdropLabel'>Quiz</h5>"
                    + "<button type='button' class='close' data-dismiss='modal' aria-label='Close'>"
                    + "<span aria-hidden='true'>&times;</span>"
                    + "</button></div><form action='../ProcessQuiz'>"
                    + "<div class='modal-body'>"
                    + "<h4>" + subject.getSubjectCode() + "<br> " + subject.getSubjectName() + "</h4><br>"
                    + "<div class='input-group mb-3'>"
                    + "<div class='input-group-prepend'>"
                    + "<span class='input-group-text' id='inputGroup-sizing-default'>Quiz Category</span>"
                    + "</div>"
                    + "<input name='quizCategory' type='text' value='" + list.get(i).getQuizCategory() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                    + "</div>"
                    + "</div>"
                    + "<div class='modal-footer'><input type='hidden' name='subjectID' value='" + subjectID + "' />"
                    + "<input type='hidden' name='quizID' value='" + list.get(i).getQuizID() + "' />"
                    + "<button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>"
                    + "<button type='submit' name='operation' value='update' class='btn btn-primary'>Save</button></div></form></div></div></div>");
        }

        out.print("</tbody>");
        out.print("</table>");
        out.print("</div>");


    %> 
</div>   
<div class="modal fade" id="addQuiz" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Quiz</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../ProcessQuiz">
                <div class="modal-body">

                    <h4>Add collection to your subject</h4>
                    <h6>Register here</h6>
                    <br>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
                        </div>
                        <input placeholder="Place your quiz title here." name="quizCategory" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" name="subjectID" value="<%=subject.getSubjectID()%>"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" name="operation" value="add" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
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