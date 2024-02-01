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

    String semester = "",course="";

    if (request.getParameter("btn_reset") != null) {
        response.sendRedirect("Timetable.jsp");
    }


%>

<div id="tab" align="center">
      <title>View Time Table</title>
    <h1 align="center">Time Table</h1>
    <form id="form1" name="form1" action="">
        <table border="1">
            <tr>

              
                    </select>
                </td>
                <td colspan="3">Semester
                    <select name="sel_semester">
                        <option value="">-----Select-----</option>
                        <%                            String selQry = "select * from tbl_semester ";
                            ResultSet result = con.selectCommand(selQry);
                            while (result.next()) {
                        %>
                        <option value="<%= result.getString("semester_id")%>"><%= result.getString("semester_name")%></option>
                        <%
                            }
                        %>
                    </select>
                </td>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_submit" value="Submit" />
                </td>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_reset" value="Reset" />
                </td>
            </tr>
            <%
                if (request.getParameter("btn_submit") != null) {
                    semester = request.getParameter("sel_semester");
                   
                    if (semester != null && !semester.isEmpty()) {
            %>
            <tr>
                <td>Day</td>
                <td>9:30-10:30</td>
                <td>10:30-11:30</td>
                <td>11:45-12:45</td>
                <td>12:45-1:45</td>
                <td>1:45-2:30</td>
                <td>2:30-3:30</td>
            </tr>
            <%
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
                    <%
                        String selQry1 = "SELECT * FROM tbl_timetable t INNER JOIN tbl_subject s ON t.subject_id = s.subject_id WHERE timetable_day='" + day + "' AND timetable_hour='" + i + "' AND s.semester_id='" + semester + "' and course_id='"+session.getAttribute("courseid")+"'";
                        ResultSet data1 = con.selectCommand(selQry1);

                        if (data1.next()) {
                            out.print(data1.getString("subject_name"));
                        } else {
                            out.print("Not Decide");
                        }

                    %>
                </td>
                <%                                        }
                %>
            </tr>
            <%
                }
            %>
            <%
            } else {
            %>
            <script>
                alert("Select Semester");
                window.location = "Timetable.jsp";
            </script>
            <%
                    }
                }
            %>
        </table>
    </form>
</div>

