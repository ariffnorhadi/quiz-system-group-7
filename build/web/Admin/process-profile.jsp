<%-- 
    Document   : process-profile
    Created on : May 5, 2020, 7:56:41 AM
    Author     : Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Put your title here</title>
    </head>
    <body class="bg-dark" style="text-align: center;padding-top: 10%">
        <button class="btn btn-warning" type="button" disabled>
            <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
            Processing . . .
        </button>
        <%
            Admin processAdmin = (Admin) request.getSession().getAttribute("admin");
            String option = request.getParameter("operation");
            int id = processAdmin.getId();
            String adminID = processAdmin.getAdmin_id();
            String adminName = processAdmin.getAdmin_name();
            String adminEmail = processAdmin.getAdmin_email();
            String adminPassword = processAdmin.getAdmin_password();

            AdminDAO admindao = new AdminDAO();
            Admin admin = new Admin(id, adminID, adminName, adminEmail, adminPassword);
            int result;

            switch (option) {
//                case "update":
//                    result = admindao.update(admin);
//                    if (result > 0) {
//                        session.setAttribute("admin", admin);
//                        out.println("<script type=\"text/javascript\">");
//                        out.println("alert('Update Successful');");
//                        out.println("window.location=document.referrer;");
//                        out.println("</script>");
//                    } else {
//                        out.println("<script type=\"text/javascript\">");
//                        out.println("alert('Unable to update. Please try again.');");
//                        out.println("location='admin-dashboard.jsp';");
//                        out.println("</script>");
//                    }
//                    break;

                case "updatePassword":

                    String inputCurrentPass = request.getParameter("currentpass");
                    String newpass = request.getParameter("newpass");

                    if (inputCurrentPass.isEmpty() || newpass.isEmpty()) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please fill in all details.');");
                        out.println("window.location=history.back();");
                        out.println("</script>");
                    } else if (!inputCurrentPass.equals(admin.getAdmin_password())) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Current password is incorrect.');");
                        out.println("window.location=history.back();");
                        out.println("</script>");
                    } else {
                        String dbPass = admin.getAdmin_password();
                        dbPass = newpass;

                        Admin newadmin = new Admin(processAdmin.getId(), processAdmin.getAdmin_id(), processAdmin.getAdmin_name(), processAdmin.getAdmin_email(), dbPass);
                        result = admindao.updatePass(newadmin);
                        if (result > 0) {
                            session.setAttribute("admin", newadmin);
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Password changed');");
                            out.println("window.location=document.referrer;");
                            out.println("</script>");

                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Unable to update. Please try again.');");
                            out.println("window.location=document.referrer;");
                            out.println("</script>");
                        }

                    }

            }


        %>
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