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

import dao.QuizDAO;
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
public class ProcessPlayedQuiz extends HttpServlet {

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

            Student student = (Student) request.getSession().getAttribute("student");
            out.print("Student ID: ");
            out.print(student.getId());
            out.print("<br>");

            String sQuiz_id = request.getParameter("quizID");

            int quiz_id = Integer.parseInt(sQuiz_id);

            int totalQuestion = QuizDAO.getNoOfQuestion(quiz_id);

            String choice[] = new String[totalQuestion];

            for (int i = 0; i < choice.length; i++) {
                if (request.getParameter("choice" + i).isEmpty()) {
                    choice[i] = "Not answered";
                } else {
                    choice[i] = request.getParameter("choice" + i);

                }

            }

            String answer[] = new String[totalQuestion];
            System.arraycopy(QuizDAO.answerList(quiz_id), 0, answer, 0, answer.length);
            double marks = 0;
            for (int i = 0; i < answer.length; i++) {
                if (choice[i].equals(answer[i])) {
                    marks++;
                }

            }

            out.print("Quiz ID: " + quiz_id);
            out.print("<br>");
            out.print("Total Question: " + totalQuestion);
            out.print("<br>");
            int i = 1;
            out.print("Your Answer:");
            out.print("<br>");
            for (String string : choice) {

                out.print(i + ". ");
                out.print(string);
                out.print("<br>");
                i++;

            }

            int k = 1;
            out.print("Correct Answer:");
            out.print("<br>");
            for (String string : answer) {

                out.print(k + ". ");
                out.print(string);
                out.print("<br>");
                k++;

            }

            out.print("<br>");
            out.print("Your marks:");

            double percentage = (marks / totalQuestion) * 100;
            out.print(percentage);

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
