<%-- 
    Document   : ViewAddedParents
    Created on : 25 Jan, 2024, 11:12:07 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Added Parents</title>
    </head>
    <body>
        <h1>View Added Parents</h1>
        <form method="post">
            <table border="2">
                <tr>
                    <td>
                        Sl number
                    </td>
                    <td>
                        Parent Name
                    </td>
                    <td>
                        Parent Contact
                    </td>
                    <td>
                        Parent Email
                    </td>
                    <td>
                        Add Student
                    </td>
                </tr>
                <%
                    String parent = " select * from tbl_parent where department_id='"+ session.getAttribute("departmentid")+"'";
                    //out.print(parent);
                    ResultSet rs = con.selectCommand(parent);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                 
                    <td>
                        <%=i%>   
                    </td>
                    <td>
                        <%=rs.getString("parent_name")%>
                    </td>
                    <td>
                        <%=rs.getString("parent_contact")%>
                    </td>
                    <td>
                        <%=rs.getString("parent_email")%>
                    </td>
                    <td>
                        <a href="AddStudent.jsp?id=<%=rs.getString("parent_id")%>">Add Student</a>
                    </td>
                    <%
                        }
                    %>
                </tr>
            </table>
        </form>
    </body>
</html>
