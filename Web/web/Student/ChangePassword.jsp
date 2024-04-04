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
        <title>Change Password</title>
    </head>
    <body>
        <h1 align="center">Change Password</h1>
        <%
            String fid = session.getAttribute("studentid").toString();
            String department = " select * from tbl_student where student_id='" + fid + "'";
            ResultSet rs = con.selectCommand(department);
            if (rs.next()) {
                String dbpass = rs.getString("student_password");

                String oldpass = request.getParameter("txt_oldpassword");
                String newpass = request.getParameter("txt_newpassword");
                String confirmpass = request.getParameter("txt_confirmpassword");

//                 out.println("dbpass: " + dbpass);
//    out.println("oldpass: " + oldpass);
//    out.println("newpass: " + newpass);
//    out.println("confirmpass: " + confirmpass);
                if (request.getParameter("btn_submit") != null) {

                    if (oldpass.equals(dbpass)) {

                        if (newpass.equals(confirmpass)) {

                            String update = " update tbl_student set student_password='" + newpass + "' where student_id='" + fid + "'";
                            if (con.executeCommand(update)) {
        %>
        <script>
            alert("Password Updated");
            window.location('ChangePassword.jsp');
        </script>
        <%
        } else {
        %>
        <script>
            alert("Password Updation Failed");
            window.location('ChangePassword.jsp');
        </script>
        <%
            }
        } else {
        %>
        <script>
            alert("Please Check Confirm Password ");
            window.location('ChangePassword.jsp');
        </script> 
        <%
            }
        } else {
        %>
        <script>
            alert("Please enter correct old password ");
            window.location('ChangePassword.jsp');
        </script> 
        <%
                    }
                }
            }

        %>
        <form method="post">
            <table border="2" align="center">
                <tr>
                    <td>
                        Old Password
                    </td>
                    <td>
                        <input type="password" name="txt_oldpassword">

                    </td>
                </tr>
                <tr>
                    <td>
                        New Password
                    </td>
                    <td>
                        <input type="password" name="txt_newpassword">
                    </td>
                </tr>  <tr>
                    <td>
                        Confirm Password
                    </td>
                    <td>
                        <input type="password" name="txt_confirmpassword">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="submit">
                    </td>
                </tr>
            </table>
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