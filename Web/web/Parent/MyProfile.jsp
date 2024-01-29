<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>parent Profile</title>
    </head>
    <body>
        <h1>My Profile</h1>
        <form method="post">
            <%
                String pid = session.getAttribute("parentid").toString();
                String student = " select * from tbl_parent where parent_id='" + pid + "' ";
              // out.print(student);
                ResultSet rss = con.selectCommand(student);
                      rss.next();

            %>
            <table border="2" align="center">
               
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <%=rss.getString("parent_name")%>
                    </td>
                </tr>
               
                <tr>
                <td>
                    Contact
                </td>
                <td>
                     <%=rss.getString("parent_contact")%>
                </td>
                
                </tr>
                <tr>
                <td>
                   Email
                </td>
                <td>
                     <%=rss.getString("parent_email")%>
                </td>
                
                </tr>
            </table>
        </form>
    </body>
</html>
