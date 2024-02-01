package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.ArrayList;
import java.io.PrintWriter;
import java.util.*;

public final class TimeTable_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    ArrayList<String> days = new ArrayList<String>();
    days.add("Monday");
    days.add("Tuesday");
    days.add("Wednesday");
    days.add("Thursday");
    days.add("Friday");

    String semester = "", course = "";

    if (request.getParameter("btn_reset") != null) {
        response.sendRedirect("TimeTable.jsp");
    }



      out.write("\n");
      out.write("<div id=\"tab\" align=\"center\">\n");
      out.write("    <h1 align=\"center\">Time Table</h1>\n");
      out.write("    <form id=\"form1\" name=\"form1\" action=\"\">\n");
      out.write("        <table border=\"1\">\n");
      out.write("            <tr>\n");
      out.write("\n");
      out.write("                <td colspan=\"2\">Course\n");
      out.write("                    <select name=\"sel_course\">\n");
      out.write("                        <option value=\"\">-----Select-----</option>\n");
      out.write("                        ");
                            String selQryzz = "select * from tbl_course";

                            ResultSet resultz = con.selectCommand(selQryzz);
                            while (resultz.next()) {
                        
      out.write("\n");
      out.write("                        <option value=\"");
      out.print(resultz.getString("course_id"));
      out.write('"');
      out.write('>');
      out.print(resultz.getString("course_name"));
      out.write("</option>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </select>\n");
      out.write("                </td>\n");
      out.write("                <td colspan=\"3\">Semester\n");
      out.write("                    <select name=\"sel_semester\">\n");
      out.write("                        <option value=\"\">-----Select-----</option>\n");
      out.write("                        ");
                            String selQryz = "select * from tbl_semester";

                            ResultSet result = con.selectCommand(selQryz);
                            while (result.next()) {
                        
      out.write("\n");
      out.write("                        <option value=\"");
      out.print(result.getString("semester_id"));
      out.write('"');
      out.write('>');
      out.print(result.getString("semester_name"));
      out.write("</option>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </select>\n");
      out.write("                </td>\n");
      out.write("                <td colspan=\"1\">\n");
      out.write("                    <input type=\"submit\" name=\"btn_submit\" value=\"Submit\" />\n");
      out.write("                </td>\n");
      out.write("                <td colspan=\"1\">\n");
      out.write("                    <input type=\"submit\" name=\"btn_reset\" value=\"Reset\" />\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            ");

                if (request.getParameter("btn_submit") != null) {
                    semester = request.getParameter("sel_semester");
                    course = request.getParameter("sel_course");
                    if (semester != null && !semester.isEmpty()) {
                        for (String day : days) {
            
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td height=\"38\">");
      out.print( day);
      out.write("</td>\n");
      out.write("                ");

                    for (int i = 1; i <= 5; i++) {
                        if (day.equals("Monday") && i == 4) {
                
      out.write("\n");
      out.write("                <td rowspan=\"6\">\n");
      out.write("                    <div id=\"lunch\">\n");
      out.write("                        <p>L</p>\n");
      out.write("                        <p>U</p>\n");
      out.write("                        <p>N</p>\n");
      out.write("                        <p>C</p>\n");
      out.write("                        <p>H</p>\n");
      out.write("                    </div>\n");
      out.write("                </td>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("                <td>\n");
      out.write("                    <select id=\"sel_subject\" onchange=\"submitTimetable(");
      out.print( i);
      out.write(", '");
      out.print( course);
      out.write("', '");
      out.print( semester);
      out.write("', this.value, '");
      out.print( day);
      out.write("')\">\n");
      out.write("                        <option value=\"\">Select</option>\n");
      out.write("                        ");

                            String selQry = "SELECT * FROM tbl_subject WHERE semester_id='" + semester + "' and course_id='" + course + "'";

                            ResultSet result1 = con.selectCommand(selQry);

                            while (result1.next()) {
                                String subjectId = result1.getString("subject_id");
                                String subjectName = result1.getString("subject_name");

                                String selQry1 = "SELECT * FROM tbl_timetable WHERE timetable_day='" + day + "' AND timetable_hour='" + i + "' AND semester_id='" + semester + "' AND subject_id='" + subjectId + "'";

                                ResultSet data1 = con.selectCommand(selQry1);

                                if (data1.next()) {
                        
      out.write("\n");
      out.write("                        <option selected value=\"");
      out.print( subjectId);
      out.write('"');
      out.write('>');
      out.print( subjectName);
      out.write("</option>\n");
      out.write("                        ");

                        } else {
                        
      out.write("\n");
      out.write("                        <option value=\"");
      out.print( subjectId);
      out.write('"');
      out.write('>');
      out.print( subjectName);
      out.write("</option>\n");
      out.write("                        ");

                                }
                            }
                        
      out.write("\n");
      out.write("                    </select>\n");
      out.write("                </td>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </form>\n");
      out.write("</div>\n");

} else {

      out.write("\n");
      out.write("<script>\n");
      out.write("    alert(\"Select Semester\");\n");
      out.write("    window.location = \"TimeTable.jsp\";\n");
      out.write("</script>\n");

        }
    }



      out.write("\n");
      out.write("\n");
      out.write("<script src=\"../Assets/JQ/jQuery.js\"></script>\n");
      out.write("<script>\n");
      out.write("    function submitTimetable(hour, semester, subject, day) {\n");
      out.write("        $.ajax({\n");
      out.write("            url: \"../Assets/AjaxPages/AjaxTimeTable.jsp?hour=\" + hour + \"&semester=\" + semester + \"&subject=\" + subject + \"&day=\" + day,\n");
      out.write("            success: function(html) {\n");
      out.write("                window.location = 'TimeTable.jsp?sel_semester=' + semester + '&btn_submit=Submit';\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    }\n");
      out.write("</script>\n");
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
