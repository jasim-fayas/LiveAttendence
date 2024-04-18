<%-- 
    Document   : ListAndAssign
    Created on : 27 Jan, 2024, 11:15:51 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con" />
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            margin-bottom: 90px; /* Adjust this value as needed */
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>List And Assign</h1>
        <form method="post">
            <table border="2">
                <tr>
                    <td>Sl number</td>
                    <td>Faculty Photo</td>
                    <td>Faculty Name</td>
                    <td>Faculty Assigned Subjects And Semester</td>
                    <td>Action</td>
                </tr>
                <%
                    String selectQuery = "SELECT f.*, s.subject_name, se.semester_name " +
                                         "FROM tbl_faculty f " +
                                         "LEFT JOIN tbl_assign a ON f.faculty_id = a.faculty_id " +
                                         "LEFT JOIN tbl_subject s ON a.subject_id = s.subject_id " +
                                         "LEFT JOIN tbl_semester se ON a.semester_id = se.semester_id " +
                                         "WHERE f.department_id='" + session.getAttribute("departmentid") + "' order by faculty_name ASC";
                    ResultSet rs = con.selectCommand(selectQuery);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%= i %></td>
                    <td><img src="../Assets/Files/Teacher/<%= rs.getString("faculty_photo") %>" width="150px"></td>
                    <td><%= rs.getString("faculty_name") %></td>
                    <td>
                        <%-- Loop through faculty assignments --%>
                        <%
                            if (rs.getString("subject_name") != null && rs.getString("semester_name") != null) {
                        %>
                        <%= rs.getString("subject_name") %> &nbsp; <%= rs.getString("semester_name") %> <br>
                        <%
                            }
                        %>
                    </td>
                    <td><a href="AssignFaculty.jsp?fid=<%= rs.getString("faculty_id") %>">Assign</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
        <br><br><br><br><br><br>
    </div>
    <footer>
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <p><i class="fa fa-copyright"></i> Copyright 2024 by Live Attendance | Design: <a href="" rel="sponsored" target="_parent">jaasimee</a></p>
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
