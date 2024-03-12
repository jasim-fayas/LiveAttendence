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
        <style>
            /* Style the modal */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal content */
            .modal-content {
                background-color: #fefefe;
                margin: 10% auto; /* 10% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
                max-width: 400px; /* Limit maximum width */
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Box shadow */
                border-radius: 5px;
            }

            /* Close button */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <form method="post">

            <%
                ArrayList<String> days = new ArrayList<String>();
                days.add("Monday");
                days.add("Tuesday");
                days.add("Wednesday");
                days.add("Thursday");
                days.add("Friday");
                String id = request.getParameter("id");

                // Retrieve timetable data with course name
                String timetableqry = "SELECT t.timetable_day, t.timetable_hour, s.subject_name, c.course_name ,sem.semester_name FROM tbl_timetable t "
                        + "INNER JOIN tbl_subject s ON t.subject_id = s.subject_id "
                        + "INNER JOIN tbl_course c ON s.course_id = c.course_id "
                        + "INNER JOIN tbl_assign a ON s.subject_id = a.subject_id inner join tbl_semester sem on sem.semester_id=t.semester_id "
                        + "WHERE a.faculty_id='" + id + "'";
                System.out.println(timetableqry);
                ResultSet timetableResult = con.selectCommand(timetableqry);
                ArrayList<String[]> timetableData = new ArrayList<String[]>(); // Specify the type explicitly
                while (timetableResult.next()) {
                    String[] rowData = new String[5];
                    rowData[0] = timetableResult.getString("timetable_day");
                    rowData[1] = timetableResult.getString("timetable_hour");
                    rowData[2] = timetableResult.getString("subject_name");
                    rowData[3] = timetableResult.getString("course_name");
                    rowData[4] = timetableResult.getString("semester_name");

                    timetableData.add(rowData);
                }
            %>

            <table border="2" align="center">
                <tr>
                    <td>Day</td>
                    <td>9:30-10:30</td>
                    <td>10:30-11:30</td>
                    <td>11:45-12:45</td>
                    <td>1:45-2:30</td>
                    <td>2:30-3:30</td>
                </tr>
                <% for (String day : days) {%>
                <tr>
                    <td height="38"><%= day%></td>
                    <% for (int i = 1; i <= 5; i++) { %>

                    <%
                        boolean found = false;
                        for (String[] rowData : timetableData) {
                            if (rowData[0].equals(day) && rowData[1].equals(Integer.toString(i))) {
                    %>
                    <td class="openModal" onclick="openModal('<%=rowData[2]%>', '<%=rowData[3]%>', '<%=rowData[4]%>')"><span style="color: #001dff"><%=rowData[2]%></span> </td>
                    <%
                                found = true;
                                break;
                            }
                        }
                        if (!found) {
                    %>
                    <td><span style="color:green">Free Hour</span></td>
                    <%
                        }
                    %>

                    <% } %>
                </tr>
                <% }%>
            </table>
        </form>
        <!-- Modal -->
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <p id="modalDetails">Modal content goes here...</p>
            </div>
        </div>
    </body>

    <script>
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        };

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };

        // Function to open modal with subject details
        function openModal(subjectName, courseName, semesterName) {
            var modalDetails = document.getElementById('modalDetails');
            modalDetails.innerHTML = "<b>Subject Name:</b> " + subjectName + "<br><b>Course Name:</b> " + courseName + "<br><b>Semester Name:</b> " + semesterName;
            modal.style.display = "block";
        }
    </script>
</html>
