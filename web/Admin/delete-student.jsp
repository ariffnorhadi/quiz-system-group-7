<%-- 
    Document   : delete-student
    Created on : Apr 25, 2020, 1:20:54 PM
    Author     : farhan
--%>

<%@page import="database.MySQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Quiz Management</title>
    </head>
    <body class="bg-dark">
        <%
            int studentId = Integer.parseInt(request.getParameter("id"));

            //Load the jdbc Driver
            //Class.forName("com.mysql.jdbc.Driver");
            //Establish connection
            //String myUrl = "jdbc:mysql://localhost:3306/cse3999_quiz";
            //Connection myConnection = DriverManager.getConnection(myUrl, "root", "admin");
            Connection connection = MySQL.getConnection();
            String myQuery = "delete from students where id=?";
            PreparedStatement myPs = connection.prepareStatement(myQuery);
            myPs.setInt(1, studentId);

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
