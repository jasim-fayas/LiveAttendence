package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class AddDistrict_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <h1>Add District</h1>\n");
      out.write("        \n");
      out.write("         ");


        
       

        if (request.getParameter("btn_submit") != null) {
             String District = request.getParameter("txt_district");
              String insQry = "insert into tbl_district (district_name) values('" + District + "')";
                if (con.executeCommand(insQry)) {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert(\"Inserted\");\n");
      out.write("        window.location.href = \"AddDistrict.jsp\";\n");
      out.write("    </script>\n");
      out.write("    ");

    } else {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert(\"Failed\");\n");
      out.write("        window.location.href = \"AddDistrict.jsp\";\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    ");
   
                }}

        if (request.getParameter("id") != null) {
            String id = request.getParameter("id");
            String DelQry = " delete from tbl_district where district_id='" + id + "'";
            if (con.executeCommand(DelQry)) {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert(\"Deteted\");\n");
      out.write("        window.loaction.href(\"AddDistrict.jsp\");\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("    ");

    } else {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert(\"Deletion Failed\");\n");
      out.write("        window.loaction.href(\"AddDistrict.jsp\");\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("  ");

            }}
  
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <h1>District</h1>\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"2\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>District</td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"text\" name=\"txt_district\" id=\"txt_district\" >\n");
      out.write("                       \n");
      out.write("                    </td> \n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"submit\" name=\"btn_submit\" id=\"btn_submit\" value=\"submit\"></td>\n");
      out.write("                   \n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        <br>\n");
      out.write("        <table border=\"2\">\n");
      out.write("            <tr>\n");
      out.write("                <td>Sl.No</td>\n");
      out.write("                <td>District</td>\n");
      out.write("                <td>Action</td>\n");
      out.write("            </tr>\n");
      out.write("            ");

                String selQry = "select * from tbl_district";
                ResultSet rs = con.selectCommand(selQry);
                int i = 0;
                while (rs.next()) {
                    i++;
            
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("                <td>");
      out.print(rs.getString("district_name"));
      out.write("</td>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"AddDistrict.jsp?id=");
      out.print(rs.getString("district_id"));
      out.write("\">Delete</a>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("        </table>\n");
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
