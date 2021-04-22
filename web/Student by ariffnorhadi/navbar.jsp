<%-- 
Document   : navbar
Created on : May 27, 2020, 9:40:18 PM
Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>
<%@page import="model.Student"%>
<%@page import="dao.StudentDAO"%>
<%@page import="database.MySQL"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<jsp:include page="../Lecturer/bootstrap.jsp"/>
<%

    Student student = (Student) request.getSession().getAttribute("student");
    Statement stmt = MySQL.getConnection().createStatement();

%>
<body class="text-white">
    <div>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark p-4">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="dashboard.jsp" style=";margin-right: 10px" class="nav-link">
                            Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px;margin-right: 10px;cursor: pointer" class="nav-link" data-toggle="modal" data-target="#updateProfile">
                            <%=student.getStudName()%>
                        </a>
                    </li>
                    <li class="nav-item">

                        <a href="process-logout.jsp" class="my-2 my-sm-0 nav-link">Log out</a>

                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="modal fade" id="updateProfile">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title" style="color:#4285F4; font-weight: bold;">
                        &emsp;Profile </h5> 

                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="../ProcessStudent" method="POST">
                        <input type="hidden" name="hidid" value="<%=student.getId()%>">
                        <center>
                            <table style="color: white">
                                <tr>
                                    <td style="width: 200px;">
                                        <label class="text-dark">Name: </label>
                                    </td>
                                    <td><input type="text" name="stud_name" disabled value="<%=student.getStudName()%>" 
                                               class="form-control" style="width: 500px;"></td>
                                </tr>
                                <tr>
                                    <td style="width: 200px;">
                                        <label class="text-dark">Matric No: </label>
                                    </td>
                                    <td><input type="text" name="stud_matrics" disabled value="<%=student.getStudMatric()%>" 
                                               class="form-control" style="width: 500px;"></td>
                                </tr>
                                <tr>
                                    <td style="width: 200px;">
                                        <label class="text-dark">Email: </label>
                                    </td>
                                    <td><input disabled type="text" name="stud_email" value="<%=student.getStudEmail()%>" 
                                               class="form-control" style="width: 500px;"></td>
                                </tr>
                                <tr>
                                    <td style="width: 200px;">
                                        <label class="text-dark">Current Password: </label>
                                    </td>
                                    <td><input type="text" name="currentpass"  
                                               class="form-control" style="width: 500px;"></td>

                                </tr>
                                <tr>
                                    <td style="width: 200px;">
                                        <label class="text-dark">New Password: </label>
                                    </td>
                                    <td><input type="text" name="newpass"
                                               class="form-control" style="width: 500px;"></td>

                                </tr>
                                <tr>
                                    <td style="width: 200px;">
                                        <label class="text-dark">Faculty: </label>
                                    </td>
                                    <td><input type="text" name="stud_faculty" disabled value="<%
                                        String sqlSeletFaculty = "select faculty_name from faculty where faculty_id=" + student.getStudFaculty() + "";
                                        ResultSet rs = stmt.executeQuery(sqlSeletFaculty);
                                        if (rs.next()) {
                                            out.print(rs.getString(1));
                                        }
                                               %>"
                                               class="form-control" style="width:500px;"></td>
                                </tr>
                            </table>
                            <br>
                            <button class="btn btn-danger" type="button" data-dismiss="modal">

                                Cancel
                            </button>
                            <button class="btn btn-primary" type="submit">

                                Save
                            </button>

                        </center>
                    </form>
                </div>

                <!-- Modal footer -->
                <div >
                    <hr>
                    <h6 class="text-muted center" style="text-align: center">
                        You can only update your password here
                        <br>
                        <br>
                    </h6>
                    <!--
                    
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </form>
                    -->
                </div>

            </div>
        </div>
    </div>

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