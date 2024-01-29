package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class AddSemester_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <h1>Hello World!</h1>  ");

            if (request.getParameter("save") != null) {
                String count = request.getParameter("semester");
                String check = "select * from tbl_semester where semester_count='" + count + "'";
                ResultSet che = con.selectCommand(check);
                if (che.next()) {
        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert('This Semester is Already Inserted');\n");
      out.write("        </script>\n");
      out.write("        ");

                } else {
                    String insQry = "insert into tbl_semester(semester_name)values('" + count + "')";
                    con.executeCommand(insQry);
                }
            }
            if (request.getParameter("id") != null) {
                String id = request.getParameter("id");
                String delete = "delete from tbl_semester where semester_id='" + id + "'";
                con.executeCommand(delete);
            }

        
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"1\" align=\"center\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Semester\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"number\" name=\"semester\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"submit\" name=\"save\" value=\"save\">\n");
      out.write("                        <input type=\"reset\" name=\"reset\" value=\"cancel\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("            <!--            display-->\n");
      out.write("            <table border=\"1\">\n");
      out.write("                <tr>\n");
      out.write("                    <th>S.NO</th>\n");
      out.write("                    <th>Semester</th>\n");
      out.write("                    <th>Action</th>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    String selectsem = "select * from tbl_semester";
                    ResultSet rs = con.selectCommand(selectsem);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs.getString("semester_count"));
      out.write("</td>\n");
      out.write("                    <td><a href=\"AddSemester.jsp?id=");
      out.print(rs.getString("semester_id"));
      out.write("\">Delete</a></td>\n");
      out.write("                </tr>\n");
      out.write("                ");

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
