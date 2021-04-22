<%-- 
    Document   : lecturer-dashboard-main
    Created on : Apr 29, 2020, 11:10:51 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="model.Subject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Lecturer"%>
<%@page import="database.MySQL"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>

<%

    Lecturer lecturer = (Lecturer) request.getSession().getAttribute("lecturer");
    Statement stmt = MySQL.getConnection().createStatement();

%>

<div style="margin-left: 20%" class="bg-dark text-white p-4"><h5>My Subject (s)</h5></div>

<div>
    <%                
        
        String sqlExists = "SELECT COUNT(1) FROM subjects WHERE lect_id=" + lecturer.getId();
        ResultSet rsExist = stmt.executeQuery(sqlExists);
        int record = 0;
        if (rsExist.next()) {
            record = rsExist.getInt(1);
        }

        if (record == 0) {
            out.print("<div style='padding-left:20%' class='alert alert-danger' role='alert'>");
            out.print("You have no registered subject yet ");
            out.print("<button class='btn btn-outline-secondary' data-toggle='modal' data-target='#addSubject'>");
            out.print("Register Now");
            out.print("</button>");
            out.print("</div>");

        } else {
            out.print("<div class='bg-dark' style='border-radius:30px;padding:20px;width:60%;margin:auto;border:1px solid grey;margin-top:10px;margin-bottom:10px;'>");
            out.print("<table class='table table-hover table-dark'>");
            out.print("<thead class='thead-dark' style=''>");
            out.print("<tr>");
            out.print("<th>No</th>");
            out.print("<th>Code</th>");
            out.print("<th>Subject</th>");
            out.print("<th style='text-align:right'><button class='btn btn-outline-light' data-toggle='modal' data-target='#addSubject'>");
            out.print("<span class='material-icons'>add</span>");
            out.print("</button></th>");
            out.print("</tr>");
            out.print("</thead>");
            out.print("<tbody>");

        }

        List<Subject> list = SubjectDAO.getAllbyLectID(lecturer.getId());

        for (int i = 0; i < list.size(); i++) {
            out.print("<tr>");
            out.print("<td style=''>");
            out.print(i + 1);
            out.print("</td>");
            out.print("<td style=''>");
            out.print(list.get(i).getSubjectCode());
            out.print("</td>");
            out.print("<td style=''>");
            out.print(list.get(i).getSubjectName());
            out.print("</td>");
            out.print("<th style='text-align:right'>");
            out.print("<a class='btn btn-outline-info' href=view-quizzes.jsp?id=" + list.get(i).getSubjectID() + "><span class='material-icons'>forward</span ></a> ");
            out.print("<button data-toggle='modal' data-target='#editSubject" + list.get(i).getSubjectID() + "' type='button' class='btn btn-outline-secondary'><span class='material-icons'>create</span ></button> ");
            out.print("<a onclick=\"return confirm('Are you sure?')\" class='btn btn-outline-danger' href=../ProcessSubject?id=" + list.get(i).getSubjectID() + "&operation=delete><span class='material-icons'>remove_circle</span ></a>");
            out.print("</td>");
            out.print("</tr>");

            out.print("<div class='modal fade' id='editSubject" + list.get(i).getSubjectID() + "' data-backdrop='static' tabindex='-1' role='dialog' aria-labelledby='staticBackdropLabel' aria-hidden='true'><div class='modal-dialog' role='document'>"
                    + "<div class='modal-content'>" // start modal content
                    + "<div class='modal-header'>" //start modal header
                    + "<h5 class='modal-title' id='staticBackdropLabel'>" + lecturer.getLectID() + "</h5>"
                    + "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                    + "</div>" //end of modal header
                    + "<form action='../ProcessSubject'>"
                    //modal-body
                    + "<div class='modal-body'>" //open div modal body
                    + "<h4>Subject</h4>"
                    + "<br>"
                    + "<div class='input-group mb-3'>"
                    + "<div class='input-group-prepend'>"
                    + "<span class='input-group-text' id='inputGroup-sizing-default'>Code</span>"
                    + "</div>"
                    + "<input name='subjectCode' type='text' value='" + list.get(i).getSubjectCode() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                    + "</div>"
                    + "<div class='input-group mb-3'>"
                    + "<div class='input-group-prepend'>"
                    + "<span class='input-group-text' id='inputGroup-sizing-default'>Name</span>"
                    + "</div>"
                    + "<input name='subjectName' type='text' value='" + list.get(i).getSubjectName() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                    + "</div>"
                    + "</div>" // close div modal body
                    //end of modal moday
                    + "<div class='modal-footer'>" // start div header
                    + "<input type='hidden' name='subjectID' value='" + list.get(i).getSubjectID() + "' />"
                    + "<button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>"
                    + "<button type='submit' name='operation' value='update' class='btn btn-primary'>Save</button>"
                    + "</div>" // close div modal footer
                    + "</form>"
                    + "</div>" // end of modal content
                    + "</div>" //end ofo modal faade
                    + "</div>");
        }

        out.print("</tbody>");
        out.print("</table>");
        out.print("</div>");
    %>
</div>

<div class="modal fade" id="addSubject" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Subject</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../ProcessSubject">
                <div class="modal-body">

                    <h4>Register Your Subject Here</h4>
                    <br>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default">Code</span>
                        </div>
                        <input name="subjectCode" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
                        </div>
                        <input name="subjectName" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>
                </div>
                <div class="modal-footer">
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