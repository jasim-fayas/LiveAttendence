<%-- 
    Document   : MyProfile
    Created on : 29 Jan, 2024, 10:17:27 AM
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
                String pid = session.getAttribute("departmentid").toString();
                String department = " select * from tbl_department p inner join tbl_department_type q on q.department_type_id=q.department_type_id where department_id='" + pid + "' ";
              // out.print(student);
                ResultSet rss = con.selectCommand(department);
                      rss.next();

            %>
            <table border="2" align="center">
               <tr>
                   
                    <td colspan="2" align="center">
                        <img src="../Assets/Files/Department/<%=rss.getString("department_photo")%>" width="150px">
                    </td>
                </tr>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <%=rss.getString("department_type_name")%>
                    </td>
                </tr>
               
                <tr>
                <td>
                    Contact
                </td>
                <td>
                     <%=rss.getString("department_contact")%>
                </td>
                
                </tr>
                <tr>
                <td>
                   Email
                </td>
                <td>
                     <%=rss.getString("department_email")%>
                </td>
                
                </tr>
            </table>
        </form>
    </body>
</html>
