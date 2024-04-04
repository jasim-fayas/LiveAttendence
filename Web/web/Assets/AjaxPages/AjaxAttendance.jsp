<%-- 
    Document   : AjaxAttendance
    Created on : 8 Feb, 2024, 11:47:51 AM
    Author     : jasim fayas
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%
    session.setMaxInactiveInterval(60 * 60); // Setting session timeout to 1 hour
    String hour = request.getParameter("hour");
    String studid = request.getParameter("studid");
    String date = request.getParameter("date");
    String fid = (String) session.getAttribute("facultyid");

    String selQry = "SELECT * FROM tbl_attendance WHERE student_id='"+studid+"' AND attendance_hour='"+hour+"' AND attendance_date='"+date+"'";
    ResultSet data = con.selectCommand(selQry);
    if(data.next()) {
        String delQry = "DELETE FROM tbl_attendance WHERE student_id='"+studid+"' AND attendance_hour='"+hour+"' AND attendance_date='"+date+"'";
        if(con.executeCommand(delQry)) {
            out.println("deleted");
        }
    } else {
        String insQry = "INSERT INTO tbl_attendance (attendance_date, attendance_hour, student_id, faculty_id) VALUES ('"+date+"', '"+hour+"', '"+studid+"', '"+fid+"')";
        if(con.executeCommand(insQry)) {
            out.println("inserted");
        }
    }
%>
