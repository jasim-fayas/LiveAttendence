package org.apache.jsp.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.ArrayList;
import java.io.PrintWriter;
import java.util.*;

public final class ViewTimeTable_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");

    ArrayList<String> days = new ArrayList<String>();
    days.add("Monday");
    days.add("Tuesday");
    days.add("Wednesday");
    days.add("Thursday");
    days.add("Friday");

    String semester = "",course="";

    if (request.getParameter("btn_reset") != null) {
        response.sendRedirect("Timetable.jsp");
    }



      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       \n");
      out.write("        <div id=\"tab\" align=\"center\">\n");
      out.write("    <h1 align=\"center\">Time Table</h1>\n");
      out.write("    <form id=\"form1\" name=\"form1\" action=\"\">\n");
      out.write("        <table border=\"1\">\n");
      out.write("            <tr>\n");
      out.write("\n");
      out.write("              \n");
      out.write("                <td colspan=\"3\">Time Table\n");
      out.write("                  \n");
      out.write("                </td>\n");
      out.write("              \n");
      out.write("            </tr>\n");
      out.write("            ");

               
                    if (semester != null && !semester.isEmpty()) {
            
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>Day</td>\n");
      out.write("                <td>9:30-10:30</td>\n");
      out.write("                <td>10:30-11:30</td>\n");
      out.write("                <td>11:45-12:45</td>\n");
      out.write("                <td>12:45-1:45</td>\n");
      out.write("                <td>1:45-2:30</td>\n");
      out.write("                <td>2:30-3:30</td>\n");
      out.write("            </tr>\n");
      out.write("            ");

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
      out.write("                    ");

                        String selQry1 = "SELECT * FROM tbl_timetable t INNER JOIN tbl_subject s ON t.subject_id = s.subject_id WHERE timetable_day='" + day + "' AND timetable_hour='" + i + "' AND s.semester_id='" + session.getAttribute("semesterid") + "' and course_id='"+session.getAttribute("courseid")+"'";
                        ResultSet data1 = con.selectCommand(selQry1);

                        if (data1.next()) {
                            out.print(data1.getString("subject_name"));
                        } else {
                            out.print("Not Decide");
                        }

                    
      out.write("\n");
      out.write("                </td>\n");
      out.write("                ");
                                        }
                
      out.write("\n");
      out.write("            </tr>\n");
      out.write("            ");

                }}
            
      out.write("\n");
      out.write("       \n");
      out.write("        </table>\n");
      out.write("    </form>\n");
      out.write("</div>\n");
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
