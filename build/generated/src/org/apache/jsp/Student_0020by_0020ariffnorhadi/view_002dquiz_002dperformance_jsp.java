package org.apache.jsp.Student_0020by_0020ariffnorhadi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Performance;
import java.util.List;
import dao.PerformanceDAO;
import model.Student;

public final class view_002dquiz_002dperformance_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("    ");


        String sQuizID = request.getParameter("id");
        int quizID = Integer.parseInt(sQuizID);
        Student student = (Student) request.getSession().getAttribute("student");

        List<Performance> list = PerformanceDAO.getPerformanceforQuizforStudent(quizID, student.getId());

       // for (int i = 0; i < list.size(); i++) {


    
      out.write("\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <script>\n");
      out.write("            window.onload = function () {\n");
      out.write("\n");
      out.write("                var chart = new CanvasJS.Chart(\"chartContainer\", {\n");
      out.write("                    animationEnabled: true,\n");
      out.write("                    theme: \"light2\",\n");
      out.write("                    title: {\n");
      out.write("                        text: \"My Performance\"\n");
      out.write("                    },\n");
      out.write("                    axisY: {\n");
      out.write("                        includeZero: false\n");
      out.write("                    },\n");
      out.write("                    data: [{\n");
      out.write("                            type: \"line\",\n");
      out.write("                            indexLabelFontSize: 16,\n");
      out.write("                            dataPoints: [{\n");
      out.write("                                    y: 450\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 414\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 520,\n");
      out.write("                                    indexLabel: \"\\u2191 highest\",\n");
      out.write("                                    markerColor: \"red\",\n");
      out.write("                                    markerType: \"triangle\"\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 460\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 450\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 500\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 480\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 480\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 410,\n");
      out.write("                                    indexLabel: \"\\u2193 lowest\",\n");
      out.write("                                    markerColor: \"DarkSlateGrey\",\n");
      out.write("                                    markerType: \"cross\"\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 500\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 480\n");
      out.write("                                },\n");
      out.write("                                {\n");
      out.write("                                    y: 510\n");
      out.write("                                }\n");
      out.write("                            ]\n");
      out.write("                        }]\n");
      out.write("                });\n");
      out.write("                chart.render();\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    ");
     //   }
    
      out.write("\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div id=\"chartContainer\" style=\"height: 370px; width: 100%;\"></div>\n");
      out.write("        <script src=\"https://canvasjs.com/assets/script/canvasjs.min.js\"></script>\n");
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
