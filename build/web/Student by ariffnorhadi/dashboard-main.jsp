<%-- 
    Document   : dashboard-main
    Created on : May 27, 2020, 9:13:21 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="model.Subject"%>
<%@page import="dao.SubjectDAO"%>
<%@page import="model.Lecturer"%>
<%@page import="dao.QuizDAO"%>
<%@page import="model.Quiz"%>
<%@page import="model.Student"%>
<%@page import="dao.StudentDAO"%>
<%@page import="database.MySQL"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="dao.LecturerDAO"%>

<jsp:include page="../Lecturer/bootstrap.jsp"/>


<%

    Student student = (Student) request.getSession().getAttribute("student");
    Statement stmt = MySQL.getConnection().createStatement();
    List<Lecturer> lectList = LecturerDAO.getAllLectbyFacID(student.getStudFaculty());
    if (lectList.size() == 0) {

        out.print("<div style='text-align:center' class='alert alert-warning' role='alert'>No quizzes available. PLease ask your lecturer for further information.</div>");

    } else {

        out.print("<div class='bg-dark' style='border-radius:30px;padding:20px;width:60%;margin:auto;border:1px solid grey;margin-top:10px;margin-bottom:10px;'>");

%>

<table class='table table-hover table-dark text-white'>
    <%//        List<Quiz> list = QuizDAO.getAllSubjectsforStudent(student.getStudFaculty());
        //        for (int i = 0; i < list.size(); i++) {
        //
        //            out.print("<tr>");
        //            out.print("<th colspan='4'>");
        //            out.print(list.get(i).getLectName());
        //            out.print("</th>");
        //            out.print("</tr>");
        //            out.print("<tr>");
        //            out.print("<th>");
        //            out.print("No");
        //            out.print("</th>");
        //            out.print("<th>");
        //            out.print("Code");
        //            out.print("</th>");
        //            out.print("<th>");
        //            out.print("Name");
        //            out.print("</th>");
        //            out.print("<th style='text-align:center'>");
        //            out.print("Actions");
        //            out.print("</th>");
        //            out.print("</tr>");
        //            while (i < list.size()) {
        //                out.print("<tr>");
        //                out.print("<td>");
        //                out.print((i + 1));
        //                out.print("</td>");
        //                out.print("<td>");
        //                out.print(list.get(i).getSubjectCode());
        //                out.print("</td>");
        //                out.print("<td>");
        //                out.print(list.get(i).getSubjectName());
        //                out.print("</td>");
        //
        //                out.print("<td style='text-align:center'>");
        //                out.print("<a href=view-quizzes.jsp?id=" + list.get(i).getSubjectID() + " class='btn btn-outline-primary'><span class='material-icons'>forward</span></a> ");
        //                out.print("</td>");
        //                out.print("</tr>");
        //                i++;
        //            }
        //
        //        }

    %>

    <%        for (int i = 0; i < lectList.size(); i++) {
            out.print("<thead>");
            out.print("<tr>");
            out.print("<th colspan='4'>");
            out.print(lectList.get(i).getLectName());
            out.print("</th>");
            out.print("</tr>");
            List<Subject> subjectList = SubjectDAO.getAllbyLectID(lectList.get(i).getId());

            if (subjectList.size() == 0) {
                out.print("<td class='alert alert-secondary' colspan='4'>");
                out.print("Currently not available");
                out.print("</td>");
            } else {
                out.print("<tr>");
                out.print("<th>");
                out.print("No");
                out.print("</th>");
                out.print("<th>");
                out.print("Code");
                out.print("</th>");
                out.print("<th>");
                out.print("Name");
                out.print("</th>");
                out.print("<th style='text-align:center'>");
                out.print("Actions");
                out.print("</th>");
                out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody>");
                for (int j = 0; j < subjectList.size(); j++) {

                    out.print("<tr>");
                    out.print("<td>");
                    out.print((j + 1));
                    out.print("</td>");
                    out.print("<td>");
                    out.print(subjectList.get(j).getSubjectCode());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(subjectList.get(j).getSubjectName());
                    out.print("</td>");

                    out.print("<td style='text-align:center'>");
                    int quizCount = QuizDAO.getNumberofQuiz(subjectList.get(j).getSubjectID());
                    if (quizCount == 0) {
                        out.print("<a href=view-quizzes.jsp?id=" + subjectList.get(j).getSubjectID() + " class='btn btn-light disabled'><span class='material-icons'>grid_off</span></a> ");
                    } else {
                        out.print("<a href=view-quizzes.jsp?id=" + subjectList.get(j).getSubjectID() + " class='btn btn-outline-light'><span class='material-icons'>forward</span></a> ");
                    }

                    out.print("</td>");
                    out.print("</tr>");

                }
            }

            out.print("</tbody>");

        }


    %>
</table>
<%    out.print("</div>");
    }
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