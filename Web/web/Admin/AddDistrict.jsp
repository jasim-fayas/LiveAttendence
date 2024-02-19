<%-- 
    Document   : AddAdmin
    Created on : 25 Jan, 2024, 5:37:03 PM
    Author     : jasim fayas
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add District</title>
    </head>
    <body>
        <h1>Add District</h1>

        <%

            if (request.getParameter("btn_submit") != null) {
                String District = request.getParameter("txt_district");
                String insQry = "insert into tbl_district (district_name) values('" + District + "')";

                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Inserted");
            window.location.href = "AddDistrict.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location.href = "AddDistrict.jsp";
        </script>






        <%
                }
            }

            if (request.getParameter("id") != null) {
                String id = request.getParameter("id");
                String DelQry = " delete from tbl_district where district_id='" + id + "'";
                if (con.executeCommand(DelQry)) {
        %>
        <script>
            alert("Deteted");
            window.loaction.href("AddDistrict.jsp");

        </script>
        <%
        } else {
        %>
        <script>
            alert("Deletion Failed");
            window.loaction.href("AddDistrict.jsp");

        </script>
        <%
                }
            }
        %>
    <body>

        <form method="post">
            <table border="2">
                <tr>
                    <td>District</td>
                    <td>
                        <input type="text" name="txt_district" id="txt_district" >

                    </td> 

                </tr>

                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" id="btn_submit" value="submit"></td>

                </tr>
            </table>
        </form>
        <br>
        <table border="2">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Action</td>
            </tr>
            <%
                String selQry = "select * from tbl_district";
                ResultSet rs = con.selectCommand(selQry);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td>
                    <a href="AddDistrict.jsp?id=<%=rs.getString("district_id")%>">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
