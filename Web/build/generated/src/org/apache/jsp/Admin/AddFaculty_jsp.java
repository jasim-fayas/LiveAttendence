package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class AddFaculty_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Add Faculty</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         <h1 align=\"center\">Add Teacher</h1>\n");
      out.write("        <form method=\"post\" enctype=\"multipart/form-data\" action=\"../Assets/ActionPages/AddFacultyActionPage.jsp\">\n");
      out.write("            <table border=\"2\" align=\"center\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>Name</td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"text\" name=\"name\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Contact</td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"number\" name=\"contact\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Email</td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"email\" name=\"email\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Photo</td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"file\" name=\"photo\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Address</td>\n");
      out.write("                    <td>\n");
      out.write("                        <textarea name=\"address\"></textarea>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>District</td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"district\" onchange=\"getPlace(this.value)\">\n");
      out.write("                            <option value=\"\">---select---</option>\n");
      out.write("                            ");

                             String selectdistrict="select * from tbl_district";
                             ResultSet objdistrict=con.selectCommand(selectdistrict);
                             while(objdistrict.next())
                             {
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(objdistrict.getString("district_id"));
      out.write('"');
      out.write('>');
      out.print(objdistrict.getString("district_name"));
      out.write("</option>\n");
      out.write("                            ");

                             }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Place</td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"place\" id=\"sel_place\">\n");
      out.write("                            <option value=\"\">---select---</option>\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Gender</td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"radio\" name=\"gender\" value=\"male\">Male\n");
      out.write("                        <input type=\"radio\" name=\"gender\" value=\"female\">Female\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Date of Birth</td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"date\" name=\"dob\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>About</td>\n");
      out.write("                    <td>\n");
      out.write("                        <textarea name=\"about\"></textarea>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Department</td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"department\">\n");
      out.write("                            <option value=\"\">---select---</option>\n");
      out.write("                            ");

                             String selectdepartment="select * from tbl_department d inner join tbl_department_type dp on d.department_type_id=dp.department_type_id ";
                             ResultSet objdepartment=con.selectCommand(selectdepartment);
                             while(objdepartment.next())
                             {
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(objdepartment.getString("department_id"));
      out.write('"');
      out.write('>');
      out.print(objdepartment.getString("departmenttype_name"));
      out.write("</option>\n");
      out.write("                            ");

                             }
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Password</td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"password\" name=\"password\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"submit\" name=\"save\" value=\"save\">\n");
      out.write("                        <input type=\"reset\" name=\"reset\" value=\"cancel\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("   \n");
      out.write("    <script src=\"../Assets/JQ/jQuery.js\"></script>\n");
      out.write("    <script>\n");
      out.write("        function getPlace(did)\n");
      out.write("        {\n");
      out.write("            $.ajax({\n");
      out.write("                url: \"../Assets/AjaxPages/AjaxPlace.jsp?did=\" + did,\n");
      out.write("                success: function(html) {\n");
      out.write("                    $(\"#sel_place\").html(html);\n");
      out.write("\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("        }\n");
      out.write("    </script>\n");
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
