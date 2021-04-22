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

import dao.LecturerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Lecturer;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class ProcessProfile extends HttpServlet {

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
            Lecturer processLecturer = (Lecturer) request.getSession().getAttribute("lecturer");
            String option = request.getParameter("operation");
            int id = processLecturer.getId();
            String lectID = processLecturer.getLectID();
            String lectName = request.getParameter("lectName");
            String lectEmail = request.getParameter("lectEmail");
            String lectPhone = request.getParameter("lectPhone");
            String lectPassword = processLecturer.getLectPassword();
            int lectFaculty = processLecturer.getId();

            Lecturer lecturer = new Lecturer(id, lectID, lectName, lectEmail, lectPassword, lectPhone, lectFaculty);
            int result;

            HttpSession session = request.getSession();

            switch (option) {
                case "update":
                    result = LecturerDAO.update(lecturer);
                    if (result > 0) {
                        session.setAttribute("lecturer", lecturer);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Update Successful (by servlet)');");
                        out.println("window.location=document.referrer;");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Unable to update. Please try again.');");
                        out.println("location=history.back(-2)");
                        out.println("</script>");
                    }
                    break;

                case "updatePassword":

                    String inputCurrentPass = request.getParameter("currentpass");
                    String newpass = request.getParameter("newpass");

                    if (inputCurrentPass.isEmpty() || newpass.isEmpty()) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please fill in all details.(by servlet)');");
                        out.println("window.location=history.back();");
                        out.println("</script>");
                    } else if (!inputCurrentPass.equals(lecturer.getLectPassword())) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Current password is incorrect.');");
                        out.println("window.location=history.back();");
                        out.println("</script>");
                    } else {
                        String dbPass = newpass;

                        Lecturer newlecturer = new Lecturer(processLecturer.getId(), processLecturer.getLectID(), processLecturer.getLectName(), processLecturer.getLectEmail(), dbPass, processLecturer.getLectPhone(), processLecturer.getLectFaculty());
                        result = LecturerDAO.updatePass(newlecturer);
                        if (result > 0) {
                            session.setAttribute("lecturer", newlecturer);
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
