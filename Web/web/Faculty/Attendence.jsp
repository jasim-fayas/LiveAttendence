<%-- 
    Document   : Attendence
    Created on : 8 Feb, 2024, 11:29:37 AM
    Author     : jasim fayas
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>Live Attendance</title>
    
    <!-- Bootstrap core CSS -->
    <link href="../Assets/Template/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../Assets/Template/main/assets/css/fontawesome.css">
    <link rel="stylesheet" href="../Assets/Template/main/assets/css/templatemo-grad-school.css">
    <link rel="stylesheet" href="../Assets/Template/main/assets/css/owl.css">
    <link rel="stylesheet" href="../Assets/Template/main/assets/css/lightbox.css">
    <link rel="stylesheet" href="../Assets/Template/form.css">
     <style>
        /* Add margin-bottom to the table */
        table {
            margin-bottom: 20px; /* Adjust this value as needed */
        }
        
        /* Adjust padding for the footer */
        footer {
            padding-top: 10px; /* Adjust this value as needed */
          
        }
    </style>
    
</head>
<body>

<!--header-->
<header class="main-header clearfix" role="header">
    <div class="logo">
      <a href="../index.jsp"><em>Live </em>Attendance</a>
    </div>
    <a href="" class="menu-link"><i class="fa fa-bars"></i></a>
    <nav id="menu" class="main-nav" role="navigation">
      <ul class="main-menu">
          <li><a href="Homepage.jsp">Home</a></li>
      
        <li><a href="Login.php">Logout</a></li>
      </ul>
    </nav>
</header>
<br><br><br><br><br><br><br><br>
<div id="tab" align="center">
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
            <table width="200" border="1" >
                <tr>
                    <td>Sl.No</td>
                    <td>Name</td>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    
                </tr>
                <%
                    if (request.getParameter("btn_search") != null) {
                        int i = 0;
                        date = request.getParameter("txt_date");
                        course = Integer.parseInt(request.getParameter("txt_course"));
                        String semester = request.getParameter("txt_semester");
                        String selQry = "select * from tbl_student s inner join tbl_course se on se.course_id=s.course_id where s.course_id='" + course + "' and semester_id='"+semester+"' ORDER BY s.student_name";
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
                        for (int j = 1; j <= 5; j++) {
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
            <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <p><i class="fa fa-copyright"></i> Copyright 2024 by Live Attendance  
          
           | Design: <a href="" rel="sponsored" target="_parent">jaasimee</a></p>
        </div>
      </div>
    </div>
                <br><br><br>
                        </div>
  </footer>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="../Assets/Template/main/vendor/jquery/jquery.min.js"></script>
    <script src="../Assets/Template/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../Assets/Template/main/assets/js/isotope.min.js"></script>
    <script src="../Assets/Template/main/assets/js/owl-carousel.js"></script>
    <script src="../Assets/Template/main/assets/js/lightbox.js"></script>
    <script src="../Assets/Template/main/assets/js/tabs.js"></script>
    <script src="../Assets/Template/main/assets/js/video.js"></script>
    <script src="../Assets/Template/main/assets/js/slick-slider.js"></script>
    <script src="../Assets/Template/main/assets/js/custom.js"></script>
</body>
</html>
    