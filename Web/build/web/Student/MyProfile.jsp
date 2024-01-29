<%-- 
    Document   : MyProfile
    Created on : 28 Jan, 2024, 1:39:57 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Profile</title>
    </head>
    <body>
        <h1>My Profile</h1>
        <form method="post">
            <%
                String sid = session.getAttribute("studentid").toString();
                String student = " select * from tbl_student p inner join tbl_department q on p.department_id=q.department_id inner join tbl_department_type pqr on q.department_type_id=pqr.department_type_id where student_id='" + sid + "' ";
              //out.print(student);
                ResultSet rss = con.selectCommand(student);
                      rss.next();

            %>
            <table border="2" align="center">
                <tr>
                    <td colspan="2" align="center">
                        <img src="../Assets/Files/Student/<%=rss.getString("student_photo")%>" width="150px" align="center" >
                    </td>
                </tr>
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <%=rss.getString("student_name")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Department
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
                     <%=rss.getString("student_contact")%>
                </td>
                
                </tr>
            </table>
        </form>
    </body>
</html>
