package org.apache.jsp.Student_0020by_0020ariffnorhadi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.PerformanceDAO;
import model.Performance;
import dao.QuestionDAO;
import model.Question;
import java.util.List;
import model.Lecturer;
import dao.LecturerDAO;
import model.Subject;
import dao.SubjectDAO;
import model.Quiz;
import dao.QuizDAO;
import model.Student;

public final class view_002dresult_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>My Result(s)</title>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-dark text-white\">\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Lecturer/bootstrap.jsp", out, false);
      out.write("\n");
      out.write("        ");

            Student student = (Student) request.getSession().getAttribute("student");
//            out.print("Student ID: ");
//            out.print(student.getId());
//            out.print("<br>");

            String sQuiz_id = request.getParameter("quizID");

            int quiz_id = Integer.parseInt(sQuiz_id);

            Quiz quiz = QuizDAO.getRecord(quiz_id);
            Subject subject = SubjectDAO.getRecord(quiz.getSubjectID());
            Lecturer lecturer = LecturerDAO.getRecord(subject.getLectID());

            int totalQuestion = QuizDAO.getNoOfQuestion(quiz_id);

            String choices[] = new String[totalQuestion];

            for (int i = 0; i < choices.length; i++) {
                if (request.getParameter("choice" + i).isEmpty()) {
                    choices[i] = "Not answered";
                } else {
                    choices[i] = request.getParameter("choice" + i);

                }

            }

            String answer[] = new String[totalQuestion];
            System.arraycopy(QuizDAO.answerList(quiz_id), 0, answer, 0, answer.length);
            double marks = 0;
            for (int i = 0; i < answer.length; i++) {
                if (choices[i].equals(answer[i])) {
                    marks++;
                }
            }
//
//            out.print("Quiz ID: " + quiz_id);
//            out.print("<br>");
//            out.print("Total Question: " + totalQuestion);
//            out.print("<br>");
//            int i = 1;
//            out.print("Your Answer:");
//            out.print("<br>");
//            for (String string : choices) {
//
//                out.print(i + ". ");
//                out.print(string);
//                out.print("<br>");
//                i++;
//
//            }

//            int k = 1;
//            out.print("Correct Answer:");
//            out.print("<br>");
//            for (String string : answer) {
//
//                out.print(k + ". ");
//                out.print(string);
//                out.print("<br>");
//                k++;
//
//            }
            double percentage = (marks / totalQuestion) * 100;
            //out.print(percentage);


        
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write("\n");
      out.write("        <div class='bg-dark' style='border-radius:30px;padding:20px;width:80%;margin:auto;border:1px solid grey;margin-top:10px;margin-bottom:10px;'>\n");
      out.write("            <center>\n");
      out.write("                <a class=\"btn btn-outline-light rounded-pill\" href=\"dashboard.jsp\"><span class=\"material-icons\">home</span></a>\n");
      out.write("                <a class=\"btn btn-outline-light rounded-pill\" href=\"play-quiz.jsp?id=");
      out.print(quiz_id);
      out.write("\"><span class=\"material-icons\">replay</span></a>\n");
      out.write("                <a class=\"btn btn-outline-light rounded-pill \" href=\"view-quiz-performance.jsp?id=");
      out.print(quiz_id);
      out.write("\"><span class=\"material-icons\">speed</span></a>\n");
      out.write("                <a onclick=\"window.print()\" class=\"btn btn-outline-light rounded-pill \"><span class=\"material-icons\">save</span></a>\n");
      out.write("                <br>\n");
      out.write("            </center>\n");
      out.write("            <br>\n");
      out.write("            <h3 style=\"text-align: center;\">\n");
      out.write("                ");

                    if (marks == totalQuestion) {
                        out.print("Congratulations !");
                    }

                
      out.write("\n");
      out.write("            </h3>\n");
      out.write("            <h3 style=\"text-align: center;\">Your Result ( ");
out.print((int) marks + "/" + totalQuestion);
      out.write(" )</h3>\n");
      out.write("            <br>\n");
      out.write("            <div class=\"progress\">\n");
      out.write("                <div class=\"progress-bar progress-bar-striped progress-bar-animated bg-success\" role=\"progressbar\" aria-valuenow=\"75\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: ");
      out.print(percentage);
      out.write("%\"></div>\n");
      out.write("                <div class=\"progress-bar progress-bar-striped progress-bar-animated bg-danger\" role=\"progressbar\" style=\"width: ");
      out.print((100 - percentage));
      out.write("%\" aria-valuenow=\"20\" aria-valuemin=\"0\" aria-valuemax=\"100\"></div>\n");
      out.write("            </div>\n");
      out.write("            <table class=\" table table-dark text-white table-hover\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th scope=\"col\">Lecturer</th>\n");
      out.write("                        <th scope=\"col\">Subject</th>\n");
      out.write("                        <th scope=\"col\">Category</th>\n");
      out.write("                        <th style=\"text-align: center\" scope=\"col\">Marks</th>\n");
      out.write("                        <th style=\"text-align: center\" scope=\"col\">Percentage</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print(lecturer.getLectName());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(subject.getSubjectCode());
      out.write(':');
      out.write(' ');
      out.print(subject.getSubjectName());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(quiz.getQuizCategory());
      out.write("</td>\n");
      out.write("                        <td style=\"text-align: center\">");
out.print((int) marks + "/" + totalQuestion);
      out.write("</td>\n");
      out.write("                        <td style=\"text-align: center\">");
      out.print(String.format("%1$,.2f", percentage));
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("            <br>\n");
      out.write("            ");

                List<Question> questionlist = QuestionDAO.getAllQuestionsAndAnswersbyQuizID(quiz_id);

            
      out.write("\n");
      out.write("            <div class='d-flex justify-content-center flex-wrap'>\n");
      out.write("\n");
      out.write("                ");
                    for (int q = 0; q < questionlist.size(); q++) {


                
      out.write("\n");
      out.write("                <div style='text-align:left; margin: 10px;' class='w-25 bg-dark'>\n");
      out.write("                    <div style=\"border-radius: 30px;\"  class=\"card-deck\">\n");
      out.write("                        <div style=\"border-radius: 30px;border:5px solid\"  class=\"card border-");
      out.print( (choices[q].equals(questionlist.get(q).getAnswer()) ? "success" : "danger"));
      out.write("\">\n");
      out.write("                            <div style=\"border-radius: 30px;\" class=\"card-body btn-outline-");
      out.print( (choices[q].equals(questionlist.get(q).getAnswer()) ? "success" : "danger"));
      out.write("\">\n");
      out.write("                                <h5 class=\"card-title text-dark\" style=\"text-align: left;\">Question ");
      out.print(q + 1);
      out.write("</h5>\n");
      out.write("\n");
      out.write("                                <ul class=\"list-group\">\n");
      out.write("                                    <li style='color:black ' class=\"list-group-item list-group-item-primary\">");
      out.print(questionlist.get(q).getQuestionName());
      out.write("</li>\n");
      out.write("                                    <li style='color:black ' class=\"list-group-item list-group-item-");
      out.print( (questionlist.get(q).getAnswer().equals("A") ? "success" : "white"));
      out.write("\">A. ");
      out.print(questionlist.get(q).getChoiceOne());
      out.write(' ');
      out.print( (choices[q].equals("A")) ? "<span class='badge badge-pill badge-secondary'>My answer</span>" : "");
      out.write("</li>\n");
      out.write("                                    <li style='color:black ' class=\"list-group-item list-group-item-");
      out.print( (questionlist.get(q).getAnswer().equals("B") ? "success" : "white"));
      out.write("\">B. ");
      out.print(questionlist.get(q).getChoiceTwo());
      out.write(' ');
      out.print( (choices[q].equals("B")) ? "<span class='badge badge-pill badge-secondary'>My answer</span>" : "");
      out.write("</li>\n");
      out.write("                                    <li style='color:black ' class=\"list-group-item list-group-item-");
      out.print( (questionlist.get(q).getAnswer().equals("C") ? "success" : "white"));
      out.write("\">C. ");
      out.print(questionlist.get(q).getChoiceThree());
      out.write(' ');
      out.print( (choices[q].equals("C")) ? "<span class='badge badge-pill badge-secondary'>My answer</span>" : "");
      out.write("</li>\n");
      out.write("                                    <li style='color:black ' class=\"list-group-item list-group-item-");
      out.print( (questionlist.get(q).getAnswer().equals("D") ? "success" : "white"));
      out.write("\">D. ");
      out.print(questionlist.get(q).getChoiceFour());
      out.write(' ');
      out.print( (choices[q].equals("D")) ? "<span class='badge badge-pill badge-secondary'>My answer</span>" : "");
      out.write("</li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                ");


                    }
                
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <br>\n");
      out.write("        </div>\n");
      out.write("        ");

            Performance performance = new Performance(marks, student.getId(), quiz_id, percentage, totalQuestion);
            int result = 0;
            result = PerformanceDAO.add(performance);
            if (result > 0) {
                out.print("<script>");
                out.print("alert(\"Your attempt has been marked\");");
                out.print("</script>");
            }


        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            window.location.hash = \"no-back-button\";\n");
      out.write("            window.location.hash = \"Again-No-back-button\";//again because google chrome don't insert first hash into history\n");
      out.write("            window.onhashchange = function () {\n");
      out.write("                window.location.hash = \"no-back-button\";\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!--\n");
      out.write(" Copyright (C) Ariff Norhadi - All Rights Reserved\n");
      out.write(" You may use, distribute and modify this code under the\n");
      out.write(" terms of the XYZ license, which unfortunately won't be\n");
      out.write(" written for another century.\n");
      out.write(" \n");
      out.write(" You should have received a copy of the XYZ license with\n");
      out.write(" this file. If not, please write to: ariffnorhadi@gmail.com ,\n");
      out.write(" or visit https://t.me/ariffnorhadi\n");
      out.write("-->");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
