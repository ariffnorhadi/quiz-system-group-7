package org.apache.jsp.Student_0020by_0020ariffnorhadi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.QuizDAO;
import model.Quiz;
import model.Student;
import dao.StudentDAO;
import database.MySQL;
import java.sql.*;
import java.util.*;

public final class dashboard_002dmain_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../Lecturer/bootstrap.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("\n");


    Student student = (Student) request.getSession().getAttribute("student");
    Statement stmt = MySQL.getConnection().createStatement();
    out.print("<div class='bg-dark' style='border-radius:30px;padding:20px;width:60%;margin:auto;border:1px solid grey;margin-top:10px;margin-bottom:10px;'>");


      out.write("\n");
      out.write("\n");
      out.write("<table class='table table-hover table-dark text-white'>\n");
      out.write("    ");
    List<Quiz> list = QuizDAO.getAllSubjectsforStudent(student.getStudFaculty());
        for (int i = 0; i < list.size(); i++) {

            out.print("<tr>");
            out.print("<th colspan='3'>");
            out.print(list.get(i).getLectName());
            out.print("</th>");
            out.print("</tr>");
            out.print("<tr>");
            out.print("<th>");
            out.print("No");
            out.print("</th>");
            out.print("<th>");
            out.print("Code");
            out.print("</th>");
            out.print("<th>");
            out.print("Name");
            out.print("</th>");
            out.print("<th style='text-align:center'>");
            out.print("Actions");
            out.print("</th>");
            out.print("</tr>");
            while (i < list.size()) {
                out.print("<tr>");
                out.print("<td>");
                out.print((i + 1));
                out.print("</td>");
                out.print("<td>");
                out.print(list.get(i).getSubjectCode());
                out.print("</td>");
                out.print("<td>");
                out.print(list.get(i).getSubjectName());
                out.print("</td>");

                out.print("<td style='text-align:center'>");
                out.print("<button type='button' class='btn btn-outline-success'><span class='material-icons'>play_circle_filled</span></button> ");
                out.print("<button type='button' class='btn btn-outline-warning'><span class='material-icons'>speed</span></button>");
                out.print("</td>");
                out.print("</tr>");
                i++;
            }

        }


    
      out.write("\n");
      out.write("</table>\n");
    out.print("</div>");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--\n");
      out.write("Copyright (C) Ariff Norhadi - All Rights Reserved\n");
      out.write("You may use, distribute and modify this code under the\n");
      out.write("terms of the XYZ license, which unfortunately won't be\n");
      out.write("written for another century.\n");
      out.write("\n");
      out.write("You should have received a copy of the XYZ license with\n");
      out.write("this file. If not, please write to: ariffnorhadi@gmail.com ,\n");
      out.write("or visit https://t.me/ariffnorhadi\n");
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
