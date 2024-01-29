<%-- 
    Document   : EditProfile
    Created on : 29 Jan, 2024, 9:38:30 PM
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
     String select="select * from tbl_admin where admin_id='"+session.getAttribute("adminid")+"'";
     ResultSet faculty=con.selectCommand(select);
     faculty.next();
     if (request.getParameter("save")!=null){
         String facultyname=request.getParameter("name");
         String email=request.getParameter("email");
        
      
         String update="update tbl_admin set admin_name='"+facultyname+"',admin_email='"+email+"' where admin_id='"+session.getAttribute("adminid")+"'";
        //out.print(update);
         con.executeCommand(update);
         response.sendRedirect("ViewProfile.jsp");
     }
    %>
    <body>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                       Admin name
                    </td>
                    <td>
                         <input type="text" name="name" value="<%=faculty.getString("admin_name")%>">
                    </td>
                </tr>
                <tr>
                    <td>  Admin Email</td>
                    <td>
                        <input type="email" name="email" value="<%=faculty.getString("admin_email")%>">
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

    </body>
</html>
