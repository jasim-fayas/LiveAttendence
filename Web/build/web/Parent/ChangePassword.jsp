<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <h1>Change Password</h1>
        <%
            String fid = session.getAttribute("parentid").toString();
            String department = " select * from tbl_parent where parent_id='" + fid + "'";
            ResultSet rs = con.selectCommand(department);
            if (rs.next()) {
                String dbpass = rs.getString("parent_password");

                String oldpass = request.getParameter("txt_oldpassword");
                String newpass = request.getParameter("txt_newpassword");
                String confirmpass = request.getParameter("txt_confirmpassword");

//                 out.println("dbpass: " + dbpass);
//    out.println("oldpass: " + oldpass);
//    out.println("newpass: " + newpass);
//    out.println("confirmpass: " + confirmpass);
                if (request.getParameter("btn_submit") != null) {

                    if (oldpass.equals(dbpass)) {

                        if (newpass.equals(confirmpass)) {

                            String update = " update tbl_parent set parent_password='" + newpass + "' where parent_id='" + fid + "'";
                            if (con.executeCommand(update)) {
        %>
        <script>
            alert("Password Updated");
            window.location('ChangePassword.jsp');
        </script>
        <%
        } else {
        %>
        <script>
            alert("Password Updation Failed");
            window.location('ChangePassword.jsp');
        </script>
        <%
            }
        } else {
        %>
        <script>
            alert("Please Check Confirm Password ");
            window.location('ChangePassword.jsp');
        </script> 
        <%
            }
        } else {
        %>
        <script>
            alert("Please enter correct old password ");
            window.location('ChangePassword.jsp');
        </script> 
        <%
                    }
                }
            }

        %>
        <form method="post">
            <table border="2">
                <tr>
                    <td>
                        Old Password
                    </td>
                    <td>
                        <input type="password" name="txt_oldpassword">

                    </td>
                </tr>
                <tr>
                    <td>
                        New Password
                    </td>
                    <td>
                        <input type="password" name="txt_newpassword">
                    </td>
                </tr>  <tr>
                    <td>
                        Confirm Password
                    </td>
                    <td>
                        <input type="password" name="txt_confirmpassword">
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
