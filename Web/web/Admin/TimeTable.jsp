<%-- 
    Document   : TimeTable
    Created on : 30 Jan, 2024, 4:59:18 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<%
    ArrayList<String> days = new ArrayList<String>();
    days.add("Monday");
    days.add("Tuesday");
    days.add("Wednesday");
    days.add("Thursday");
    days.add("Friday");

    String semester = "", course = "";

    if (request.getParameter("btn_reset") != null) {
        response.sendRedirect("TimeTable.jsp");
    }


%>
<div id="tab" align="center">
    <h1 align="center">Time Table</h1>
    <form id="form1" name="form1" action="">
        <table border="1">
            <tr>

                <td colspan="2">Course
                    <select name="sel_course">
                        <option value="">-----Select-----</option>
                        <%                            String selQryzz = "select * from tbl_course";

                            ResultSet resultz = con.selectCommand(selQryzz);
                            while (resultz.next()) {
                        %>
                        <option value="<%=resultz.getString("course_id")%>"><%=resultz.getString("course_name")%></option>
                        <%
                            }
                        %>
                    </select>
                </td>
                <td colspan="3">Semester
                    <select name="sel_semester">
                        <option value="">-----Select-----</option>
                        <%                            String selQryz = "select * from tbl_semester";

                            ResultSet result = con.selectCommand(selQryz);
                            while (result.next()) {
                        %>
                        <option value="<%=result.getString("semester_id")%>"><%=result.getString("semester_name")%></option>
                        <%
                            }
                        %>
                    </select>
                </td>
                <td colspan="1">
                    <input type="submit" name="btn_submit" value="Submit" />
                </td>
                <td colspan="1">
                    <input type="submit" name="btn_reset" value="Reset" />
                </td>
            </tr>
            <%
                if (request.getParameter("btn_submit") != null) {
                    semester = request.getParameter("sel_semester");
                    course = request.getParameter("sel_course");
                    if (semester != null && !semester.isEmpty()) {
                        for (String day : days) {
            %>
            <tr>
                <td height="38"><%= day%></td>
                <%
                    for (int i = 1; i <= 5; i++) {
                        if (day.equals("Monday") && i == 4) {
                %>
                <td rowspan="6">
                    <div id="lunch">
                        <p>L</p>
                        <p>U</p>
                        <p>N</p>
                        <p>C</p>
                        <p>H</p>
                    </div>
                </td>
                <%
                    }
                %>
                <td>
                    <select id="sel_subject" onchange="submitTimetable(<%=i%>, '<%= course%>', '<%= semester%>', this.value, '<%= day%>')">
                        <option value="">Select</option>
                        <%
                            String selQry = "SELECT * FROM tbl_subject WHERE semester_id='" + semester + "' and course_id='" + course + "'";

                            ResultSet result1 = con.selectCommand(selQry);

                            while (result1.next()) {
                                String subjectId = result1.getString("subject_id");
                                String subjectName = result1.getString("subject_name");

                                String selQry1 = "SELECT * FROM tbl_timetable WHERE timetable_day='" + day + "' AND timetable_hour='" + i + "' AND semester_id='" + semester + "' AND subject_id='" + subjectId + "'";

                                ResultSet data1 = con.selectCommand(selQry1);

                                if (data1.next()) {
                        %>
                        <option selected value="<%= subjectId%>"><%= subjectName%></option>
                        <%
                        } else {
                        %>
                        <option value="<%= subjectId%>"><%= subjectName%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </td>
                <%
                    }
                %>
            </tr>
            <%
                }
            %>
        </table>
    </form>
</div>
<%
} else {
%>
<script>
    alert("Select Semester");
    window.location = "TimeTable.jsp";
</script>
<%
        }
    }


%>

<script src="../Assets/JQ/jQuery.js"></script>
<script>
    function submitTimetable(hour,cid, semester, subject, day) {
        $.ajax({
            url: "../Assets/AjaxPages/AjaxTimeTable.jsp?hour=" + hour + "&semester=" + semester + "&subject=" + subject + "&day=" + day,
            success: function(html) {
                window.location = 'TimeTable.jsp?sel_course='+cid+'&sel_semester=' + semester + '&btn_submit=Submit';
            }
        });
    }
</script>

