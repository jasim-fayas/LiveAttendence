<%-- 
    Document   : EditProfile
    Created on : 29 Jan, 2024, 9:29:57 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit Profile</h1>
            <%
     String select="select * from tbl_parent where parent_id='"+session.getAttribute("parentid")+"'";
     ResultSet faculty=con.selectCommand(select);
     faculty.next();
     if (request.getParameter("save")!=null){
         String facultyname=request.getParameter("name");
         String email=request.getParameter("email");
         String contact=request.getParameter("contact");
      
         String update="update tbl_parent set parent_name='"+facultyname+"',parent_email='"+email+"',parent_contact='"+contact+"' where parent_id='"+session.getAttribute("parentid")+"'";
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
                       parent name
                    </td>
                    <td>
                         <input type="text" name="name" value="<%=faculty.getString("parent_name")%>">
                    </td>
                </tr>
                <tr>
                    <td> parent Email</td>
                    <td>
                        <input type="email" name="email" value="<%=faculty.getString("parent_email")%>">
                    </td>
                </tr>
                <tr>
                    <td>parent Contact</td>
                    <td>
                        <input type="number" name="contact" value="<%=faculty.getString("parent_contact")%>">
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

    </body>
</html>
