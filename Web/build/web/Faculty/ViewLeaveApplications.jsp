<%-- 
    Document   : ViewLeaveApplications
    Created on : 7 Mar, 2024, 12:50:30 AM
    Author     : jasim fayas
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
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
            margin-bottom: 270px; /* Adjust this value as needed */
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">View Leave Applications</h1>
        <form method="post">

            <table border="2" align="center">

                <tr>
                    <td>
                        Sl number
                    </td>
                    <td>
                        Student Name
                    </td>
                    <td>
                        Leave Title
                    </td>
                    <td>
                        Leave Content
                    </td>
                    <td>
                        Leave Date
                    </td>
                    <td>
                        Parent Verification
                    </td>
                </tr>
                <%
                    String depid = session.getAttribute("departmentid").toString();
                    String qry = " select * from tbl_leave p inner join tbl_student q on p.student_id=q.student_id  where department_id='"+depid+"'  ";
                    ResultSet rs = con.selectCommand(qry);
                    int i = 0;
                    while (rs.next()) {
                        i++;

                %>


                <tr>
                    <td>
                        <%=i%> 
                    </td>
                    <td>
                        <%=rs.getString("student_name")%>
                    </td>
                    <td>
                        <%=rs.getString("leave_title")%>
                    </td>
                    <td>
                        <%=rs.getString("leave_content")%>
                    </td>
                    <td>
                        <%=rs.getString("leave_date")%>
                    </td>
                    <td>
                        <%

                            if (rs.getString("parent_status").equals("0")) {
                                out.print("Not Verified");
                            }
                            else if (rs.getString("parent_status").equals("1")) {
                                 out.print("Approved");
                            }
                                 else if (rs.getString("parent_status").equals("2")) {
                                 out.print("Rejected");
                            }

                        %>
                    </td>
                </tr>
                <%                    }
                %>

            </table>

        </form>
              <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <p><i class="fa fa-copyright"></i> Copyright 2024 by Live Attendance  
          
           | Design: <a href="" rel="sponsored" target="_parent">jaasimee</a></p>
        </div>
      </div>
    </div>
                        <br><br>
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
    
