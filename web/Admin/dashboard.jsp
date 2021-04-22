<%-- 
    Document   : dashboard
    Created on : May 4, 2020, 10:26:04 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="database.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>QMS | Admin | Dashboard</title>
        <jsp:include page="../Lecturer/bootstrap.jsp"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>

    <body class="bg-dark">

        <%

            Admin admin = (Admin) request.getSession().getAttribute("admin");

            Connection myConnection = MySQL.getConnection();
            Statement stmt = myConnection.createStatement();
            List<Lecturer> lectList = LecturerDAO.getAllLect();
            List<Student> stuList = StudentDAO.getAllStudent();


        %>

        <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-sm-3 col-md-2 mr-0 p" href="dashboard.jsp">Quiz Management System</a>
            <input id="myInput" onkeyup="myFunction()" class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
            <a class="pl-3 text-white text-nowrap text-decoration-none" href="dashboard.jsp">Welcome, <%=admin.getAdmin_name()%></a>
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap">
                    <a style="cursor:pointer" class="nav-link" data-toggle="modal" data-target="#editProfile">Profile</a>
                </li>
            </ul>
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap">
                    <a style="cursor:pointer" class="nav-link" data-toggle="modal" data-target="#updatePassword">Password</a>
                </li>
            </ul>
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap">
                    <a class="nav-link" href="logout.jsp">Sign out</a>
                </li>
            </ul>
        </nav>

        <div class="row bg-dark pt-5">
            <div class="col-2">
                <div class="nav flex-column nav-pills btn-secondary" id="v-pills-tab" role="tablist">
                    <a class="nav-link active text-white" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Lecturers</a>
                    <a class="nav-link text-white" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Students</a>
                </div>
            </div>
            <div class="col-10">
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade show active text-white" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">

                        <%

                            out.print(" <table id='myTable' class='table table-hover table-dark'>");
                            out.print("<tr>");
                            out.print("<th style='text-align:center'>No</th>");
                            out.print("<th>ID</th>");
                            out.print("<th>Name</th>");
                            out.print("<th>Email</th>");
                            out.print("<th>Password</th>");
                            out.print("<th>Phone</th>");
                            out.print("<th>Faculty</th>");
                            out.print("<th style='text-align: right'><button class='btn btn-light' data-toggle='modal' data-target='#addLecturer'><span class='material-icons'>add</span></button></th>");
                            out.print("</tr>");
                            for (int i = 0; i < lectList.size(); i++) {
                                out.print("<tr>");
                                out.print("<td style='text-align:center'>" + (i + 1) + "</td>");
                                out.print("<td>" + lectList.get(i).getLectID() + "</td>");
                                out.print("<td>" + lectList.get(i).getLectName() + "</td>");
                                out.print("<td>" + lectList.get(i).getLectEmail() + "</td>");
                                out.print("<td>" + lectList.get(i).getLectPassword() + "</td>");
                                out.print("<td>" + lectList.get(i).getLectPhone() + "</td>");
                                String sqlSeletFaculty = "select faculty_name from faculty where faculty_id=" + lectList.get(i).getLectFaculty();
                                ResultSet rs = stmt.executeQuery(sqlSeletFaculty);
                                if (rs.next()) {
                                    out.print("<td>" + rs.getString(1) + "</td>");
                                }
                                out.print("<td style='text-align:right'>"
                                        + "<button class='btn btn-secondary' data-toggle='modal' data-target='#editLecturer" + lectList.get(i).getId() + "'><span class='material-icons'>create</span></button> "
                                        + "<a class='btn btn-danger' href='delete-lecturer.jsp?id=" + lectList.get(i).getId() + "' onclick=\"return confirm('Are you sure?')\" ><span class='material-icons'>delete</span></a>"
                                        + "</td>");
                                out.print("</tr>");

                                out.print("<div class='modal fade' id='editLecturer" + lectList.get(i).getId() + "' data-backdrop='static' tabindex='-1' role='dialog' aria-labelledby='staticBackdropLabel' aria-hidden='true'><div class='modal-dialog' role='document'>"
                                        + "<div class='modal-content'>"
                                        + "<div class='modal-header'>"
                                        + "<h5 class='modal-title' id='staticBackdropLabel' style='color:black;'>" + lectList.get(i).getLectID() + "</h5>"
                                        + "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                                        + "</div>"
                                        + "<form action='update-lecturer2.jsp'>"
                                        + "<input type='hidden' name='hidid' value='" + lectList.get(i).getId() + "' />"
                                        //modal body
                                        + "<div class='modal-body'>"
                                        + "<h4 style='color:black;'>Update Lecturer</h4>"
                                        + "<br>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Lecturer ID</span>"
                                        + "</div>"
                                        + "<input name='lect_id' type='text' value='" + lectList.get(i).getLectID() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Name</span>"
                                        + "</div>"
                                        + "<input name='lect_name' type='text' value='" + lectList.get(i).getLectName() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Email</span>"
                                        + "</div>"
                                        + "<input name='lect_email' type='text' value='" + lectList.get(i).getLectEmail() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Password</span>"
                                        + "</div>"
                                        + "<input name='lect_password' type='text' value='" + lectList.get(i).getLectPassword() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Phone No</span>"
                                        + "</div>"
                                        + "<input name='lect_phone' type='text' value='" + lectList.get(i).getLectPhone() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Faculty</span>"
                                        + "</div>"
                                        + "<select name='lect_faculty' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>");

                                String myQuery3 = "select * from faculty "
                                        + "where faculty_id=" + lectList.get(i).getLectFaculty();
                                ResultSet myRs3 = stmt.executeQuery(myQuery3);
                                while (myRs3.next()) {
                                    out.println("<option value='" + myRs3.getString(1) + "'>" + myRs3.getString(2) + "</option>");
                                }

                                String myQuery4 = "select * from faculty";
                                ResultSet myRs4 = stmt.executeQuery(myQuery4);
                                while (myRs4.next()) {
                                    out.println("<option value='" + myRs4.getString(1) + "'>" + myRs4.getString(2) + "</option>");
                                }

                                out.print("</select>"
                                        //+ "<input name='lect_faculty' type='text' value='" + myRs.getString(7) + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "</div>"
                                        //end of modal moday
                                        + "<div class='modal-footer'>"
                                        + "<button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>"
                                        + "<button type='submit' value='update' class='btn btn-primary'>Save</button>"
                                        + "</div>"
                                        + "</form>"
                                        + "</div>"
                                        + "</div>"
                                        + "</div>");
                            }
                            out.print("</table>");


                        %>




                    </div>
                    <div class="tab-pane fade text-white" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">

                        <%                            out.print("<table class='table table-hover table-dark'>");
                            out.print("<tr>");
                            out.print("<th style='text-align: center'>No</th>");
                            out.print("<th>Matrics No</th>");
                            out.print("<th>Name</th>");
                            out.print("<th>Email</th>");
                            out.print("<th>Password</th>");
                            out.print("<th>Faculty</th>");
                            out.print("<th style='text-align: right'><button class='btn btn-light' data-toggle='modal' data-target='#addStudent'><span class='material-icons'>add</span></button></th>");
                            out.print("</tr>");
                            for (int i = 0; i < stuList.size(); i++) {
                                out.print("<tr>");
                                out.print("<td style='text-align: center'>" + (i + 1) + "</td>");
                                out.print("<td>" + stuList.get(i).getStudMatric() + "</td>");
                                out.print("<td>" + stuList.get(i).getStudName() + "</td>");
                                out.print("<td>" + stuList.get(i).getStudEmail() + "</td>");
                                out.print("<td>" + stuList.get(i).getStudPassword() + "</td>");
                                String sqlSeletFaculty = "select faculty_name from faculty where faculty_id=" + stuList.get(i).getStudFaculty();
                                ResultSet rs = stmt.executeQuery(sqlSeletFaculty);
                                if (rs.next()) {
                                    out.print("<td>" + rs.getString(1) + "</td>");
                                }
                                out.print("<td style='text-align:right'>");
                                out.print("<button class='btn btn-secondary' data-toggle='modal' data-target='#editStudent" + stuList.get(i).getId() + "'><span class='material-icons'>create</span></button> ");
                                out.print("<a class='btn btn-danger' href='delete-student.jsp?id=" + stuList.get(i).getId() + "' onclick=\"return confirm('Are you sure?')\" ><span class='material-icons'>delete</span></button>");
                                out.print("</td>");
                                out.print("</tr>");

                                out.print("<div class='modal fade' id='editStudent" + stuList.get(i).getId() + "' data-backdrop='static' tabindex='-1' role='dialog' aria-labelledby='staticBackdropLabel' aria-hidden='true'><div class='modal-dialog' role='document'>"
                                        + "<div class='modal-content'>"
                                        + "<div class='modal-header'>"
                                        + "<h5 class='modal-title' id='staticBackdropLabel' style='color:black;'>" + stuList.get(i).getStudMatric() + "</h5>"
                                        + "<button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                                        + "</div>"
                                        + "<form action='update-student2.jsp'>"
                                        + "<input type='hidden' name='hidid' value='" + stuList.get(i).getId() + "' />"
                                        //modal body
                                        + "<div class='modal-body'>"
                                        + "<h4 style='color:black;'>Update Student</h4>"
                                        + "<br>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Matric No</span>"
                                        + "</div>"
                                        + "<input name='stud_matrics' type='text' value='" + stuList.get(i).getStudMatric() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Name</span>"
                                        + "</div>"
                                        + "<input name='stud_name' type='text' value='" + stuList.get(i).getStudName() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Email</span>"
                                        + "</div>"
                                        + "<input name='stud_email' type='text' value='" + stuList.get(i).getStudEmail() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Password</span>"
                                        + "</div>"
                                        + "<input name='stud_password' type='text' value='" + stuList.get(i).getStudPassword() + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "<div class='input-group mb-3'>"
                                        + "<div class='input-group-prepend'>"
                                        + "<span class='input-group-text' id='inputGroup-sizing-default'>Faculty</span>"
                                        + "</div>"
                                        + "<select name='stud_faculty' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>");

                                String myQuery3 = "select * from faculty "
                                        + "where faculty_id=" + stuList.get(i).getStudFaculty();
                                ResultSet myRs3 = stmt.executeQuery(myQuery3);
                                while (myRs3.next()) {
                                    out.println("<option value='" + myRs3.getString(1) + "'>" + myRs3.getString(2) + "</option>");
                                }

                                String myQuery4 = "select * from faculty";
                                ResultSet myRs4 = stmt.executeQuery(myQuery4);
                                while (myRs4.next()) {
                                    out.println("<option value='" + myRs4.getString(1) + "'>" + myRs4.getString(2) + "</option>");
                                }

                                out.print("</select>"
                                        //+ "<input name='stud_faculty' type='text' value='" + myRs.getString(6) + "' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'>"
                                        + "</div>"
                                        + "</div>"
                                        //end of modal moday
                                        + "<div class='modal-footer'>"
                                        + "<button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>"
                                        + "<button type='submit' value='update' class='btn btn-primary'>Save</button>"
                                        + "</div>"
                                        + "</form>"
                                        + "</div>"
                                        + "</div>"
                                        + "</div>");
                            }
                            out.print("</table>");
                        %>




                    </div>
                </div>
            </div>
        </div>

        <!--Modal for Add Lecturer-->
        <div class="modal fade" id="addLecturer" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Add New Lecturer Here</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="process-lecturer.jsp">
                        <div class="modal-body">

                            <h4>Lecturer Information</h4>
                            <br>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Lecturer ID</span>
                                </div>
                                <input name="lect_id" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
                                </div>
                                <input name="lect_name" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
                                </div>
                                <input name="lect_email" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
                                </div>
                                <input name="lect_password" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Phone No</span>
                                </div>
                                <input name="lect_phone" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Faculty</span>
                                </div>
                                <select name="lect_faculty" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                    <%
                                        String myQuery = "select * from faculty";
                                        ResultSet myRs = stmt.executeQuery(myQuery);
                                        out.println("<option>Select Faculty</option>");
                                        while (myRs.next()) {
                                            out.println("<option value=" + myRs.getString(1) + ">" + myRs.getString(2) + "</option>");
                                        }
                                    %>
                                </select>
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

        <!--Modal for Add Student-->
        <div class="modal fade" id="addStudent" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Add New Student Here</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="process-student.jsp">
                        <div class="modal-body">

                            <h4>Student Information</h4>
                            <br>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Matric No</span>
                                </div>
                                <input name="stud_matrics" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
                                </div>
                                <input name="stud_name" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
                                </div>
                                <input name="stud_email" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
                                </div>
                                <input name="stud_password" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Faculty</span>
                                </div>
                                <select name="stud_faculty" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                    <%
                                        String myQuery2 = "select * from faculty";
                                        ResultSet myRs2 = stmt.executeQuery(myQuery2);
                                        out.println("<option>Select Faculty</option>");
                                        while (myRs2.next()) {
                                            out.println("<option value=" + myRs2.getString(1) + ">" + myRs2.getString(2) + "</option>");
                                        }
                                    %>
                                </select>
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

        <!-- For password modal-->
        <div class="modal fade" id="updatePassword" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Password</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="process-profile.jsp">
                        <div class="modal-body">

                            <h4><%=admin.getAdmin_id()%></h4>
                            <br>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Current Password</span>
                                </div>
                                <input name="currentpass" type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">New Password</span>
                                </div>
                                <input name="newpass" type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" name="operation" value="updatePassword" class="btn btn-primary">Save</button>
                        </div>
                    </form>



                </div>
            </div>
        </div>


        <!-- For edit modal-->
        <div class="modal fade" id="editProfile" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">My Profile</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="process-profile.jsp">
                        <div class="modal-body">

                            <h4><%=admin.getAdmin_id()%></h4>
                            <br>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
                                </div>
                                <input disabled="" value="<%=admin.getAdmin_name()%>" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
                                </div>
                                <input disabled="" value="<%=admin.getAdmin_email()%>" type="email" name="email" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Back</button>
                        </div>
                    </form>



                </div>
            </div>
        </div>

        <script>
            function myFunction() {
                // Declare variables
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[2];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
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