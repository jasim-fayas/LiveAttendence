package org.apache.jsp.Faculty;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.*;
import java.io.PrintWriter;

public final class AllottedHours_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <title>Allotted Hours</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <h1>Hello Faculty</h1>\n");
      out.write("    <form method=\"post\">\n");
      out.write("\n");
      out.write("        ");

            ArrayList<String> days = new ArrayList<String>();
            days.add("Monday");
            days.add("Tuesday");
            days.add("Wednesday");
            days.add("Thursday");
            days.add("Friday");
            String id = session.getAttribute("facultyid").toString();

            // Retrieve timetable data with course name
            String timetableqry = "SELECT t.timetable_day, t.timetable_hour, s.subject_name, c.course_name FROM tbl_timetable t " +
                                   "INNER JOIN tbl_subject s ON t.subject_id = s.subject_id " +
                                   "INNER JOIN tbl_course c ON s.course_id = c.course_id " +
                                   "INNER JOIN tbl_assign a ON s.subject_id = a.subject_id " +
                                   "WHERE a.faculty_id='" + id + "'";
            ResultSet timetableResult = con.selectCommand(timetableqry);
            ArrayList<String[]> timetableData = new ArrayList<String[]>(); // Specify the type explicitly
            while (timetableResult.next()) {
                String[] rowData = new String[4];
                rowData[0] = timetableResult.getString("timetable_day");
                rowData[1] = timetableResult.getString("timetable_hour");
                rowData[2] = timetableResult.getString("subject_name");
                rowData[3] = timetableResult.getString("course_name");
                 
                timetableData.add(rowData);
            }
        
      out.write("\n");
      out.write("\n");
      out.write("        <table border=\"2\">\n");
      out.write("            <tr>\n");
      out.write("                <td>Day</td>\n");
      out.write("                <td>9:30-10:30</td>\n");
      out.write("                <td>10:30-11:30</td>\n");
      out.write("                <td>11:45-12:45</td>\n");
      out.write("                <td>1:45-2:30</td>\n");
      out.write("                <td>2:30-3:30</td>\n");
      out.write("            </tr>\n");
      out.write("            ");
 for (String day : days) { 
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td height=\"38\">");
      out.print( day );
      out.write("</td>\n");
      out.write("                ");
 for (int i = 1; i <= 5; i++) { 
      out.write("\n");
      out.write("                <td>\n");
      out.write("                    ");
 
                        boolean found = false;
                        for (String[] rowData : timetableData) {
                            if (rowData[0].equals(day) && rowData[1].equals(Integer.toString(i))) {
                                out.print(rowData[2] + "<br>"); // Subject name
                                out.print(rowData[3]); // Course name
                                
                                found = true;
                                break;
                            }
                        }
                        if (!found) {
                            out.print("Free Hour");
                        }
                    
      out.write("\n");
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
      out.write("</body>\n");
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
