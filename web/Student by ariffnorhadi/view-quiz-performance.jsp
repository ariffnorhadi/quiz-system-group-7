<%-- 
    Document   : view-quiz-performance
    Created on : May 29, 2020, 11:15:31 PM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page import="model.Performance"%>
<%@page import="java.util.List"%>
<%@page import="dao.PerformanceDAO"%>
<%@page import="model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

    <%

        String sQuizID = request.getParameter("id");
        int quizID = Integer.parseInt(sQuizID);
        Student student = (Student) request.getSession().getAttribute("student");

        List<Performance> list = PerformanceDAO.getPerformanceforQuizforStudent(quizID, student.getId());

        if (list.size() == 0) {
            out.print("<script>");
            out.print("alert(\"You have no attempt for this quiz.\");");
            out.print("</script>");
        }

        //out.print(list.get(3).getPercentage());

    %>

    <head>
        <jsp:include page="../Lecturer/bootstrap.jsp"/>     
        <script>
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    theme: "dark1",
                    backgroundColor: "#343a40",
                    title: {
                        text: ""
                    },

                    axisX: {
                        title: "Attempt",
                        titleFontSize: 18,
                        titleFontStyle: ""
                    },

                    axisY: {
                        includeZero: false,
                        maximum: 100,
                        gridThickness: 0,
                        title: "Percentage",
                        titleFontSize: 20,
                        titleFontStyle: ""
                    },
                    data: [{
                            type: "line",
                            indexLabelFontSize: 16,
                            lineColor: "#0275d8",
                            dataPoints: [

            <%                int i = 0;

                if (list.size() == 0) {

                } else {
                    while (i < list.size() - 1) {
                        out.print("{");
                        out.print("x:");
                        out.print(i + 1);
                        out.print(",");
                        out.print("y: ");
                        out.print(String.format("%1$,.2f", list.get(i).getPercentage()));
                        out.print("},");
                        i++;
                    }
                    out.print("{");
                    out.print("x:");
                    out.print(i + 1);
                    out.print(",");
                    out.print("y: ");
                    out.print(String.format("%1$,.2f", list.get(i).getPercentage()));
                    out.print("}");
                }


            %>

                            ]
                        }]
                });
                chart.render();
            }
        </script>
    </head>


    <body class="bg-dark">

        <jsp:include page="header.jsp"/>
        <jsp:include page="navbar.jsp"/>
        <div class="d-flex flex-column bd-highlight">
            <a onclick="window.history.back();" style="text-align: center;padding: 10px;" class='bg-dark text-decoration-none text-muted'>Back</a>
        </div>
        <br><br>
        <div class="container">
            <div style="border-radius: 20px;border:2px solid #4169E1;padding: 10px;" class="card bg-dark">
                <div style="background-color: #4169E1" class="card-header">
                    <h5 class="text-center text-white">
                        My Performance
                    </h5>
                </div>
                <div class="card-body bg-dark">

                    <div id="chartContainer" style="height: 370px;" class="container"></div>
                    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

                </div>
                <div class="card-footer bg-dark border-primary">
                    <h4 class="text-center text-white">
                        Total attempt : 
                        <%                            if (list.size() == 0) {
                                out.print(i);
                            } else {
                                out.print(i + 1);
                            }

                        %>

                    </h4>
                </div>
            </div>
        </div>
        <br>
        <p style="text-align: center;color: white">Table: First five attempts with percentage</p>


        <div style="border-radius: 20px;border:2px solid #4169E1;padding: 10px; margin-left: 10%;margin-right: 10%" class="card bg-dark">
            <%                List<Performance> listMarks = PerformanceDAO.getPerformanceforQuizforStudent(quizID, student.getId());
            %>
            <table class="table table-dark table-bordered table-hover">
                <tr>

                    <th style="text-align: center">Attempt</th>
                        <%
                            int b = 0;

                            for (b = 1; b < 6; b++) {
                                out.println("<td style='text-align:center'>");
                                out.println(b);
                                out.println("</td>");
                            }
                        %>
                    <th style="text-align: center">
                        Total attempts
                    </th>
                    <th style="text-align: center">
                        Average score
                    </th>
                </tr>
                <tr>

                    <th style="text-align: center">Percentage</th>
                        <%
                            for (int a = 0; a < listMarks.size() && a < 5; a++) {
                                out.print("<td class='" + ((listMarks.get(a).getPercentage() < 50) ? "text-warning" : "text-success") + "' style='text-align:center'>");
                                out.println(String.format("%1$,.2f", listMarks.get(a).getPercentage()));
                                out.print("</td>");

                            }
                            for (int k = 1; k < (6 - listMarks.size()); k++) {
                                out.println("<td style='text-align:center' class=\"text-warning\">");
                                out.println("No attempt");
                                out.println("</td>");
                            }
                        %>
                    <td style="text-align: center">
                        <%
                            int attempt = 0;
                            while (attempt < listMarks.size()) {
                                attempt++;
                            }
                            out.print(attempt);
                        %>
                    </td>

                    <%
                        double total = 0;
                        double average = 0;
                        for (int t = 0; t < listMarks.size(); t++) {
                            total = total + (listMarks.get(t).getPercentage());

                            average = total / attempt;
                        }
                    %>
                    <td class="<%=((average < 50) ? "text-warning" : "text-success")%>" style="text-align: center">
                        <%
                            if (average == 0) {
                                out.print("Not available");
                            } else {
                                out.print(String.format("%1$,.2f", average));
                            }

                        %>
                    </td>
                </tr>

            </table>

        </div>
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