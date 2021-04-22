<%-- 
    Document   : update-student2
    Created on : Apr 25, 2020, 1:05:18 PM
    Author     : farhan
--%>

<%@page import="database.MySQL"%>
<%@page import="model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Quiz Management</title>
    </head>
    <body>
        <%
            int studentId = Integer.parseInt(request.getParameter("hidid"));
            String stud_matrics = request.getParameter("stud_matrics");
            String stud_name = request.getParameter("stud_name");
            String stud_email = request.getParameter("stud_email");
            String stud_password = request.getParameter("stud_password");
            int stud_faculty = Integer.parseInt(request.getParameter("stud_faculty"));

            //Load the jdbc Driver
            //Class.forName("com.mysql.jdbc.Driver");
            //Establish connection
            //String myUrl = "jdbc:mysql://localhost:3306/cse3999_quiz";
            //Connection myConnection = DriverManager.getConnection(myUrl, "root", "admin");
            Connection connection = MySQL.getConnection();
            String myQuery = "update students "
                    + "set stud_matrics=?, stud_name=?, stud_email=?, stud_password=?, stud_faculty=? "
                    + "where id=?";
            PreparedStatement myPs = connection.prepareStatement(myQuery);
            myPs.setString(1, stud_matrics);
            myPs.setString(2, stud_name);
            myPs.setString(3, stud_email);
            myPs.setString(4, stud_password);
            myPs.setInt(5, stud_faculty);
            myPs.setInt(6, studentId);
            Student student = new Student(studentId, stud_matrics, stud_name, stud_email, stud_password, stud_faculty);
            request.getSession().setAttribute("student", student);

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
