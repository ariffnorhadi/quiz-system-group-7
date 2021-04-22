<%-- 
    Document   : delete-lecturer
    Created on : May 5, 2020, 12:41:08 AM
    Author     : farhan
--%>

<%@page import="database.MySQL"%>
<%@page import="model.Lecturer"%>
<%@page import="dao.LecturerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting Lecturer...</title>
    </head>
    <body class="bg-dark">
        <%
            int lecturerID = Integer.parseInt(request.getParameter("id"));

            //Load the jdbc Driver
            //Class.forName("com.mysql.jdbc.Driver");
            //Establish connection
            //String myUrl = "jdbc:mysql://localhost:3306/cse3999_quiz";
            //Connection myConnection = DriverManager.getConnection(myUrl, "root", "admin");
            Connection connection = MySQL.getConnection();
            String myQuery = "delete from lecturers where id=?";
            PreparedStatement myPs = connection.prepareStatement(myQuery);
            myPs.setInt(1, lecturerID);
            //
            if (myPs.executeUpdate() != 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Record is deleted\")");
                out.println("window.location=document.referrer;");
                out.println("</script>");
            }
            connection.close();
        %>
    </body>
</html>
