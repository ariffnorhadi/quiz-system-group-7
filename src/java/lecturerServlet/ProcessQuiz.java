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

import dao.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Quiz;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class ProcessQuiz extends HttpServlet {

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
            String option = request.getParameter("operation");

            int result;

            switch (option) {
                case "add":
                    String quizCategory = request.getParameter("quizCategory");
                    if (quizCategory.isEmpty()) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Please fill in the form(by servlet)');");
                        out.println("location=history.back(-2);");
                        out.println("</script>");

                    } else {

                        String sSubjectID = request.getParameter("subjectID");
                        int subjectID = Integer.parseInt(sSubjectID);
                        Quiz addquiz = new Quiz(quizCategory, subjectID);

                        result = QuizDAO.add(addquiz);
                        if (result > 0) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("window.location=document.referrer;");
                            out.println("</script>");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Registration Failed. (by servlet) ');");
                            out.println("location=history.back(-2)");
                            out.println("</script>");
                        }
                    }

                    break;
                case "update":
                    String sQuizID = request.getParameter("quizID");
                    int quizIDup = Integer.parseInt(sQuizID);
                    Quiz quiz = QuizDAO.getRecord(quizIDup);
                    quizCategory = request.getParameter("quizCategory");
                    Quiz upQuiz = new Quiz(quizIDup, quizCategory, quiz.getSubjectID());
                    result = QuizDAO.update(upQuiz);
                    if (result > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Update Successful(by servlet)');");
                        out.println("window.location=document.referrer;");
                        out.println("</script>");
                        //response.sendRedirect("view-quizzes.jsp?id=" + quiz.getQuizID());
                        //response.sendRedirect("view-quizzes.jsp");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Unable to update. Please try again.(by servlet)');");
                        out.println("window.location=document.referrer;");
                        out.println("</script>");
                    }
                    break;
                case "delete":
                    sQuizID = request.getParameter("id");
                    int quizID = Integer.parseInt(sQuizID);
                    quiz = QuizDAO.getRecord(quizID);
                    result = QuizDAO.delete(quiz);
                    if (result > 0) {
                        out.println("<script type=\"text/javascript\">");
                        out.println("window.location=document.referrer;");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Unable to delete. Please try again.');");
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
