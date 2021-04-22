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

import dao.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Lecturer;
import model.Subject;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class ProcessSubject extends HttpServlet {

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
            Lecturer lecturer = (Lecturer) request.getSession().getAttribute("lecturer");

            String option = request.getParameter("operation");
            int result;

            switch (option) {
                case "add":
                    String subjectCode = request.getParameter("subjectCode");
                    String subjectName = request.getParameter("subjectName");
                    if (subjectCode.isEmpty() || subjectName.isEmpty()) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please fill in all details (by servlet)');");
                        out.println("location=history.back(-2);");
                        out.println("</script>");

                    } else {

                        Subject addsubject = new Subject(subjectCode, subjectName, lecturer.getLectFaculty(), lecturer.getId());

                        result = SubjectDAO.add(addsubject);
                        if (result > 0) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("window.location=document.referrer;");
                            out.println("</script>");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Registration Failed. Code may has already been used. Or you may have entered random data. (by servlet)');");
                            out.println("location=history.back(-2)");
                            out.println("</script>");
                        }
                    }

                    break;
                case "update":
                    String sSubjectID = request.getParameter("subjectID");
                    int subjectID = Integer.parseInt(sSubjectID);
                    Subject subject = SubjectDAO.getRecord(subjectID);
                    subjectCode = request.getParameter("subjectCode");
                    subjectName = request.getParameter("subjectName");
                    Subject upSubject = new Subject(subjectID, subjectCode, subjectName, subject.getFacultyID(), subject.getLectID());
                    result = SubjectDAO.update(upSubject);
                    if (result > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("window.location=document.referrer;");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Update Failed. Please try again. (by servlet)');");
                        out.println("window.location=document.referrer;");
                        out.println("</script>");
                    }
                    break;
                case "delete":
                    sSubjectID = request.getParameter("id");
                    subjectID = Integer.parseInt(sSubjectID);
                    subject = SubjectDAO.getRecord(subjectID);
                    result = SubjectDAO.delete(subject);
                    if (result > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("window.location=document.referrer;");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('<button class='btn btn-warning' type='button' disabled><span class='spinner-grow spinner-grow-sm' role='status' aria-hidden='true'></span>Unable to delete. Please try again.</button>');");
                        out.println("window.location=document.referrer;");
                        out.println("</script>");
                    }
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
