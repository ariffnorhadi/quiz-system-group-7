package org.apache.jsp.Lecturer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class experiment_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "bootstrap.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<div class='modal fade' id='editQuestion' data-backdrop='static' tabindex='-1' role='dialog' aria-labelledby='staticBackdropLabel' aria-hidden='true'><div class='modal-dialog' role='document'><div class='modal-content'><div class='modal-header'><h5 class='modal-title' id='staticBackdropLabel'>Question</h5><button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><form action='process-profile.jsp'><div class='modal-body'><h4>Testing</h4><br><div style='width: 30%' class='input-group mb-3'><div class='input-group-prepend'><span class='input-group-text' id='basic-addon1'>Question</span></div><input autofocus='' name='question' type='text' class='form-control' placeholder='Type here...' aria-label='Question' aria-describedby='basic-addon1'><div class='input-group mt-2'><div class='input-group-prepend'><span class='input-group-text'> <input checked='' value='A' name='choice' type='radio' aria-label='Radio button for following text input'></span><span class='input-group-text'>A</span></div><input name='choiceOne' type='text' class='form-control' aria-label='choices' placeholder='Choice one..' ></div><div class='input-group mt-2'><div class='input-group-prepend'><span class='input-group-text'> <input value='B' name='choice' type='radio' aria-label='Radio button for following text input'></span><span class='input-group-text'>B</span></div><input name='choiceTwo' type='text' class='form-control' aria-label='choices' placeholder='Choice two..' ></div><div class='input-group mt-2'><div class='input-group-prepend'><span class='input-group-text'> <input value='C' name='choice' type='radio' aria-label='Radio button for following text input'></span><span class='input-group-text'>C</span></div><input name='choiceThree' type='text' class='form-control' aria-label='choices' placeholder='Choice three..' ></div><div class='input-group mt-2 mb-2'><div class='input-group-prepend'><span class='input-group-text'> <input value='D' name='choice' type='radio' aria-label='Radio button for following text input'></span><span class='input-group-text'>D</span></div><input name='choiceFour' type='text' class='form-control' aria-label='choices' placeholder='Choice four..' ></div><div class='input-group'><input type='hidden' name='quizID'/><button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button><button type='submit' name='operation' value='updateQuestion' class='btn btn-primary'>Save</button></div></div></div></form></div></div></div>\n");
      out.write("\n");
      out.write("<div><form action='process-questions.jsp'><div class='d-flex justify-content-center' ><div style='width: 30%' class='input-group mb-3'><div class='input-group-prepend'><span class='input-group-text' id='basic-addon1'>Question</span></div><input autofocus='' name='question' type='text' class='form-control' placeholder='Type here...' aria-label='Question' aria-describedby='basic-addon1'><div class='input-group mt-2'><div class='input-group-prepend'><span class='input-group-text'> <input checked='' value='A' name='choice' type='radio' aria-label='Radio button for following text input'></span><span class='input-group-text'>A</span></div><input name='choiceOne' type='text' class='form-control' aria-label='choices' placeholder='Choice one..' ></div><div class='input-group mt-2'><div class='input-group-prepend'><span class='input-group-text'> <input value='B' name='choice' type='radio' aria-label='Radio button for following text input'></span><span class='input-group-text'>B</span></div><input name='choiceTwo' type='text' class='form-control' aria-label='choices' placeholder='Choice two..' ></div><div class='input-group mt-2'><div class='input-group-prepend'><span class='input-group-text'> <input value='C' name='choice' type='radio' aria-label='Radio button for following text input'></span><span class='input-group-text'>C</span></div><input name='choiceThree' type='text' class='form-control' aria-label='choices' placeholder='Choice three..' ></div><div class='input-group mt-2 mb-2'> <div class='input-group-prepend'><span class='input-group-text'> <input value='D' name='choice' type='radio' aria-label='Radio button for following text input'></span><span class='input-group-text'>D</span></div><input name='choiceFour' type='text' class='form-control' aria-label='choices' placeholder='Choice four..' ></div><div class='input-group'><input type='hidden' value='' name='quizID'/><button style='width: 100%' type='submit' name='operation' value='add' class='btn btn-outline-info'>Add</button></div></div></div></form></div>\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class='modal fade' id='editQuiz' data-backdrop='static' tabindex='-1' role='dialog' aria-labelledby='staticBackdropLabel' aria-hidden='true'><div class='modal-dialog' role='document'><div class='modal-content'><div class='modal-header'><h5 class='modal-title' id='staticBackdropLabel'>Profile</h5><button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div><form action='process-quiz.jsp'><div class='modal-body'>  <h4>Lect ID</h4><br><div class='input-group mb-3'><div class='input-group-prepend'><span class='input-group-text' id='inputGroup-sizing-default'>Quiz Name / Chapter / Category</span></div><input name='quizCategory' type='text' value='' class='form-control' aria-label='Sizing example input' aria-describedby='inputGroup-sizing-default'></div></div><div class='modal-footer'><button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button><button type='submit' name='operation' value='update' class='btn btn-primary'>Save</button></div></form></div></div></div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 16' width='12' height='16'><path fill-rule='evenodd' d='M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z'></path></svg>\n");
      out.write("\n");
      out.write("<svg class='bi bi-dash-circle-fill' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M16 8A8 8 0 110 8a8 8 0 0116 0zM4 7.5a.5.5 0 000 1h8a.5.5 0 000-1H4z' clip-rule='evenodd'/></svg>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<svg class='bi bi-box-arrow-in-right' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8.146 11.354a.5.5 0 010-.708L10.793 8 8.146 5.354a.5.5 0 11.708-.708l3 3a.5.5 0 010 .708l-3 3a.5.5 0 01-.708 0z' clip-rule='evenodd'/><path fill-rule='evenodd' d='M1 8a.5.5 0 01.5-.5h9a.5.5 0 010 1h-9A.5.5 0 011 8z' clip-rule='evenodd'/><path fill-rule='evenodd' d='M13.5 14.5A1.5 1.5 0 0015 13V3a1.5 1.5 0 00-1.5-1.5h-8A1.5 1.5 0 004 3v1.5a.5.5 0 001 0V3a.5.5 0 01.5-.5h8a.5.5 0 01.5.5v10a.5.5 0 01-.5.5h-8A.5.5 0 015 13v-1.5a.5.5 0 00-1 0V13a1.5 1.5 0 001.5 1.5h8z' clip-rule='evenodd'/></svg>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<form action='process-questions.jsp'><input type='hidden' name='quuizID' />\n");
      out.write("    <ul style='padding: 0' class='list-group'>\n");
      out.write("        <li style='text-align: right' class=''><div class='btn-group' role='group' aria-label='Basic example'><button type='button' class='btn btn-outline-info'><span class='material-icons' >info</span></button><button type='submit' name='operation' value='add' class='btn btn-outline-success'><span class='material-icons' >add</span></button></div> </li>\n");
      out.write("        <li class=''> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'>Question</span></div><input type='text' aria-label='First name' class='form-control'></div></li>\n");
      out.write("        <li class=''> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input checked='' type='radio' name='choice' value='A'></span><span class='input-group-text'>A</span></div><input name='choiceOne' type='text' aria-label='First name' class='form-control'></div></li>\n");
      out.write("        <li class=''> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input type='radio' name='choice' value='B'></span><span class='input-group-text'>B</span></div><input name='choiceTwo' type='text' aria-label='First name' class='form-control'></div></li>\n");
      out.write("        <li class=''> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input type='radio' name='choice' value='C'></span><span class='input-group-text'>C</span></div><input name='choiceThree' type='text' aria-label='First name' class='form-control'></div></li>\n");
      out.write("        <li class=''> <div class='input-group'><div class='input-group-prepend'><span class='input-group-text'><input type='radio' name='choice' value='D'></span><span class='input-group-text'>D</span></div><input name='choiceFour' type='text' aria-label='First name' class='form-control'></div></li>\n");
      out.write("    </ul> \n");
      out.write("</form>\n");
      out.write("\n");
      out.write("<ul class=\"list-group\">\n");
      out.write("    <li class=\"list-group-item\">Cras justo odio</li>\n");
      out.write("    <li class=\"list-group-item\">Dapibus ac facilisis in</li>\n");
      out.write("    <li class=\"list-group-item\">Morbi leo risus</li>\n");
      out.write("    <li class=\"list-group-item\">Porta ac consectetur ac</li>\n");
      out.write("    <li class=\"list-group-item\">Vestibulum at eros</li>\n");
      out.write("</ul>\n");
      out.write("\n");
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
