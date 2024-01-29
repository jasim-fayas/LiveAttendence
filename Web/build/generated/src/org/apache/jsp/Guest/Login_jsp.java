package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Login</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1 align=\"center\">Login</h1>\n");
      out.write("        ");

     if(request.getParameter("btn_submit")!=null){
             String email=request.getParameter("txt_email");
         String password=request.getParameter("txt_password");
        
         String selectadmin="select * from tbl_admin where admin_email='"+email+"' and admin_password='"+password+"'";
         ResultSet admin=con.selectCommand(selectadmin);
        
         String selectdepartment="select * from tbl_department d inner join tbl_department_type dt on d.department_type_id=dt.department_type_id   where department_email='"+email+"' and department_password='"+password+"'";
         ResultSet department=con.selectCommand(selectdepartment);
         
         String selectparent="select * from tbl_parent where parent_email='"+email+"' and parent_password='"+password+"'";
         ResultSet parent=con.selectCommand(selectparent);
         
         String selectstudent="select * from tbl_student s inner join tbl_course c on s.course_id=c.course_id inner join tbl_department dep on s.department_id=dep.department_id  where student_email='"+email+"' and student_password='"+password+"'";
         ResultSet student=con.selectCommand(selectstudent);
        
         String selectteacher="select * from tbl_faculty t inner join tbl_department dep on t.department_id=dep.department_id where faculty_email='"+email+"' and faculty_password='"+password+"'";
         ResultSet teacher=con.selectCommand(selectteacher);
    
         
//         Department
          if(department.next()){
                session.setAttribute("departmentid", department.getString("department_id"));
                session.setAttribute("departmentname", department.getString("department_type_name"));
                session.setAttribute("departmenttypeid", department.getString("department_type_id"));
                response.sendRedirect("../Department/Homepage.jsp");
             }
//         Student
         else if(student.next()){
                session.setAttribute("studentid", student.getString("student_id"));
                session.setAttribute("studentname", student.getString("student_name"));
                session.setAttribute("courseid", student.getString("course_id"));
                session.setAttribute("departmentid", student.getString("department_id"));
                response.sendRedirect("../Student/Homepage.jsp");
             }
//         Teacher
         else if(teacher.next()){
                session.setAttribute("facultyid", teacher.getString("faculty_id"));
                session.setAttribute("facultyname", teacher.getString("faculty_name"));
                session.setAttribute("facultyid", teacher.getString("faculty_id"));
                response.sendRedirect("../Faculty/Homepage.jsp");
             }
//         Admin
         else if(admin.next()){
                session.setAttribute("adminid", admin.getString("admin_id"));
                session.setAttribute("adminname", admin.getString("admin_name"));
                response.sendRedirect("../Admin/Homepage.jsp");
             }
         //         parent
         else if(parent.next()){
                session.setAttribute("parentid", parent.getString("parent_id"));
                session.setAttribute("parentname", parent.getString("parent_name"));
                response.sendRedirect("../Parent/HomePage.jsp");
             }
         else{
             out.println("Email or Password is Mismatchinng");
         }
     }
    
      out.write("\n");
      out.write("    <form method=\"post\"> \n");
      out.write("    <table border=\"2\" align=\"center\">\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    Email\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                   <input type=\"text\" name=\"txt_email\">\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                   Password\n");
      out.write("                </td>\n");
      out.write("           \n");
      out.write("                <td>\n");
      out.write("                    <input type=\"password\" name=\"txt_password\">\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"submit\" name=\"btn_submit\" value=\"Login\">\n");
      out.write("                </td>    \n");
      out.write("            \n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("    </form>\n");
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
