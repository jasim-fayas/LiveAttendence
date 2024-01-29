package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.ResultSet;

public final class AddSubject_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Add Subject</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Add Subject</h1>\n");
      out.write("          ");

            if (request.getParameter("save") != null) {
               
            
                    String subject = request.getParameter("subject");
                    String course = request.getParameter("course");
                    String sem = request.getParameter("sem");
                    String department = request.getParameter("department");
                    String insert = "insert into tbl_subject (course_id,subject_name,semester_id,department_id)value('" + course + "','" + subject + "','" + sem + "','" + department + "')";
                    con.executeCommand(insert);
                }
            

            if (request.getParameter("del") != null) {
                String id = request.getParameter("del");
                String delete = "delete from tbl_subject where subject_id='" + id + "'";
                con.executeCommand(delete);
            }
           
           
        
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"1\" align=\"center\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Department\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"department\" onchange=\"getCourse(this.value)\">\n");
      out.write("                            <option value=\"\">--select--</option>\n");
      out.write("                            ");

                              
                                    String select = "select * from tbl_department p inner join tbl_department_type_name q on q.department_type_id=p.department_type_id ";
                                    ResultSet rs = con.selectCommand(select);
                                    while (rs.next()) {
                            
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rs.getString("department_id"));
      out.write("\" >");
      out.print(rs.getString("department_type_name"));
      out.write("</option>\n");
      out.write("                            ");

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
      out.write("                        <select name=\"course\" id=\"sel_course\" onchange=\"getSemester(this.value)\">\n");
      out.write("                            <option value=\"\">--select--</option>\n");
      out.write("                            ");

                              
                                   
                                    String selcourse = "select * from tbl_course";
                                    ResultSet res = con.selectCommand(selcourse);
                                    while (res.next()) {
                            
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(res.getString("course_id"));
      out.write("\" >");
      out.print(res.getString("course_name"));
      out.write("</option>\n");
      out.write("                            ");

                                    }
                                
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Semester\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"sem\" id=\"sel_semester\">\n");
      out.write("                            <option value=\" \">--select--</option>\n");
      out.write("                            ");

                               
                                    String sid = request.getParameter("sid");
                                    String selsemester = "select * from tbl_semester ";
                                    ResultSet rese = con.selectCommand(selsemester);
                                    while (rese.next()) {
                            
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(rese.getString("semester_id"));
      out.write("\" >");
      out.print(rese.getString("semester_name"));
      out.write("</option>\n");
      out.write("                            ");

                                    }
                                
                            
      out.write("\n");
      out.write("                        </select>\n");
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Subject\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"text\" name=\"subject\" >\n");
      out.write("                       \n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"submit\" name=\"save\" value=\"save\">\n");
      out.write("                        <input type=\"reset\" name=\"reset\" value=\"cancel\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("            <table border=\"2\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>S.NO</td>\n");
      out.write("                    <td>Course</td>\n");
      out.write("                    <td>Semester</td>\n");
      out.write("                    <td>Subject</td>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">Action</td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    String selsubject = "select * from tbl_subject s inner join tbl_course c on s.course_id=c.course_id inner join tbl_semester sem on s.semester_id=sem.semester_id";
                    ResultSet display = con.selectCommand(selsubject);
                    int i = 0;
                    while (display.next()) {
                        i++;
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(display.getString("course_name"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(display.getString("semester_name"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(display.getString("subject_name"));
      out.write("</td>\n");
      out.write("                    <td><a href=\"Subject.jsp?del=");
      out.print(display.getString("subject_id"));
      out.write("\">Delete</a></td>\n");
      out.write("                    \n");
      out.write("                </tr>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("   \n");
      out.write("    <script src=\"../Assets/JQuery/jQuery.js\"></script>\n");
      out.write("    <script>\n");
      out.write("                            function getCourse(uid)\n");
      out.write("                            {\n");
      out.write("                                $.ajax({\n");
      out.write("                                    url: \"../Assets/AjaxPages/AjaxCourse.jsp?did=\" + uid,\n");
      out.write("                                    success: function(html) {\n");
      out.write("                                        $(\"#sel_course\").html(html);\n");
      out.write("\n");
      out.write("                                    }\n");
      out.write("                                });\n");
      out.write("                            }\n");
      out.write("\n");
      out.write("                            function getSemester(sid)\n");
      out.write("                            {\n");
      out.write("                                $.ajax({\n");
      out.write("                                    url: \"../Assets/AjaxPages/AjaxSemester.jsp?sid=\" + sid,\n");
      out.write("                                    success: function(html) {\n");
      out.write("                                        $(\"#sel_semester\").html(html);\n");
      out.write("\n");
      out.write("                                    }\n");
      out.write("                                });\n");
      out.write("                            }\n");
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
