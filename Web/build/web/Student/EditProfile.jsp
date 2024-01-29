<%-- 
    Document   : EditProfile
    Created on : 29 Jan, 2024, 1:41:17 AM
    Author     : jasim fayas
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <h1>Edit Profile</h1>
        
        <%
     String select="select * from tbl_student where student_id='"+session.getAttribute("studentid")+"'";
     ResultSet faculty=con.selectCommand(select);
     faculty.next();
     if (request.getParameter("save")!=null){
         String facultyname=request.getParameter("name");
         String email=request.getParameter("email");
         String contact=request.getParameter("contact");
      
         String update="update tbl_student set student_name='"+facultyname+"',student_email='"+email+"',student_contact='"+contact+"'";
        //out.print(update);
         con.executeCommand(update);
         response.sendRedirect("MyProfile.jsp");
     }
    %>
    <body>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        Faculty name
                    </td>
                    <td>
                         <input type="text" name="name" value="<%=faculty.getString("student_name")%>">
                    </td>
                </tr>
                <tr>
                    <td>Faculty Email</td>
                    <td>
                        <input type="email" name="email" value="<%=faculty.getString("student_email")%>">
                    </td>
                </tr>
                <tr>
                    <td>Faculty Contact</td>
                    <td>
                        <input type="number" name="contact" value="<%=faculty.getString("student_contact")%>">
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
