<%-- 
    Document   : AddAdmin
    Created on : 25 Jan, 2024, 5:48:41 PM
    Author     : jasim fayas
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Admin</title>
    </head>
    <body>
        <h1>Add Admin</h1>
           <%
            if (request.getParameter("btn_submit") != null) {
                String name = request.getParameter("txt_name");
              
                String email = request.getParameter("txt_email");
      
                String password = request.getParameter("txt_password");
                String InsQry = " insert into tbl_admin (admin_name,admin_email,admin_password) values ('" + name + "','" + email + "','" + password + "')";
              //  out.print(InsQry);
                if (con.executeCommand(InsQry)) {

        %>
        <script>
            alert("Inserted")
             window.location("AddAdmin.jsp");
        </script>
        <%        } else {

        %>
        <script>
            alert("Failed")
            out.print(InsQry);
            window.location("AddAdmin.jsp");
        </script>
        <%                }
            }

            if (request.getParameter("id") != null) {

                String DelQry = " delete from tbl_admin where admin_id='" + request.getParameter("id") + "'";
                if (con.executeCommand(DelQry)) {

        %>
        <script>
            alert("Deleted")
            window.location("AddAdmin.jsp");
        </script>
        <%        } else {
        %>
        <script>
            alert("Failed")

            window.location("AddAdmin.jsp");
        </script>
        <%                }
            }


        %>
        <form method="post">
            <br>
            <table border="2">
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <input type="text" name="txt_name" id="txt_name">
                    </td>
                </tr>
               
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <input type="email" name="txt_email" id="txt_email">
                    </td>
                </tr>
                <tr>
                    <td>
                        Password
                    </td>
                    <td>
                    <input type="password" name="txt_password" id="txt_password">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" id="btn_submit">
                    </td>
                </tr>
            </table>
            <br><br>
            <table border="2">
                <tr>
                    <td>
                        Sl.number
                    </td>
                    <td>
                        Name
                    </td>
                   
                    <td>
                        Email
                    </td>
                  
                    <td>
                        Action
                    </td>
                </tr>   <%              
            int i = 0;
                    String SelQry = " select * from tbl_admin";
                    ResultSet rs = con.selectCommand(SelQry);

                    while (rs.next()) {
                        i++;

                %>

                <tr>
                    <td>
                        <%=i%>
                    </td>
                    <td>
                        <%=rs.getString("admin_name")%>
                    </td>
                  
                    <td>
                        <%=rs.getString("admin_email")%>
                    </td>
                   
                    <td>
                        <a href="AddAdmin.jsp?id=<%=rs.getString("admin_id")%>">Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    </body>
</html>
