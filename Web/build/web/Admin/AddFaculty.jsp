<%-- 
    Document   : AddFaculty
    Created on : 25 Jan, 2024, 10:19:16 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Faculty</title>
    </head>
    <body>
         <h1 align="center">Add Teacher</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/AddFacultyActionPage.jsp">
            <table border="2" align="center">
                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="name">
                    </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td>
                        <input type="number" name="contact">
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <input type="email" name="email">
                    </td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td>
                        <input type="file" name="photo">
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea name="address"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="district" onchange="getPlace(this.value)">
                            <option value="">---select---</option>
                            <%
                             String selectdistrict="select * from tbl_district";
                             ResultSet objdistrict=con.selectCommand(selectdistrict);
                             while(objdistrict.next())
                             {
                            %>
                            <option value="<%=objdistrict.getString("district_id")%>"><%=objdistrict.getString("district_name")%></option>
                            <%
                             }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="place" id="sel_place">
                            <option value="">---select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <input type="radio" name="gender" value="male">Male
                        <input type="radio" name="gender" value="female">Female
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td>
                        <input type="date" name="dob">
                    </td>
                </tr>
                <tr>
                    <td>About</td>
                    <td>
                        <textarea name="about"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <select name="department">
                            <option value="">---select---</option>
                            <%
                             String selectdepartment="select * from tbl_department d inner join tbl_department_type dp on d.department_type_id=dp.department_type_id ";
                             ResultSet objdepartment=con.selectCommand(selectdepartment);
                             while(objdepartment.next())
                             {
                            %>
                            <option value="<%=objdepartment.getString("department_id")%>"><%=objdepartment.getString("department_type_name")%></option>
                            <%
                             }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="password">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
   
    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
        function getPlace(did)
        {
            $.ajax({
                url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                success: function(html) {
                    $("#sel_place").html(html);

                }
            });
        }
    </script>
    </body>
</html>
