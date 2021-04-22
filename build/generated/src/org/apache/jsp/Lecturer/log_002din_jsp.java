package org.apache.jsp.Lecturer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class log_002din_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <title>QMS | Log In</title>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "bootstrap.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            html,\n");
      out.write("            body {\n");
      out.write("                height: 100%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            body {\n");
      out.write("                display: -ms-flexbox;\n");
      out.write("                display: flex;\n");
      out.write("                -ms-flex-align: center;\n");
      out.write("                align-items: center;\n");
      out.write("                padding-top: 40px;\n");
      out.write("                padding-bottom: 40px;\n");
      out.write("                background-color: #f5f5f5;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-signin {\n");
      out.write("                width: 100%;\n");
      out.write("                max-width: 420px;\n");
      out.write("                padding: 15px;\n");
      out.write("                margin: auto;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label-group {\n");
      out.write("                position: relative;\n");
      out.write("                margin-bottom: 1rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label-group > input,\n");
      out.write("            .form-label-group > label {\n");
      out.write("                height: 3.125rem;\n");
      out.write("                padding: .75rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label-group > label {\n");
      out.write("                position: absolute;\n");
      out.write("                top: 0;\n");
      out.write("                left: 0;\n");
      out.write("                display: block;\n");
      out.write("                width: 100%;\n");
      out.write("                margin-bottom: 0; /* Override default `<label>` margin */\n");
      out.write("                line-height: 1.5;\n");
      out.write("                color: #495057;\n");
      out.write("                pointer-events: none;\n");
      out.write("                cursor: text; /* Match the input under the label */\n");
      out.write("                border: 1px solid transparent;\n");
      out.write("                border-radius: .25rem;\n");
      out.write("                transition: all .1s ease-in-out;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label-group input::-webkit-input-placeholder {\n");
      out.write("                color: transparent;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label-group input:-ms-input-placeholder {\n");
      out.write("                color: transparent;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label-group input::-ms-input-placeholder {\n");
      out.write("                color: transparent;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label-group input::-moz-placeholder {\n");
      out.write("                color: transparent;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label-group input::placeholder {\n");
      out.write("                color: transparent;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label-group input:not(:placeholder-shown) {\n");
      out.write("                padding-top: 1.25rem;\n");
      out.write("                padding-bottom: .25rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label-group input:not(:placeholder-shown) ~ label {\n");
      out.write("                padding-top: .25rem;\n");
      out.write("                padding-bottom: .25rem;\n");
      out.write("                font-size: 12px;\n");
      out.write("                color: #777;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .bd-placeholder-img {\n");
      out.write("                font-size: 1.125rem;\n");
      out.write("                text-anchor: middle;\n");
      out.write("                -webkit-user-select: none;\n");
      out.write("                -moz-user-select: none;\n");
      out.write("                -ms-user-select: none;\n");
      out.write("                user-select: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media (min-width: 768px) {\n");
      out.write("                .bd-placeholder-img-lg {\n");
      out.write("                    font-size: 3.5rem;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-dark\">\n");
      out.write("        <form action=\"../RegisterAndLogin\" class=\"form-signin\">\n");
      out.write("            <div class=\"text-center mb-4\">\n");
      out.write("                <img class=\"mb-4\" src=\"https://upload.wikimedia.org/wikipedia/commons/3/3e/Logo_Rasmi_UMT.png\" alt=\"\" width=\"140\" height=\"100\">\n");
      out.write("                <h1 class=\"h4 mb-3 font-weight-normal text-white\">Universiti Malaysia Terengganu</h1>\n");
      out.write("                <h1 class=\"h6 mb-3 font-weight-normal text-white\">CSE 3999: Application System Development Project</h1>\n");
      out.write("                <h1 class=\"h6 mb-3 font-weight-normal text-white\">Quiz Management System</h1>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-label-group\">\n");
      out.write("                <input name=\"logID\" type=\"text\" id=\"inputEmail\" class=\"form-control\" placeholder=\"ID\" required autofocus>\n");
      out.write("                <label for=\"inputEmail\">ID</label>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-label-group\">\n");
      out.write("                <input name=\"logPass\" type=\"password\" id=\"inputPassword\" class=\"form-control\" placeholder=\"Password\" required>\n");
      out.write("                <label for=\"inputPassword\">Password</label>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"input-group mb-3\">\n");
      out.write("                <div class=\"input-group-prepend\">\n");
      out.write("                    <label class=\"input-group-text text-dark\" for=\"inputGroupSelect01\">Role</label>\n");
      out.write("                </div>\n");
      out.write("                <select name=\"role\" class=\"custom-select\" id=\"inputGroupSelect01\">\n");
      out.write("                    <option value=\"student\" selected=\"\">Student</option>\n");
      out.write("                    <option value=\"lecturer\">Lecturer</option>\n");
      out.write("                    <option value=\"admin\">Admin</option>\n");
      out.write("                </select>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <button style=\"background-color: #8A2BE2\" class=\"btn btn-lg btn-block text-white\" name=\"operation\" value=\"login\" type=\"submit\">Log in</button>\n");
      out.write("            <p class=\"mt-5 mb-3 text-white text-center\">&copy; 2020</p>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
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
