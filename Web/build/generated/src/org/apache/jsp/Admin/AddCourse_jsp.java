package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class AddCourse_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Add Course</title>\n");
      out.write("    \n");
      out.write("   \n");
      out.write("     </head>\n");
      out.write("    <body>\n");
      out.write("        ");

         if(request.getParameter("save")!= null){
      
        
             String course=request.getParameter("course");
            
             
             String departmenttype=request.getParameter("department_id");
             String insert="insert into tbl_course (course_name,department_id)value('"+course+"','"+departmenttype+"')";
             con.executeCommand(insert);
           //  out.print(insert);
                     
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert(\"Registraction Completed\");\n");
      out.write("            window.location('AddParent.jsp');\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("        ");
 } else {

        
      out.write("\n");
      out.write("   <script>\n");
      out.write("            alert(\"Registraction Failed\");\n");
      out.write("            window.location('AddParent.jsp');\n");
      out.write("\n");
      out.write("        </script>\n");

         }
        
         
         if (request.getParameter("del")!=null)
        {
         String id=request.getParameter("del");
         String delete="delete from tbl_course where course_id='"+id+"'";
         con.executeCommand(delete);
        }
         
       
        
        
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"1\" align=\"center\">\n");
      out.write("             \n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Department Type\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"department_id\">\n");
      out.write("                            <option value=\"\">--select--</option>\n");
      out.write("                         ");

                         String selectdepartmenttype="select * from tbl_department_type d inner join tbl_department p on d.department_type_id=p.department_type_id";
                         ResultSet dep=con.selectCommand(selectdepartmenttype);
                         while(dep.next())
                         {
                        
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(dep.getString("department_id"));
      out.write('"');
      out.write('>');
      out.print(dep.getString("department_type_name"));
      out.write("</option>\n");
      out.write("                        ");

                         }
                        
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Course\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"text\" name=\"course\" >\n");
      out.write("                        \n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("               \n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"submit\" name=\"save\" value=\"save\">\n");
      out.write("                        <input type=\"reset\" name=\"reset\" value=\"cancel\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("<table border=\"1\">\n");
      out.write("    <tr>\n");
      out.write("        <th>S.NO</th>\n");
      out.write("       \n");
      out.write("        <th>Department Type</th>\n");
      out.write("        <th>Course</th>\n");
      out.write("     \n");
      out.write("        <th colspan=\"2\" align=\"center\">Action</th>\n");
      out.write("    </tr>\n");
      out.write("    ");

         String selcategory="select * from tbl_course c  inner join tbl_department d on c.department_id=d.department_id inner join tbl_department_type  pq on pq.department_type_id=d.department_type_id";
         ResultSet display=con.selectCommand(selcategory);
         int i=0;
         while(display.next())
         {
            i++; 
        
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("       \n");
      out.write("        <td>");
      out.print(display.getString("department_type_name"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(display.getString("course_name"));
      out.write("</td>  \n");
      out.write("        <td><a href=\"AddCourse.jsp?del=");
      out.print(display.getString("course_id"));
      out.write("\">Delete</a></td>\n");
      out.write("    ");

     }
    
      out.write("\n");
      out.write("</table>\n");
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
