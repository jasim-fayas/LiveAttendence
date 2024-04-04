<%-- 
    Document   : EditProfile
    Created on : 28 Jan, 2024, 11:54:36 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
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
      
        <li><a href="Login.php">Logout</a></li>
      </ul>
    </nav>
</header>
<br><br><br><br><br><br><br><br>
<div id="tab" align="center">
        <title>Internal Mark</title>
        <style>
            input[type=number]::-webkit-inner-spin-button, 
            input[type=number]::-webkit-outer-spin-button { 
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                margin: 0; 
            }
        </style>
    </head>
    <%
        String semester = "";
        String subject = "";
        String selQry = "select * from tbl_subject sub inner join tbl_semester sem on sem.semester_id=sub.semester_id inner join tbl_student stu on stu.semester_id=sem.semester_id where sub.subject_id='" + request.getParameter("sid") + "'";
        ResultSet result1 = con.selectCommand(selQry);
        ResultSet result2 = con.selectCommand(selQry);
        if (result1.next()) {
            semester = result1.getString("semester_name");
            subject = result1.getString("subject_name");
        }
    %>
    <body>
        <div id="tab" align="center">
            <h1 align="center">Internal Marks</h1>
            <form>
                <table border="1">
                    <tr> 
                        <td>Semester</td>
                        <td colspan="2"><%=semester%></td>
                    </tr>
                    <tr> 
                        <td>Subject</td>
                        <td colspan="2"><%=subject%></td>
                    </tr>
                    <tr> 
                        <td>SL NO</td>
                        <td>Student</td>
                        <td>Mark</td>
                    </tr>
                    <%
                        int i = 0;
                        while (result2.next()) {
                            String mark = "0";
                            String selQry1 = "SELECT * FROM tbl_internalmark where student_id='" + result2.getString("student_id") + "' and subject_id='" + result2.getString("subject_id") + "'";
                            ResultSet row1 = con.selectCommand(selQry1);
                            if (row1.next()) {
                                mark = row1.getString("internalmark_mark");
                            }
                            i++;
                    %>
                    <tr> 
                        <td><%=i%></td>
                        <td><%=result2.getString("student_name")%></td>
                        <td><input type="number" name="txt_mark" id="txt_mark" value="<%=mark%>" placeholder="Enter Mark" onkeyup="updateMark(this.value,<%=result2.getString("subject_id")%>,<%=result2.getString("student_id")%>)" min="0" /></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </form>
        </div>
    </body>
    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
                            function updateMark(mark, sub, stud)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxMark.jsp?mark=" + mark + "&sub=" + sub + "&stud=" + stud,
                                    success: function(html) {
                                        if (html.trim() != "")
                                        {
                                            alert(html.trim())
                                        }
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
    
