<%-- 
    Document   : EditProfile
    Created on : 28 Jan, 2024, 11:54:36 PM
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
     String select="select * from tbl_faculty where faculty_id='"+session.getAttribute("facultyid")+"'";
     ResultSet faculty=con.selectCommand(select);
     faculty.next();
     if (request.getParameter("save")!=null){
         String facultyname=request.getParameter("name");
         String email=request.getParameter("email");
         String contact=request.getParameter("contact");
      
         String update="update tbl_faculty set faculty_name='"+facultyname+"',faculty_email='"+email+"',faculty_contact='"+contact+"'";
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
                         <input type="text" name="name" value="<%=faculty.getString("faculty_name")%>">
                    </td>
                </tr>
                <tr>
                    <td>Faculty Email</td>
                    <td>
                        <input type="email" name="email" value="<%=faculty.getString("faculty_email")%>">
                    </td>
                </tr>
                <tr>
                    <td>Faculty Contact</td>
                    <td>
                        <input type="number" name="contact" value="<%=faculty.getString("faculty_contact")%>">
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
