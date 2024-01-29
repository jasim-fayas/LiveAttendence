package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class AddAdmin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Add Admin</h1>\n");
      out.write("           ");

            if (request.getParameter("btn_submit") != null) {
                String name = request.getParameter("txt_name");
              
                String email = request.getParameter("txt_email");
      
                String password = request.getParameter("txt_password");
                String InsQry = " insert into tbl_admin (admin_name,admin_email,admin_password) values ('" + name + "','" + email + "','" + password + "')";
              //  out.print(InsQry);
                if (con.executeCommand(InsQry)) {

        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert(\"Inserted\")\n");
      out.write("             window.location(\"AddAdmin.jsp\");\n");
      out.write("        </script>\n");
      out.write("        ");
        } else {

        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert(\"Failed\")\n");
      out.write("            out.print(InsQry);\n");
      out.write("            window.location(\"AddAdmin.jsp\");\n");
      out.write("        </script>\n");
      out.write("        ");
                }
            }

            if (request.getParameter("id") != null) {

                String DelQry = " delete from tbl_admin where admin_id='" + request.getParameter("id") + "'";
                if (con.executeCommand(DelQry)) {

        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert(\"Deleted\")\n");
      out.write("            window.location(\"AddAdmin.jsp\");\n");
      out.write("        </script>\n");
      out.write("        ");
        } else {
        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert(\"Failed\")\n");
      out.write("\n");
      out.write("            window.location(\"AddAdmin.jsp\");\n");
      out.write("        </script>\n");
      out.write("        ");
                }
            }


        
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"2\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Name\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"text\" name=\"txt_name\" id=\"txt_name\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("               \n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Email\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"email\" name=\"txt_email\" id=\"txt_email\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Password\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                    <input type=\"password\" name=\"txt_password\" id=\"txt_password\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"submit\" name=\"btn_submit\" id=\"btn_submit\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("            <table border=\"2\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Sl.number\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        Name\n");
      out.write("                    </td>\n");
      out.write("                   \n");
      out.write("                    <td>\n");
      out.write("                        Email\n");
      out.write("                    </td>\n");
      out.write("                  \n");
      out.write("                    <td>\n");
      out.write("                        Action\n");
      out.write("                    </td>\n");
      out.write("                </tr>   ");
              
            int i = 0;
                    String SelQry = " select * from tbl_admin";
                    ResultSet rs = con.selectCommand(SelQry);

                    while (rs.next()) {
                        i++;

                
      out.write("\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        ");
      out.print(i);
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        ");
      out.print(rs.getString("admin_name"));
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                  \n");
      out.write("                    <td>\n");
      out.write("                        ");
      out.print(rs.getString("admin_email"));
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                   \n");
      out.write("                    <td>\n");
      out.write("                        <a href=\"AddAdmin.jsp?id=");
      out.print(rs.getString("admin_id"));
      out.write("\">Delete</a>\n");
      out.write("                    </td>\n");
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
