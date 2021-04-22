<%-- 
    Document   : process-student
    Created on : May 5, 2020, 1:09:49 AM
    Author     : farhan
--%>

<%@page import="database.MySQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String stud_matrics = request.getParameter("stud_matrics");
            String stud_name = request.getParameter("stud_name");
            String stud_email = request.getParameter("stud_email");
            String stud_password = request.getParameter("stud_password");
            String stud_faculty = request.getParameter("stud_faculty");

            //Load the jdbc Driver
            //Class.forName("com.mysql.jdbc.Driver");
            //Establish connection
            //String myUrl = "jdbc:mysql://localhost:3306/cse3999_quiz";
            //Connection myConnection = DriverManager.getConnection(myUrl, "root", "admin");
            Connection connection = MySQL.getConnection();
            String myQuery = "insert into students "
                    + "(stud_matrics, stud_name, stud_email, stud_password, stud_faculty) "
                    + "values (?, ?, ?, ?, ?)";
            PreparedStatement myPs = connection.prepareStatement(myQuery);
            myPs.setString(1, stud_matrics);
            myPs.setString(2, stud_name);
            myPs.setString(3, stud_email);
            myPs.setString(4, stud_password);
            myPs.setString(5, stud_faculty);

            if (!myPs.execute()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Record is added\")");
                out.println("window.location=document.referrer;");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"ID may have already been taken. Please use another ID.\")");
                out.println("window.location=document.referrer;");
                out.println("</script>");
            }
            connection.close();
        %>
    </body>
</html>
