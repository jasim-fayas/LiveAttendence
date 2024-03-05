<%-- 
    Document   : AddSubject
    Created on : 25 Jan, 2024, 7:07:35 PM
    Author     : jasim fayas
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Subject</title>
    </head>
    <body>
        <h1>Add Subject</h1>
          <%
            if (request.getParameter("save") != null) {
               
            
                    String subject = request.getParameter("subject");
                    String course = request.getParameter("course");
                    String sem = request.getParameter("sem");
                    String department = request.getParameter("department");
                    String insert = "insert into tbl_subject (course_id,subject_name,semester_id,department_id)value('" + course + "','" + subject + "','" + sem + "','" + department + "')";
                    con.executeCommand(insert);
                }
            

            if (request.getParameter("del") != null) {
                String id = request.getParameter("del");
                String delete = "delete from tbl_subject where subject_id='" + id + "'";
                con.executeCommand(delete);
            }
           
           
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        Department
                    </td>
                    <td>
                        <select name="department" id="sel_department" onchange="getCourse(this.value)">
                            <option value="">--select--</option>
                            <%
                              
                                    String select = "select * from tbl_department p inner join tbl_department_type q on q.department_type_id=p.department_type_id ";
                                    ResultSet rs = con.selectCommand(select);
                                    while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("department_id")%>" ><%=rs.getString("department_type_name")%></option>
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
                        <select name="course" id="sel_course">
                            <option value="">--select--</option>
                           
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Semester
                    </td>
                    <td>
                        <select name="sem" id="sel_semester">
                            <option value=" ">--select--</option>
                            <%
                               
                                    String sid = request.getParameter("sid");
                                    String selsemester = "select * from tbl_semester ";
                                    ResultSet rese = con.selectCommand(selsemester);
                                    while (rese.next()) {
                            %>
                                    <option value="<%=rese.getString("semester_id")%>" ><%=rese.getString("semester_name")%></option>
                            <%
                                    }
                                
                            %>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td>
                        Subject
                    </td>
                    <td>
                        <input type="text" name="subject" >
                       
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
                        <a href="Homepage.jsp">Homepage</a>
            <table border="2">
                <tr>
                    <td>S.NO</td>
                    <td>Course</td>
                    <td>Semester</td>
                    <td>Subject</td>
                    <td colspan="2" align="center">Action</td>
                </tr>
                <%
                    String selsubject = "select * from tbl_subject s inner join tbl_course c on s.course_id=c.course_id inner join tbl_semester sem on s.semester_id=sem.semester_id";
                    ResultSet display = con.selectCommand(selsubject);
                    int i = 0;
                    while (display.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=display.getString("course_name")%></td>
                    <td><%=display.getString("semester_name")%></td>
                    <td><%=display.getString("subject_name")%></td>
                    <td><a href="AddSubject.jsp?del=<%=display.getString("subject_id")%>">Delete</a></td>
                    
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
                            function getCourse(did)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxCourse.jsp?did=" + did,
                                    success: function(html) {
                                        $("#sel_course").html(html);

                                    }
                                });
                            }

//                            function getSemester(sid)
//                            {
//                                $.ajax({
//                                    url: "../Assets/AjaxPages/AjaxSemester.jsp?sid=" + sid,
//                                    success: function(html) {
//                                        $("#sel_semester").html(html);
//
//                                    }
//                                });
//                            }
    </script>
    </body>
</html>
