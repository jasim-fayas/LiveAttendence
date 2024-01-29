package org.apache.jsp.Department;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class ListAndAssign_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>List And Assign</h1>\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"2\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Sl number\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        Faculty Photo\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        Faculty Name\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        faculty Assigned Subjects And Semester\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        Action\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");

              String select = " select * from tbl_faculty p inner join tbl_assign pq on p.faculty_id=pq.faculty_id inner join tbl_subject pqr on pq.subject_id=pqr.subject_id inner join tbl_semester pqrs on pq.semester_id=pqrs.semester_id where p.department_id='"+session.getAttribute("departmentid")+"'";   
             out.print(select);
              ResultSet rs = con.selectCommand(select);
              int i = 0;
              while (rs.next()){
                  i++;  
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        ");
      out.print(i);
      out.write("\n");
      out.write("                    </td> \n");
      out.write("                    <td>\n");
      out.write("                         <img src=\"../Assets/Files/Teacher/");
      out.print(rs.getString("faculty_photo"));
      out.write("\" width=\"150px\">\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        ");
      out.print(rs.getString("faculty_name"));
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        ");
      out.print(rs.getString("subject_name"));
      out.write(" &nbsp;  ");
      out.print(rs.getString("semester_name"));
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <a href=\"AssignFaculty.jsp\">Assign</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            ");

              }
            
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
