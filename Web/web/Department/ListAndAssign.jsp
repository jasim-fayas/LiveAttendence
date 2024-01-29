<%-- 
    Document   : ListAndAssign
    Created on : 27 Jan, 2024, 11:15:51 PM
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
        <h1>List And Assign</h1>
        <form method="post">
            <table border="2">
                <tr>
                    <td>
                        Sl number
                    </td>
                    <td>
                        Faculty Photo
                    </td>
                    <td>
                        Faculty Name
                    </td>
                    <td>
                        faculty Assigned Subjects And Semester
                    </td>
                    <td>
                        Action
                    </td>
                </tr>
                <%
                    String select = " select * from tbl_faculty where department_id='" + session.getAttribute("departmentid") + "'";
                    //  out.print(select);
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td>
                        <%=i%>
                    </td> 
                    <td>
                        <img src="../Assets/Files/Teacher/<%=rs.getString("faculty_photo")%>" width="150px">
                    </td>
                    <td>
                        <%=rs.getString("faculty_name")%>
                    </td>
                   
                    <td>
                         <%
                        String assigned = " select * from tbl_faculty p inner join tbl_assign pq on p.faculty_id=pq.faculty_id inner join tbl_subject pqr on pq.subject_id=pqr.subject_id inner join tbl_semester pqrs on pq.semester_id=pqrs.semester_id where p.department_id='" + session.getAttribute("departmentid") + "'";
                        ResultSet rss = con.selectCommand(assigned);
                        while (rss.next()) {
                    %>
                    <%=rss.getString("subject_name")%> &nbsp;  <%=rss.getString("semester_name")%> <br>
                           <%
                        }
                    %>
                    </td>
                 
                    <td>
                        <a href="AssignFaculty.jsp?fid=<%=rs.getString("faculty_id")%>">Assign</a>
                    </td>
                </tr>
                <%
                        }
                    
                %>
            </table>
        </form>
    </body>
</html>
