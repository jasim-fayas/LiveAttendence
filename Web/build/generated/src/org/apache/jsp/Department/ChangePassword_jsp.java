package org.apache.jsp.Department;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class ChangePassword_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Change Password</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Change Password</h1>\n");
      out.write("        ");

            String fid = session.getAttribute("departmentid").toString();
            String department = " select * from tbl_department where department_id='" + fid + "'";
            ResultSet rs = con.selectCommand(department);
            if (rs.next()) {
                String dbpass = rs.getString("department_password");

                String oldpass = request.getParameter("txt_oldpassword");
                String newpass = request.getParameter("txt_newpassword");
                String confirmpass = request.getParameter("txt_confirmpassword");
                
//                 out.println("dbpass: " + dbpass);
//    out.println("oldpass: " + oldpass);
//    out.println("newpass: " + newpass);
//    out.println("confirmpass: " + confirmpass);
    
      if (request.getParameter("btn_submit") != null) {

                if (oldpass.equals(dbpass)) {

                    if (newpass.equals(confirmpass)) {

                            String update = " update tbl_faculty set faculty_password='" + newpass + "'";
                            if (con.executeCommand(update)) {
        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert(\"Password Updated\");\n");
      out.write("            window.location('ChangePassword.jsp');\n");
      out.write("        </script>\n");
      out.write("        ");

        } else {
        
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert(\"Password Updation Failed\");\n");
      out.write("            window.location('ChangePassword.jsp');\n");
      out.write("        </script>\n");
      out.write("        ");

                            }
                        }else{
                        
      out.write("\n");
      out.write("                        <script>\n");
      out.write("            alert(\"Please Check Confirm Password \");\n");
      out.write("            window.location('ChangePassword.jsp');\n");
      out.write("        </script> \n");
      out.write("        ");

                    }
                    }else{
                    
      out.write("\n");
      out.write("                    <script>\n");
      out.write("            alert(\"Please enter correct old password \");\n");
      out.write("            window.location('ChangePassword.jsp');\n");
      out.write("        </script> \n");
      out.write("        ");

                }
                }
            }

        
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"2\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Old Password\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"password\" name=\"txt_oldpassword\">\n");
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        New Password\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"password\" name=\"txt_newpassword\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>  <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Confirm Password\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"password\" name=\"txt_confirmpassword\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"submit\" name=\"btn_submit\" value=\"submit\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("\n");
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
