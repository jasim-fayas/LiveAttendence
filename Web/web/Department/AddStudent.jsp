<%-- 
    Document   : AddStudent
    Created on : 25 Jan, 2024, 11:11:20 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Student</title>
    </head>
    <body>
        <h1 align="center">Add Student</h1>
         <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/AddStudentActionPage.jsp">
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
                    <td>Course</td>
                    <td>
                        <select name="course">
                            <option value="">---select---</option>
                             <%
                             String cid = session.getAttribute("departmenttypeid").toString();
                           
                             String selectcourse="select * from tbl_course p inner join tbl_department q on p.department_id=q.department_id inner join tbl_department_type pqr on q.department_type_id=pqr.department_type_id where pqr.department_type_id='"+cid+"'";
                             
                             ResultSet objcourse=con.selectCommand(selectcourse);
                             while(objcourse.next())
                             {
                            %>
                            <option value="<%=objcourse.getString("course_id")%>"><%=objcourse.getString("course_name")%></option>
                            <%
                             }
                            %>
                        </select>
                    </td>
                </tr><%
                 // out.println(cid);
                  //out.println(selectcourse);
                %>
               
                <tr>
                    <td>Password</td>
                    <td>
                        <input type="password" name="password">
                    </td>
                </tr>
                <tr>
                    <td>
                        Parent ID
                    </td>
                     <td>
                         <input type="text" name="parent_id" value="<%=request.getParameter("id")%>">
                   
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
    </body>
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
