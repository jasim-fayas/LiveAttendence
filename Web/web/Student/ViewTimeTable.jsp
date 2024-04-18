<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

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
            margin-bottom: 40px; /* Adjust this value as needed */
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
      
          <li><a href="../Logout.jsp">Logout</a></li>
      </ul>
    </nav>
</header>
<br><br><br><br><br><br><br><br>
<div id="tab" align="center">


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
                        String selQry1 = "SELECT * FROM tbl_timetable t INNER JOIN tbl_subject s ON t.subject_id = s.subject_id WHERE timetable_day='" + day + "' AND timetable_hour='" + i + "' AND s.semester_id='" + session.getAttribute("semesterid") + "' and course_id='"+session.getAttribute("courseid")+"'";
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
          
        </table>
    </form>
</div>
                       <br><br><br><br>
</div>
<footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <p><i class="fa fa-copyright"></i> Copyright 2024 by Live Attendance  
          
           | Design: <a href="" rel="sponsored" target="_parent">jaasimee</a></p>
        </div>
      </div>
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

