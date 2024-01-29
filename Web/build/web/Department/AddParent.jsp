<%-- 
    Document   : AddParent
    Created on : 25 Jan, 2024, 11:11:07 PM
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
        <h1>Add Parent</h1>
        <%
            if (request.getParameter("btn_submit") != null) {
                String name = request.getParameter("txt_name");
                String contact = request.getParameter("txt_contact");
                String email = request.getParameter("txt_email");
                String password = request.getParameter("txt_password");
                String address = request.getParameter("txt_address");

                String insqry = " insert into tbl_parent (parent_name,parent_contact,parent_email,parent_password,parent_address) values ('" + name + "','" + contact + "','" + email + "','" + password + "','" + address + "') ";
              //out.print(insqry);
                if (con.executeCommand(insqry)) {

        %>
        <script>
            alert("Registraction Completed");
            window.location('AddParent.jsp');

        </script>
        <% } else {

        %>
   <script>
            alert("Registraction Failed");
            window.location('AddParent.jsp');

        </script>

        <%                  }
            }

        %>
        <form method="post">
            <table border="2">
                <tr>
                    <td>
                        Parent Name
                    </td>
                    <td>
                        <input type="text" name="txt_name">
                    </td>
                </tr>
                <tr>
                    <td>
                        Parent Contact
                    </td>
                    <td>
                        <input type="text" name="txt_contact">
                    </td>
                </tr>
                <tr>
                    <td>
                        Parent Email
                    </td>
                    <td>
                        <input type="email" name="txt_email">
                    </td>
                </tr>
                  <tr>
                    <td>
                        Parent Address
                    </td>
                    <td>
                        <textarea name="txt_address"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        Parent Password
                    </td>
                    <td>
                        <input type="password" name="txt_password">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="submit">
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>
