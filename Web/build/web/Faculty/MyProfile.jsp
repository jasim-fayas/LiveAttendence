<%-- 
    Document   : MyProfile
    Created on : 28 Jan, 2024, 9:48:47 PM
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
         <h1>My Profile</h1>
        <form method="post">
            <%
                String pid = session.getAttribute("facultyid").toString();
                String faculty = " select * from tbl_faculty where faculty_id='" + pid + "' ";
              // out.print(student);
                ResultSet rss = con.selectCommand(faculty);
                      rss.next();

            %>
            <table border="2" align="center">
               <tr>
                   
                    <td colspan="2" align="center">
                        <img src="../Assets/Files/Teacher/<%=rss.getString("faculty_photo")%>" width="150px">
                    </td>
                </tr>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <%=rss.getString("faculty_name")%>
                    </td>
                </tr>
               
                <tr>
                <td>
                    Contact
                </td>
                <td>
                     <%=rss.getString("faculty_contact")%>
                </td>
                
                </tr>
                <tr>
                <td>
                   Email
                </td>
                <td>
                     <%=rss.getString("faculty_email")%>
                </td>
                
                </tr>
            </table>
        </form>
    </body>
</html>
