<%-- 
    Document   : ViewAddedFaculty
    Created on : 25 Jan, 2024, 10:52:43 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Added Faculties</title>
    </head>
    <body>
        <h1>View Added Faculties</h1>
         <h1>Teachers</h1>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <th>SI.NO</th>
                    <th>NAME</th>
                    <th>ABOUT</th>
                   
                </tr>
                <%
                 String select="select * from tbl_faculty where department_id='"+session.getAttribute("did")+"'";
                 ResultSet teacher=con.selectCommand(select);
                 int i=0;
                 while(teacher.next())
                 {
                     i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=teacher.getString("teacher_name")%></td>
                    <td><%=teacher.getString("teacher_about")%></td>
                    
                </tr>
                <%
                 }
                %>
            </table>
        </form>
    </body>
</html>
