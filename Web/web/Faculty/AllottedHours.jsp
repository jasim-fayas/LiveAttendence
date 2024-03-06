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
        %>

        <table border="2">
            <tr>
                <td>Day</td>
                <td>9:30-10:30</td>
                <td>10:30-11:30</td>
                <td>11:45-12:45</td>
                <td>12:45-1:45</td>
                <td>1:45-2:30</td>
                <td>2:30-3:30</td>
            </tr>
            <% for (String day : days) { %>
            <tr>
                <td height="38"><%= day %></td>
                <% for (int i = 1; i <= 5; i++) { %>
                <% if (day.equals("Monday") && i == 4) { %>
                <td rowspan="6">
                    <div id="lunch">
                        <p>L</p>
                        <p>U</p>
                        <p>N</p>
                        <p>C</p>
                        <p>H</p>
                    </div>
                </td>
                <% } %>
                <td>
                    <%
                        String timetableqry = "select * from tbl_timetable p inner join tbl_subject q on p.subject_id=q.subject_id inner join tbl_course r on q.course_id=r.course_id inner join tbl_assign s on p.subject_id=s.subject_id where s.faculty_id='" + id + "'  ";
                        ResultSet time = con.selectCommand(timetableqry);
                        if (time.next()) {
                            out.print(time.getString("subject_name"));
                        } else {
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
