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
      response.setContentType("text/html");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" >\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"UTF-8\">\n");
      out.write("  <title>Login</title>\n");
      out.write(" \n");
      out.write("\n");
      out.write("</head>\n");

     if(request.getParameter("btn_submit")!=null){
             String email=request.getParameter("txt_email");
         String password=request.getParameter("txt_password");
        
         String selectadmin="select * from tbl_admin where admin_email='"+email+"' and admin_password='"+password+"'";
         ResultSet admin=con.selectCommand(selectadmin);
        
         String selectdepartment="select * from tbl_department d inner join tbl_department_type dt on d.department_type_id=dt.department_type_id   where department_email='"+email+"' and department_password='"+password+"'";
         ResultSet department=con.selectCommand(selectdepartment);
         
         String selectparent="select * from tbl_parent where parent_email='"+email+"' and parent_password='"+password+"'";
         ResultSet parent=con.selectCommand(selectparent);
         
         String selectstudent="select * from tbl_student s inner join tbl_course c on s.course_id=c.course_id inner join tbl_department dep on s.department_id=dep.department_id where student_email='"+email+"' and student_password='"+password+"'";
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
                 session.setAttribute("semesterid", student.getString("semester_id"));
                response.sendRedirect("../Student/Homepage.jsp");
             }
//         Teacher
         else if(teacher.next()){
                session.setAttribute("facultyid", teacher.getString("faculty_id"));
                session.setAttribute("facultyname", teacher.getString("faculty_name"));
                session.setAttribute("departmentid", teacher.getString("department_id"));
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
      out.write("    \n");
      out.write("<body>\n");
      out.write("<!-- partial:index.partial.html -->\n");
      out.write("<style>\n");
      out.write("\tbody {\n");
      out.write("  background-color:rgba(69, 105, 144, 0.15);\n");
      out.write("  font-family: \"Asap\", sans-serif;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login {\n");
      out.write("  overflow: hidden;\n");
      out.write("  background-color: white;\n");
      out.write("  padding: 40px 30px 30px 30px;\n");
      out.write("  border-radius: 10px;\n");
      out.write("  position: absolute;\n");
      out.write("  top: 50%;\n");
      out.write("  left: 50%;\n");
      out.write("  width: 400px;\n");
      out.write("  -webkit-transform: translate(-50%, -50%);\n");
      out.write("  -moz-transform: translate(-50%, -50%);\n");
      out.write("  -ms-transform: translate(-50%, -50%);\n");
      out.write("  -o-transform: translate(-50%, -50%);\n");
      out.write("  transform: translate(-50%, -50%);\n");
      out.write("  -webkit-transition: -webkit-transform 300ms, box-shadow 300ms;\n");
      out.write("  -moz-transition: -moz-transform 300ms, box-shadow 300ms;\n");
      out.write("  transition: transform 300ms, box-shadow 300ms;\n");
      out.write("  box-shadow: 5px 10px 10px rgba(2, 128, 144, 0.2);\n");
      out.write("}\n");
      out.write(".login::before, .login::after {\n");
      out.write("  content: \"\";\n");
      out.write("  position: absolute;\n");
      out.write("  width: 600px;\n");
      out.write("  height: 600px;\n");
      out.write("  border-top-left-radius: 40%;\n");
      out.write("  border-top-right-radius: 45%;\n");
      out.write("  border-bottom-left-radius: 35%;\n");
      out.write("  border-bottom-right-radius: 40%;\n");
      out.write("  z-index: -1;\n");
      out.write("}\n");
      out.write(".login::before {\n");
      out.write("  left: 40%;\n");
      out.write("  bottom: -130%;\n");
      out.write("  background-color: rgb(0, 255, 255);\n");
      out.write("  -webkit-animation: wawes 6s infinite linear;\n");
      out.write("  -moz-animation: wawes 6s infinite linear;\n");
      out.write("  animation: wawes 6s infinite linear;\n");
      out.write("}\n");
      out.write(".login::after {\n");
      out.write("  left: 35%;\n");
      out.write("  bottom: -125%;\n");
      out.write("  background-color: rgba(2, 128, 144, 0.2);\n");
      out.write("  -webkit-animation: wawes 7s infinite;\n");
      out.write("  -moz-animation: wawes 7s infinite;\n");
      out.write("  animation: wawes 7s infinite;\n");
      out.write("}\n");
      out.write(".login > input {\n");
      out.write("  font-family: \"Asap\", sans-serif;\n");
      out.write("  display: block;\n");
      out.write("  border-radius: 5px;\n");
      out.write("  font-size: 16px;\n");
      out.write("  background: white;\n");
      out.write("  width: 100%;\n");
      out.write("  border: 0;\n");
      out.write("  padding: 10px 10px;\n");
      out.write("  margin: 15px -10px;\n");
      out.write("}\n");
      out.write(".login > button {\n");
      out.write("  font-family: \"Asap\", sans-serif;\n");
      out.write("  cursor: pointer;\n");
      out.write("  color: #fff;\n");
      out.write("  font-size: 16px;\n");
      out.write("  text-transform: uppercase;\n");
      out.write("  width: 80px;\n");
      out.write("  border: 0;\n");
      out.write("  padding: 10px 0;\n");
      out.write("  margin-top: 10px;\n");
      out.write("  margin-left: -5px;\n");
      out.write("  border-radius: 5px;\n");
      out.write("  background-color:rgb(0, 255, 255);\n");
      out.write("  -webkit-transition: background-color 300ms;\n");
      out.write("  -moz-transition: background-color 300ms;\n");
      out.write("  transition: background-color 300ms;\n");
      out.write("}\n");
      out.write(".login > button:hover {\n");
      out.write("  background-color: rgba(2, 128, 144, 0.2);\n");
      out.write("}\n");
      out.write("\n");
      out.write("@-webkit-keyframes wawes {\n");
      out.write("  from {\n");
      out.write("    -webkit-transform: rotate(0);\n");
      out.write("  }\n");
      out.write("  to {\n");
      out.write("    -webkit-transform: rotate(360deg);\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("@-moz-keyframes wawes {\n");
      out.write("  from {\n");
      out.write("    -moz-transform: rotate(0);\n");
      out.write("  }\n");
      out.write("  to {\n");
      out.write("    -moz-transform: rotate(360deg);\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("@keyframes wawes {\n");
      out.write("  from {\n");
      out.write("    -webkit-transform: rotate(0);\n");
      out.write("    -moz-transform: rotate(0);\n");
      out.write("    -ms-transform: rotate(0);\n");
      out.write("    -o-transform: rotate(0);\n");
      out.write("    transform: rotate(0);\n");
      out.write("  }\n");
      out.write("  to {\n");
      out.write("    -webkit-transform: rotate(360deg);\n");
      out.write("    -moz-transform: rotate(360deg);\n");
      out.write("    -ms-transform: rotate(360deg);\n");
      out.write("    -o-transform: rotate(360deg);\n");
      out.write("    transform: rotate(360deg);\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("a {\n");
      out.write("  text-decoration: none;\n");
      out.write("  color: rgba(255, 255, 255, 0.6);\n");
      out.write("  position: absolute;\n");
      out.write("  right: 10px;\n");
      out.write("  bottom: 10px;\n");
      out.write("  font-size: 12px;\n");
      out.write("}\n");
      out.write("\t</style>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<form class=\"login\" method=\"post\">\n");
      out.write("  <input type=\"email\" placeholder=\"Email\" name=\"txt_email\" required>\n");
      out.write("  <input type=\"password\" placeholder=\"Password\" required name=\"txt_password\" >\n");
      out.write("  <button type=\"submit\" name=\"btn_submit\">Login</button>\n");
      out.write("</form>");
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
