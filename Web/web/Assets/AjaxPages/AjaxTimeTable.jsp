<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%

    String hour = request.getParameter("hour");
    String subject = request.getParameter("subject");
    String semester = request.getParameter("semester");
    String day = request.getParameter("day");

    String selQry = "SELECT * FROM `tbl_timetable` where timetable_day='" + day + "' and timetable_hour='" + hour + "' and semester_id='" + semester + "'";
    ResultSet rs = con.selectCommand(selQry);
    if (rs.next()) {
        String upQry = "Update tbl_timetable set subject_id='" + subject + "' where timetable_day='" + day + "' and timetable_hour='" + hour + "' and semester_id='" + semester + "'";
        if (con.executeCommand(upQry)) {
            out.println("Updated");
        }
    } else {
        String insQry = "INSERT INTO `tbl_timetable`(`timetable_day`, `timetable_hour`, `semester_id`, `subject_id`) values('" + day + "','" + hour + "','" + semester + "','" + subject + "')";
        if (con.executeCommand(insQry)) {
            out.println("Inserted");
        }
    }


%>