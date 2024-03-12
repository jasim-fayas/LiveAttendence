package org.apache.jsp;

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
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Allotted Hours</title>\n");
      out.write("        <style>\n");
      out.write("            /* Style the modal */\n");
      out.write("            .modal {\n");
      out.write("                display: none; /* Hidden by default */\n");
      out.write("                position: fixed; /* Stay in place */\n");
      out.write("                z-index: 1; /* Sit on top */\n");
      out.write("                left: 0;\n");
      out.write("                top: 0;\n");
      out.write("                width: 100%; /* Full width */\n");
      out.write("                height: 100%; /* Full height */\n");
      out.write("                overflow: auto; /* Enable scroll if needed */\n");
      out.write("                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Modal content */\n");
      out.write("            .modal-content {\n");
      out.write("                background-color: #fefefe;\n");
      out.write("                margin: 10% auto; /* 10% from the top and centered */\n");
      out.write("                padding: 20px;\n");
      out.write("                border: 1px solid #888;\n");
      out.write("                width: 80%; /* Could be more or less, depending on screen size */\n");
      out.write("                max-width: 400px; /* Limit maximum width */\n");
      out.write("                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Box shadow */\n");
      out.write("                border-radius: 5px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* Close button */\n");
      out.write("            .close {\n");
      out.write("                color: #aaa;\n");
      out.write("                float: right;\n");
      out.write("                font-size: 28px;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .close:hover,\n");
      out.write("            .close:focus {\n");
      out.write("                color: black;\n");
      out.write("                text-decoration: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form method=\"post\">\n");
      out.write("\n");
      out.write("            ");

                ArrayList<String> days = new ArrayList<String>();
                days.add("Monday");
                days.add("Tuesday");
                days.add("Wednesday");
                days.add("Thursday");
                days.add("Friday");
                String id = request.getParameter("id");

                // Retrieve timetable data with course name
                String timetableqry = "SELECT t.timetable_day, t.timetable_hour, s.subject_name, c.course_name ,sem.semester_name FROM tbl_timetable t "
                        + "INNER JOIN tbl_subject s ON t.subject_id = s.subject_id "
                        + "INNER JOIN tbl_course c ON s.course_id = c.course_id "
                        + "INNER JOIN tbl_assign a ON s.subject_id = a.subject_id inner join tbl_semester sem on sem.semester_id=t.semester_id "
                        + "WHERE a.faculty_id='" + id + "'";
                System.out.println(timetableqry);
                ResultSet timetableResult = con.selectCommand(timetableqry);
                ArrayList<String[]> timetableData = new ArrayList<String[]>(); // Specify the type explicitly
                while (timetableResult.next()) {
                    String[] rowData = new String[5];
                    rowData[0] = timetableResult.getString("timetable_day");
                    rowData[1] = timetableResult.getString("timetable_hour");
                    rowData[2] = timetableResult.getString("subject_name");
                    rowData[3] = timetableResult.getString("course_name");
                    rowData[4] = timetableResult.getString("semester_name");

                    timetableData.add(rowData);
                }
            
      out.write("\n");
      out.write("\n");
      out.write("            <table border=\"2\" align=\"center\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>Day</td>\n");
      out.write("                    <td>9:30-10:30</td>\n");
      out.write("                    <td>10:30-11:30</td>\n");
      out.write("                    <td>11:45-12:45</td>\n");
      out.write("                    <td>1:45-2:30</td>\n");
      out.write("                    <td>2:30-3:30</td>\n");
      out.write("                </tr>\n");
      out.write("                ");
 for (String day : days) {
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td height=\"38\">");
      out.print( day);
      out.write("</td>\n");
      out.write("                    ");
 for (int i = 1; i <= 5; i++) { 
      out.write("\n");
      out.write("\n");
      out.write("                    ");

                        boolean found = false;
                        for (String[] rowData : timetableData) {
                            if (rowData[0].equals(day) && rowData[1].equals(Integer.toString(i))) {
                    
      out.write("\n");
      out.write("                    <td class=\"openModal\" onclick=\"openModal('");
      out.print(rowData[2]);
      out.write("', '");
      out.print(rowData[3]);
      out.write("', '");
      out.print(rowData[4]);
      out.write("')\"><span style=\"color: #001dff\">");
      out.print(rowData[2]);
      out.write("</span> </td>\n");
      out.write("                    ");

                                found = true;
                                break;
                            }
                        }
                        if (!found) {
                    
      out.write("\n");
      out.write("                    <td><span style=\"color:green\">Free Hour</span></td>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                ");
 }
      out.write("\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        <!-- Modal -->\n");
      out.write("        <div id=\"myModal\" class=\"modal\">\n");
      out.write("            <!-- Modal content -->\n");
      out.write("            <div class=\"modal-content\">\n");
      out.write("                <span class=\"close\">&times;</span>\n");
      out.write("                <p id=\"modalDetails\">Modal content goes here...</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("    <script>\n");
      out.write("        // Get the modal\n");
      out.write("        var modal = document.getElementById('myModal');\n");
      out.write("\n");
      out.write("        // Get the <span> element that closes the modal\n");
      out.write("        var span = document.getElementsByClassName(\"close\")[0];\n");
      out.write("\n");
      out.write("        // When the user clicks on <span> (x), close the modal\n");
      out.write("        span.onclick = function() {\n");
      out.write("            modal.style.display = \"none\";\n");
      out.write("        };\n");
      out.write("\n");
      out.write("        // When the user clicks anywhere outside of the modal, close it\n");
      out.write("        window.onclick = function(event) {\n");
      out.write("            if (event.target == modal) {\n");
      out.write("                modal.style.display = \"none\";\n");
      out.write("            }\n");
      out.write("        };\n");
      out.write("\n");
      out.write("        // Function to open modal with subject details\n");
      out.write("        function openModal(subjectName, courseName, semesterName) {\n");
      out.write("            var modalDetails = document.getElementById('modalDetails');\n");
      out.write("            modalDetails.innerHTML = \"<b>Subject Name:</b> \" + subjectName + \"<br><b>Course Name:</b> \" + courseName + \"<br><b>Semester Name:</b> \" + semesterName;\n");
      out.write("            modal.style.display = \"block\";\n");
      out.write("        }\n");
      out.write("    </script>\n");
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
