<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<%@ page import="java.io.PrintWriter" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Allotted Hours</title>
</head>
<body>
    <h1>Hello Faculty</h1>
    <form method="post">

        <%
            ArrayList<String> days = new ArrayList<String>();
            days.add("Monday");
            days.add("Tuesday");
            days.add("Wednesday");
            days.add("Thursday");
            days.add("Friday");
            String id = session.getAttribute("facultyid").toString();

            // Retrieve timetable data with course name
            String timetableqry = "SELECT t.timetable_day, t.timetable_hour, s.subject_name, c.course_name FROM tbl_timetable t " +
                                   "INNER JOIN tbl_subject s ON t.subject_id = s.subject_id " +
                                   "INNER JOIN tbl_course c ON s.course_id = c.course_id " +
                                   "INNER JOIN tbl_assign a ON s.subject_id = a.subject_id " +
                                   "WHERE a.faculty_id='" + id + "'";
            ResultSet timetableResult = con.selectCommand(timetableqry);
            ArrayList<String[]> timetableData = new ArrayList<String[]>(); // Specify the type explicitly
            while (timetableResult.next()) {
                String[] rowData = new String[4];
                rowData[0] = timetableResult.getString("timetable_day");
                rowData[1] = timetableResult.getString("timetable_hour");
                rowData[2] = timetableResult.getString("subject_name");
                rowData[3] = timetableResult.getString("course_name");
                timetableData.add(rowData);
            }
        %>

        <table border="2">
            <tr>
                <td>Day</td>
                <td>9:30-10:30</td>
                <td>10:30-11:30</td>
                <td>11:45-12:45</td>
                <td>1:45-2:30</td>
                <td>2:30-3:30</td>
            </tr>
            <% for (String day : days) { %>
            <tr>
                <td height="38"><%= day %></td>
                <% for (int i = 1; i <= 5; i++) { %>
                <td>
                    <% 
                        boolean found = false;
                        for (String[] rowData : timetableData) {
                            if (rowData[0].equals(day) && rowData[1].equals(Integer.toString(i))) {
                                out.print(rowData[2] + "<br>"); // Subject name
                                out.print(rowData[3]); // Course name
                                found = true;
                                break;
                            }
                        }
                        if (!found) {
                            out.print("Free Hour");
                        }
                    %>
                </td>
                <% } %>
            </tr>
            <% } %>
        </table>
    </form>
</body>
</html>
