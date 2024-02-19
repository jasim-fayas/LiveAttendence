<%-- 
    Document   : ViewAttendence
    Created on : 8 Feb, 2024, 12:30:37 PM
    Author     : jasim fayas
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    session.setMaxInactiveInterval(60 * 60); // Setting session timeout to 1 hour
    String date = request.getParameter("txt_date");
    if (date == null || date.isEmpty()) {
        date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }
    String selectedDate = request.getParameter("txt_date");
    if (selectedDate == null || selectedDate.isEmpty()) {
        selectedDate = "";
    }
    if (request.getParameter("btn_reset") != null) {
        date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        selectedDate = "";
    }
%>
<body>
    <div id="tab" align="center">
        <h1 align="center">Attendance</h1>
        <form name="form1" method="post" action="">
            <table width="375" border="1">
                <tr>
                    <td width="227">Date
                        <input name='txt_date' id='txt_date' type="date" value="<%= date%>" max="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>"/>
                    </td>
                    <td width="157"><input type="submit" name="btn_search" id="btn_search" value="Search">
                        <input type="submit" name="btn_reset" id="btn_reset" value="Reset"></td>
                </tr>
            </table>
            <p>&nbsp;</p>
            <table width="200" border="1">
                <tr>
                    <td colspan="6">Date: <%= selectedDate%></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
                </tr><tr>
                <%
                    if (request.getParameter("btn_search") != null) {
                        int i;
                        for (i = 1; i <= 6; i++) {
                            String selQry = "SELECT * FROM tbl_attendance WHERE attendance_date = '" + selectedDate + "' AND attendance_hour = '" + i + "' AND student_id = '" + session.getAttribute("studentid") + "'";
                            ResultSet res = con.selectCommand(selQry);
                            if (res.next()) {
                %>
                
                <td style="color:#00cc33">Present</td>
               
                <%      } else { %>
               
                    <td style="color:red">Absent</td>
                
                <%      }

                        }
                    }
                %> </tr>
            </table>
            <p>&nbsp;</p>
        </form>
    </div>
</body>
