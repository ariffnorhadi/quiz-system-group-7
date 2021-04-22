/*
 *  HTML is not a programming language
 * 
 *  Ariff Norhadi @ Cucumorsed.Al-Johori at https://t.me/ariffnorhadi
 *  
 Copyright (C) Ariff Norhadi - All Rights Reserved
 You may use, distribute and modify this code under the
 terms of the XYZ license, which unfortunately won't be
 written for another century.
 
 You should have received a copy of the XYZ license with
 this file. If not, please write to: ariffnorhadi@gmail.com ,
 or visit https://t.me/ariffnorhadi
 */
package lecturerServlet;

import database.MySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin;
import model.Lecturer;
import model.Student;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class RegisterAndLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Connection myConnection = MySQL.getConnection();

            String role = request.getParameter("role");
            String logID = request.getParameter("logID");
            String logPass = request.getParameter("logPass");

            switch (role) {
                case "student": {
                    String sqlSelectCust = "select * from students where stud_matrics='" + logID + "' and "
                            + "stud_password='" + logPass + "'";
                    PreparedStatement pstmt = myConnection.prepareStatement(sqlSelectCust);
                    ResultSet rs = pstmt.executeQuery();
                    if (logID.isEmpty() || logPass.isEmpty()) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please fill in all details(by servlet)');");
                        out.println("location=history.back(-2);");
                        out.println("</script>");
                    } else if (rs.next()) {
                        int id = rs.getInt(1);
                        String stud_matrics = rs.getString(2);
                        String stud_name = rs.getString(3);
                        String stud_email = rs.getString(4);
                        String stud_password = rs.getString(5);
                        int stud_faculty = rs.getInt(6);

                        Student student = new Student(id, stud_matrics, stud_name, stud_email, stud_password, stud_faculty);

                        request.getSession().setAttribute("student", student);
                        response.sendRedirect("./Student by ariffnorhadi/dashboard.jsp");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Email or password is incorrect');");
                        out.println("location=history.back(-2);");
                        out.println("</script>");
                    }

                    break;
                }
                case "lecturer":
                    String sqlSelectCust = "select * from lecturers where lect_id=? and "
                            + "lect_password=?";
                    PreparedStatement pstmt = myConnection.prepareStatement(sqlSelectCust);
                    pstmt.setString(1, logID);
                    pstmt.setString(2, logPass);
                    ResultSet rs = pstmt.executeQuery();
                    if (logID.isEmpty() || logPass.isEmpty()) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please fill in all details(by servlet)');");
                        out.println("location=history.back(-2);");
                        out.println("</script>");
                    } else if (rs.next()) {
                        int id = rs.getInt(1);
                        String lectID = rs.getString(2);
                        String lectName = rs.getString(3);
                        String lectEmail = rs.getString(4);
                        String lectPassword = rs.getString(5);
                        String lectPhone = rs.getString(6);
                        int lectFaculty = rs.getInt(7);

                        Lecturer setLecturer = new Lecturer(id, lectID, lectName, lectEmail, lectPassword, lectPhone, lectFaculty);
                        request.getSession().setAttribute("lecturer", setLecturer);
                        response.sendRedirect("./Lecturer/lecturer-dashboard.jsp");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Email or password is incorrect');");
                        out.println("location=history.back(-2);");
                        out.println("</script>");
                    }
                    break;
                case "admin": {
                    String SqlQuery = "select * from admins where admin_id=? and admin_password=?";
                    //
                    PreparedStatement myPs = myConnection.prepareStatement(SqlQuery);
                    myPs.setString(1, logID);
                    myPs.setString(2, logPass);
                    //
                    ResultSet myRs = myPs.executeQuery();
                    //
                    if (logID.isEmpty() || logPass.isEmpty()) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please fill in all details()by servlet');");
                        out.println("location=history.back(-2);");
                        out.println("</script>");
                    } else if (myRs.next()) {
                        int id = myRs.getInt(1);
                        String admin_id = myRs.getString(2);
                        String admin_name = myRs.getString(3);
                        String admin_email = myRs.getString(4);
                        String admin_password = myRs.getString(5);
                        //
                        Admin admin = new Admin(id, admin_id, admin_name, admin_email, admin_password);
                        request.getSession().setAttribute("admin", admin);
                        response.sendRedirect("./Admin/dashboard.jsp");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Id or password is incorrect(by servlet)');");
                        out.println("location=history.back(-2);");
                        out.println("</script>");
                    }
                    break;
                }
                default:
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterAndLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterAndLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
