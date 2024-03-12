package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" >\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <title>CodePen - A Pen by Mohithpoojary</title>\n");
      out.write("  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'>\n");
      out.write("<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'><link rel=\"stylesheet\" href=\"./style.css\">\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<!-- partial:index.partial.html -->\n");
      out.write("<div class=\"container\">\n");
      out.write("\t<div class=\"screen\">\n");
      out.write("\t\t<div class=\"screen__content\">\n");
      out.write("\t\t\t<form class=\"login\">\n");
      out.write("\t\t\t\t<div class=\"login__field\">\n");
      out.write("\t\t\t\t\t<i class=\"login__icon fas fa-user\"></i>\n");
      out.write("\t\t\t\t\t<input type=\"text\" class=\"login__input\" placeholder=\"User name / Email\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"login__field\">\n");
      out.write("\t\t\t\t\t<i class=\"login__icon fas fa-lock\"></i>\n");
      out.write("\t\t\t\t\t<input type=\"password\" class=\"login__input\" placeholder=\"Password\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<button class=\"button login__submit\">\n");
      out.write("\t\t\t\t\t<span class=\"button__text\">Log In Now</span>\n");
      out.write("\t\t\t\t\t<i class=\"button__icon fas fa-chevron-right\"></i>\n");
      out.write("\t\t\t\t</button>\t\t\t\t\n");
      out.write("\t\t\t</form>\n");
      out.write("\t\t\t<div class=\"social-login\">\n");
      out.write("\t\t\t\t<h3>log in via</h3>\n");
      out.write("\t\t\t\t<div class=\"social-icons\">\n");
      out.write("\t\t\t\t\t<a href=\"#\" class=\"social-login__icon fab fa-instagram\"></a>\n");
      out.write("\t\t\t\t\t<a href=\"#\" class=\"social-login__icon fab fa-facebook\"></a>\n");
      out.write("\t\t\t\t\t<a href=\"#\" class=\"social-login__icon fab fa-twitter\"></a>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"screen__background\">\n");
      out.write("\t\t\t<span class=\"screen__background__shape screen__background__shape4\"></span>\n");
      out.write("\t\t\t<span class=\"screen__background__shape screen__background__shape3\"></span>\t\t\n");
      out.write("\t\t\t<span class=\"screen__background__shape screen__background__shape2\"></span>\n");
      out.write("\t\t\t<span class=\"screen__background__shape screen__background__shape1\"></span>\n");
      out.write("\t\t</div>\t\t\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("<!-- partial -->\n");
      out.write("  \n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write(">\n");
      out.write("\t\t\t\t\t<input type=\"text\" class=\"login__input\" placeholder=\"User name / Email\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"login__field\">\n");
      out.write("\t\t\t\t\t<i class=\"login__icon fas fa-lock\"></i>\n");
      out.write("\t\t\t\t\t<input type=\"password\" class=\"login__input\" placeholder=\"Password\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<button class=\"button login__submit\">\n");
      out.write("\t\t\t\t\t<span class=\"button__text\">Log In Now</span>\n");
      out.write("\t\t\t\t\t<i class=\"button__icon fas fa-chevron-right\"></i>\n");
      out.write("\t\t\t\t</button>\t\t\t\t\n");
      out.write("\t\t\t</form>");
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
