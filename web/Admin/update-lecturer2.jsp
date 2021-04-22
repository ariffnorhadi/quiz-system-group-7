<%-- 
    Document   : update-lecturer2
    Created on : Apr 25, 2020, 11:04:25 AM
    Author     : farhan
--%>

<%@page import="database.MySQL"%>
<%@page import="model.Lecturer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QMS | Quiz Management System</title>
    </head>
    <body>
        <%
            int lecturerID = Integer.parseInt(request.getParameter("hidid"));
            String lect_id = request.getParameter("lect_id");
            String lect_name = request.getParameter("lect_name");
            String lect_email = request.getParameter("lect_email");
            String lect_password = request.getParameter("lect_password");
            String lect_phone = request.getParameter("lect_phone");
            int lect_faculty = Integer.parseInt(request.getParameter("lect_faculty"));

            //Load the jdbc Driver
            //Class.forName("com.mysql.jdbc.Driver");
            //Establish connection
            //String myUrl = "jdbc:mysql://localhost:3306/cse3999_quiz";
            //Connection myConnection = DriverManager.getConnection(myUrl, "root", "admin");
            Connection connection = MySQL.getConnection();
            String myQuery = "update lecturers "
                    + "set lect_id=?, lect_name=?, lect_email=?, lect_password=?, lect_phone=?, lect_faculty=? "
                    + "where id=?";
            PreparedStatement myPs = connection.prepareStatement(myQuery);
            myPs.setString(1, lect_id);
            myPs.setString(2, lect_name);
            myPs.setString(3, lect_email);
            myPs.setString(4, lect_password);
            myPs.setString(5, lect_phone);
            myPs.setInt(6, lect_faculty);
            myPs.setInt(7, lecturerID);
            Lecturer lecturer = new Lecturer(lecturerID, lect_id, lect_name, lect_email, lect_password, lect_phone, lect_faculty);
            request.getSession().setAttribute("lecturer", lecturer);

            if (myPs.executeUpdate() != 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Update the Record\")");
                out.println("window.location=document.referrer;");
                out.println("</script>");
            }
            connection.close();
        %>
    </body>
</html>
