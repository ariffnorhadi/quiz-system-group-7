<%-- 
    Document   : navbar
    Created on : Apr 29, 2020, 2:20:06 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Lecturer"%>
<jsp:include page="bootstrap.jsp"/>
<%@page import="database.MySQL"%>


<%
    Lecturer lecturer = (Lecturer) request.getSession().getAttribute("lecturer");

%>

<div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark p-4">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="lecturer-dashboard.jsp" style=";margin-right: 10px" class="nav-link">
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a style="margin-left: 10px;margin-right: 10px;cursor: pointer" class="nav-link" data-toggle="modal" data-target="#editProfile">
                        Profile
                    </a>
                </li>
                <li class="nav-item">
                    <a style="margin-left: 10px;margin-right: 10px;cursor: pointer" class="nav-link" data-toggle="modal" data-target="#updatePassword">
                        Password
                    </a>
                </li>
                <li class="nav-item">

                    <a href="process-logout.jsp" class="my-2 my-sm-0 nav-link">Sign out</a>

                </li>
            </ul>
        </div>
    </nav>
</div>

<div class="modal fade" id="editProfile" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Profile</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%                    Statement stmt = MySQL.getConnection().createStatement();
            %>
            <form action="../ProcessProfile">
                <div class="modal-body">


                    <h4><%=lecturer.getLectID()%></h4>
                    <br>
                    <h5><%
                        String sqlSeletFaculty = "select faculty_name from faculty where faculty_id=" + lecturer.getLectFaculty() + "";
                        ResultSet rs = stmt.executeQuery(sqlSeletFaculty);
                        if (rs.next()) {
                            out.print(rs.getString(1));
                        }

                        %>
                    </h5>
                    <br>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
                        </div>
                        <input disabled="" name="lectName" type="text" value="<%=lecturer.getLectName()%>" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
                        </div>
                        <input disabled="" name="lectEmail" type="text" value="<%=lecturer.getLectEmail()%>" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default">Phone</span>
                        </div>
                        <input disabled="" name="lectPhone" type="text" value="<%=lecturer.getLectPhone()%>" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
            <form action="../ProcessProfile">
                <div class="modal-body">

                    <h4><%=lecturer.getLectID()%></h4>
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






<!--
Copyright (C) Ariff Norhadi - All Rights Reserved
You may use, distribute and modify this code under the
terms of the XYZ license, which unfortunately won't be
written for another century.

You should have received a copy of the XYZ license with
this file. If not, please write to: ariffnorhadi@gmail.com ,
or visit https://t.me/ariffnorhadi
-->