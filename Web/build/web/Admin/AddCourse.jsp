<%-- 
    Document   : AddCourse
    Created on : 25 Jan, 2024, 6:39:45 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Course</title>


    </head>
    <body>
        <%
            if (request.getParameter("save") != null) {

                String course = request.getParameter("course");

                String departmenttype = request.getParameter("department_id");
                String insert = "insert into tbl_course (course_name,department_id)values ('" + course + "','" + departmenttype + "')";
                if (con.executeCommand(insert)) {
                    //  out.print(insert);
        %>
        <script>
            alert(" Course Added");
            window.location('AddCourse.jsp');

        </script>
        <% } else {

        %>
        <script>
            alert(" Course Submission failed");
            window.location('AddCourse.jsp');

        </script>
        <%        }
            }

        %>


        <%             if (request.getParameter("del") != null) {
                String id = request.getParameter("del");
                String delete = "delete from tbl_course where course_id='" + id + "'";
                if (con.executeCommand(delete)) {
        %>

        <script>
            alert(" deletion completed");
            window.location('AddCourse.jsp');
        </script>




        <% } else {

        %>
        <script>
            alert("Deletion Failed");
            window.location('AddCourse.jsp');

        </script>
        <%        }
            }


        %>
        <form method="post">
            <table border="1" align="center">

                <tr>
                    <td>
                        Department Type
                    </td>
                    <td>
                        <select name="department_id">
                            <option value="">--select--</option>
                            <%                             String selectdepartmenttype = "select * from tbl_department_type d inner join tbl_department p on d.department_type_id=p.department_type_id";
                                ResultSet dep = con.selectCommand(selectdepartmenttype);
                                while (dep.next()) {
                            %>
                            <option value="<%=dep.getString("department_id")%>"><%=dep.getString("department_type_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Course
                    </td>
                    <td>
                        <input type="text" name="course" >

                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
            <table border="1">
                <tr>
                    <th>S.NO</th>

                    <th>Department Type</th>
                    <th>Course</th>

                    <th colspan="2" align="center">Action</th>
                </tr>
                <%
                    String selcategory = "select * from tbl_course c  inner join tbl_department d on c.department_id=d.department_id inner join tbl_department_type  pq on pq.department_type_id=d.department_type_id";
                    ResultSet display = con.selectCommand(selcategory);
                    int i = 0;
                    while (display.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>

                    <td><%=display.getString("department_type_name")%></td>
                    <td><%=display.getString("course_name")%></td>  
                    <td><a href="AddCourse.jsp?del=<%=display.getString("course_id")%>">Delete</a></td>
                    <%
                        }
                    %>
            </table>
        </form>
    </body>
</html>
