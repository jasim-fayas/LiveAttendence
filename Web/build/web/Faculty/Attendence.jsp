<%-- 
    Document   : Attendence
    Created on : 8 Feb, 2024, 11:29:37 AM
    Author     : jasim fayas
--%>
<!DOCTYPE html>
<head>
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
    </head>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    String date = request.getParameter("txt_date");
    if (date == null || date.isEmpty()) {
        date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }
    int course = 0;
    
    if (request.getParameter("btn_reset") != null) {
        date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        course = 0;
    }
%> 

<body>
    <div id="tab" align="center">
        <h1 align="center">Attendance</h1>
        <form method="post">
            <table border="1">
                <tr>
                     <td>
                        <label for="txt_course">Semester</label>
                        <select required name="txt_semester" id="txt_semester ">
                            <option value="">--select--</option>
                            <%
                                String selQry2 = "select * from tbl_semester";
                                ResultSet result = con.selectCommand(selQry2);
                                while (result.next()) {
                                    int semesterId = result.getInt("semester_id");
                                    String semesterName = result.getString("semester_name");
                            %>
                            <option value="<%= semesterId%>"><%= semesterName%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <label for="txt_course">Course</label>
                        <select required name="txt_course" id="txt_course">
                            <option value="">--select--</option>
                            <%
                                String selQry1 = "select * from tbl_course";
                                ResultSet resulc = con.selectCommand(selQry1);
                                while (resulc.next()) {
                                    int courseId = resulc.getInt("course_id");
                                    String courseName = resulc.getString("course_name");
                            %>
                            <option value="<%= courseId%>"><%= courseName%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        Date
                        <input name='txt_date' id='txt_date' type="date" value="<%= date%>" max="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                    </td>

                    <td align="center">
                        <input type="submit" name="btn_search" id="btn_search" value="Search" />
                        <input type="submit" name="btn_reset" id="btn_reset" value="Reset" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table width="200" border="1">
                <tr>
                    <td>Sl.No</td>
                    <td>Name</td>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                </tr>
                <%
                    if (request.getParameter("btn_search") != null) {
                        int i = 0;
                        date = request.getParameter("txt_date");
                        course = Integer.parseInt(request.getParameter("txt_course"));
                        String semester = request.getParameter("txt_semester");
                        String selQry = "select * from tbl_student s inner join tbl_course se on se.course_id=s.course_id where s.course_id='" + course + "' and semester_id='"+semester+"'";
                        ResultSet res = con.selectCommand(selQry);
                        while (res.next()) {
                            i++;
                            String studentName = res.getString("student_name");
                            int studentId = res.getInt("student_id");
                %>
                <tr> 
                    <td><%= i%></td>
                    <td><%= studentName%></td>
                    <%
                        for (int j = 1; j <= 6; j++) {
                            String selQry12 = "SELECT * FROM `tbl_attendance` where student_id='" + studentId + "' and attendance_date='" + date + "' and attendance_hour='" + j + "'";
                            ResultSet data1 = con.selectCommand(selQry12);
                            boolean checked = data1.next();
                    %>
                    <td><input type="checkbox" <%= (checked) ? "checked" : ""%> onchange="markAttendance(<%= j%>, <%= studentId%>)"/></td>
                        <% } %>
                </tr>
                <% }
                    }%>
            </table>
        </form>
    </div>
    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
                        function markAttendance(hour, studid)
                        {

                            var date = document.getElementById("txt_date").value;
                            $.ajax({
                                url: "../Assets/AjaxPages/AjaxAttendance.jsp?hour=" + hour + "&studid=" + studid + "&date=" + date,
                                success: function(html) {
                                    // alert(html)
                                }
                            });
                        }
    </script>
</body>
</html>
