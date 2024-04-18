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
            </tr>
            <tr>
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
            %>
            </tr>
        </table>
        <p>&nbsp;</p>
    </form>
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