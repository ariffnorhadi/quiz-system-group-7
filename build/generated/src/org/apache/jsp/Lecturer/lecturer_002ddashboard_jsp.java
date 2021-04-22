package org.apache.jsp.Lecturer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Subject;
import model.Lecturer;
import database.MySQL;
import java.sql.*;
import java.util.*;
import model.Subject;
import dao.SubjectDAO;

public final class lecturer_002ddashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>QMS | Lecturer - Dashboard</title>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "bootstrap.jsp", out, false);
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-dark\">\n");
      out.write("        ");


            Lecturer lecturer = (Lecturer) request.getSession().getAttribute("lecturer");

        
      out.write("\n");
      out.write("        <div class=\"d-flex flex-column bd-highlight\" >\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp", out, false);
      out.write("\n");
      out.write("            <a style=\"text-align: center;padding: 10px;\" class='bg-dark text-decoration-none text-white' href=\"lecturer-dashboard.jsp\">Welcome, ");
      out.print(lecturer.getLectName());
      out.write("</a>\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "lecturer-dashboard-main.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("//            window.location.hash = \"no-back-button\";\n");
      out.write("//            window.location.hash = \"Again-No-back-button\";//again because google chrome don't insert first hash into history\n");
      out.write("//            window.onhashchange = function () {\n");
      out.write("//                window.location.hash = \"no-back-button\";\n");
      out.write("//            }\n");
      out.write("            window.onload = function () {\n");
      out.write("                var i = 0;\n");
      out.write("                var previous_hash = window.location.hash;\n");
      out.write("                var x = setInterval(function () {\n");
      out.write("                    i++;\n");
      out.write("                    window.location.hash = \"/noop/\" + i;\n");
      out.write("                    if (i == 10) {\n");
      out.write("                        clearInterval(x);\n");
      out.write("                        window.location.hash = previous_hash;\n");
      out.write("                    }\n");
      out.write("                }, 10);\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
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
