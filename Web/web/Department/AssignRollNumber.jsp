<%-- 
    Document   : AssignRollNumber
    Created on : 24 Feb, 2024, 9:20:22 PM
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
        <h1 align="center"> Assign Roll Number</h1>




        <form method="post">

            <table border="2" align="center">
                <tr>
                    <td>
                        Select Course
                    </td>
                    <td>
                        <select name="selcourse">
                            <option>--SELECT--</option>
                            <%
                                String sel = " select * from tbl_course where department_id='" + session.getAttribute("departmentid") + "' ";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("course_id")%>"><%=rs.getString("course_name")%></option>
                            <%
                                }
                            %>


                        </select>
                    </td>
                    <td>
                        Select Semester
                    </td>
                    <td>
                        <select name="selsemester">
                            <option>--SELECT--</option>
                            <%
                                String sel2 = " select * from tbl_semester";
                                ResultSet rss = con.selectCommand(sel2);
                                while (rss.next()) {
                            %>
                            <option value="<%=rss.getString("semester_id")%>"><%=rss.getString("semester_name")%></option>
                            <%
                                }
                            %>
                    </td>
                    <td>
                        <input type="submit" name="btn_submit" value="Search">
                    </td>
                </tr>
            </table>
            <br>
            <br>
            <br>
            <%
                if (request.getParameter("btn_submit") != null) {
                    String course = request.getParameter("selcourse");
                    String semester = request.getParameter("selsemester");
                    String qry = " select * from tbl_student p inner join tbl_course pq on p.course_id=pq.course_id where p.course_id='" + course + "' and semester_id='" + semester + "' ORDER BY p.student_name ";
                    ResultSet rsp = con.selectCommand(qry);
            %>
            <table border="2" align="center">
                <tr>
                    <td>Sl number</td>
                    <td>Student Name</td>
                    <td>Course Name</td>
                    <td>Assign Roll Number</td>
                </tr>
                <%
                    int i = 0;
                    while (rsp.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rsp.getString("student_name")%></td>
                    <td><%=rsp.getString("course_name")%></td>
                    <td>  </td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                }
            %>
        </form>
    </body>
</html>