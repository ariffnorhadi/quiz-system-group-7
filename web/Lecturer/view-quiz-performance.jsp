<%-- 
    Document   : view-quiz-performance
    Created on : May 29, 2020, 11:15:31 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="dao.StudentDAO"%>
<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PerformanceDAO"%>
<%@page import="model.Lecturer"%>
<%@page import="model.Performance"%>
<%@page import="java.util.List"%>
<%@page import="dao.PerformanceDAO"%>
<%@page import="model.Performance"%>
<%@page import="dao.PerformanceDAO"%>
<%@page import="model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="database.MySQL"%>

<!DOCTYPE HTML>
<html>
    <head>
        <script>
            window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainer", {
            backgroundColor: "#343a40",
                    animationEnabled: true,
                    theme: "dark2",
                    title: {
                    text: ""
                    },
                    axisX: {
                    minimum: .5,
                            prefix: "",
                            title: "Attempt"
                    },
                    axisY2: {

                            gridDashType: "",
                            gridThickness: 0,
                            title: "Percentage (%)",
                            suffix: ""
                    },
                    toolTip: {
                    shared: true
                    },
                    legend: {
                    cursor: "pointer",
                            verticalAlign: "top",
                            horizontalAlign: "center",
                            dockInsidePlotArea: true,
                            itemclick: toogleDataSeries
                    },
                    data: [
            <%
                String sQuizID = request.getParameter("id");
                int quizID = Integer.parseInt(sQuizID);

                List<Performance> list = PerformanceDAO.getAllStudentbyID(quizID);
                for (int i = 0; i < list.size(); i++) {
                    int studentID = list.get(i).getId();
                    List<Student> lists = StudentDAO.getAllStudentbyID(studentID);
                    for (int z = 0; z < lists.size(); z++) {
            %>
                    {
                    type: "line",
                            axisYType: "secondary",
                            name: "<%=lists.get(z).getStudMatric()%>: <%=lists.get(z).getStudName()%>",
                                                showInLegend: false,
                                                markerSize: 0,
                                                dataPoints:  [           <%
                                                    List<Performance> listMarks = PerformanceDAO.getPerformanceforQuizforStudent(quizID, studentID);
                                                    for (int j = 0; j < listMarks.size(); j++) {

            %>

                                                {
                                                x: <%=j + 1%>,
                                                        y: <%=String.format("%1$,.2f", listMarks.get(j).getPercentage())%>
                                                },
            <%                        }
            %>
                                                ]
                                        },
            <%
                    }
                }

            %>
                                        ]
                                }
                                );
                                chart.render();
                                function toogleDataSeries(e) {
                                if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                                e.dataSeries.visible = false;
                                } else {
                                e.dataSeries.visible = true;
                                }
                                chart.render();
                                }

                                }
        </script>

    </head>
    <body class="bg-dark">
        <jsp:include page="header.jsp"/>
        <jsp:include page="navbar.jsp"/>
        <div class="d-flex flex-column bd-highlight">
            <a onclick="window.history.back();" style="text-align: center;padding: 10px;" class='bg-dark text-decoration-none text-muted'>Back</a>
        </div>
        <div class="container">
            <div style="border-radius: 20px;border:2px solid #4169E1;padding: 10px;" class="card bg-dark">
                <div style="background-color: #4169E1" class="card-header">
                    <h5 class="text-center text-white">
                        Performance
                    </h5>
                </div>
                <div class="card-body bg-dark">
                    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                </div>
            </div>
            <br>
            <h6 class="text-white text-center">
                Table : The percentage for all quizzes for each attempt (Displaying first 5 attempts)
            </h6>
            <br>


            <%//                out.println("<h4 class=\"text-white text-center\">");
//                out.println("Students: ");
//                out.println(list.size());
//                out.println("</h4>");
            %>
        </div>
        <div style="border-radius: 20px;border:2px solid #4169E1;padding: 10px; margin-left: 10%;margin-right: 10%" class="card bg-dark">
            <table class="table table-dark  table-striped  table-bordered table-hover">
                <thead>
                    <tr style="background-color: #4169E1">
                        <th style="text-align: center">No</th>
                        <th style="text-align: center">Matrics No</th>
                        <th scope="col">
                            Name / Percentage (%)
                        </th>
                        <%                            int b = 0;

                            for (b = 1; b < 6; b++) {
                                out.println("<th style='text-align:center'>Attempt ");
                                out.println(b);
                                out.println("</th>");
                            }
                        %>  
                        <th style="text-align: center">
                            Total attempts
                        </th>
                        <th style="text-align: center">
                            Average score
                        </th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        int a = 0;
                        int checker = 0;
                        for (int i = 0; i < list.size(); i++) {
                            int studentID = list.get(i).getId();
                            int attempt = 0;
                            double total = 0;
                            double average = 0;
                            List<Student> lists = StudentDAO.getAllStudentbyID(studentID);
                            for (int z = 0; z < lists.size(); z++) {
                                out.println("<td style='text-align:center'>");
                                out.println(i + 1);
                                out.println("</td>");
                                out.println("<td style='text-align:center'>");
                                out.println(lists.get(z).getStudMatric());
                                out.println("</td>");
                                out.println("<td>");
                                out.println(lists.get(z).getStudName());
                                out.println("</td>");
                                List<Performance> listMarks = PerformanceDAO.getPerformanceforQuizforStudent(quizID, studentID);

                                for (int j = 0; j < listMarks.size() && j < 5; j++) {

                                    out.println("<td class='" + ((listMarks.get(j).getPercentage() < 50) ? "text-warning" : "text-success") + "' style='text-align:center'>");
                                    out.println(String.format("%1$,.2f", listMarks.get(j).getPercentage()));
                                    out.println("</td>");

//                                    out.println("<td>");
//                                    out.println(attempt);
//                                    out.println("</td>");
                                }
                                for (int k = 1; k < (6 - listMarks.size()); k++) {
                                    out.println("<td style='text-align:center' class=\"text-warning\">");
                                    out.println("No attempt");
                                    out.println("</td>");
                                }
                                for (int v = 0; v < listMarks.size(); v++) {
                                    total = total + listMarks.get(v).getPercentage();
                                    attempt++;
                                    average = total / (attempt);
                                }
                                out.print("<td style='text-align:center'>");
                                out.print(attempt);
                                out.print("</td>");
                                out.print("<td class=" + ((average < 50) ? "text-warning" : "text-success") + " style='text-align:center'>");
                                out.print(String.format("%1$,.2f", average));
                                out.print("</td>");
                                a++;
                                out.println("</tr>");

                            }
                        }
                    %>

                </tbody>
            </table>
        </div>

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