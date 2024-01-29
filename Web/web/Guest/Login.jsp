<%-- 
    Document   : Login
    Created on : 25 Jan, 2024, 11:15:03 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1 align="center">Login</h1>
        <%
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
    %>
    <form method="post"> 
    <table border="2" align="center">
            <tr>
                <td>
                    Email
                </td>
                <td>
                   <input type="text" name="txt_email">
                </td>
            </tr>
            <tr>
                <td>
                   Password
                </td>
           
                <td>
                    <input type="password" name="txt_password">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Login">
                </td>    
            
            </tr>
        </table>
    </form>
    </body>
</html>
