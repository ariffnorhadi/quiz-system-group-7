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
package studentServlet;

import dao.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Student;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class ProcessStudent extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Student processStudent = (Student) request.getSession().getAttribute("student");
            String option = request.getParameter("operation");
            int id = processStudent.getId();
            String studmatric = processStudent.getStudMatric();
            String inputCurrentPass = request.getParameter("currentpass");
            String newpass = request.getParameter("newpass");
            String studPassword = processStudent.getStudPassword();
            int studFaculty = processStudent.getStudFaculty();

            Student student = new Student(id, studmatric, processStudent.getStudName(), processStudent.getStudEmail(), studPassword, studFaculty);
            int result = 0;

            HttpSession session = request.getSession();

            if (inputCurrentPass.isEmpty() || newpass.isEmpty()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please fill in all details.(by servlet)');");
                out.println("window.location=history.back();");
                out.println("</script>");
            } else if (!inputCurrentPass.equals(student.getStudPassword())) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Current password is incorrect.');");
                out.println("window.location=history.back();");
                out.println("</script>");
            } else {
                String dbPass = newpass;

                Student newStudent = new Student(id, studmatric, processStudent.getStudName(), processStudent.getStudEmail(), dbPass, studFaculty);
                result = StudentDAO.updatePass(newStudent);
                if (result > 0) {
                    session.setAttribute("student", newStudent);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
