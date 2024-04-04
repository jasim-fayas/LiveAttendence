<%-- 
    Document   : EditProfile
    Created on : 29 Jan, 2024, 9:13:29 PM
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
      
          <li><a href="../Logout.jsp">Logout</a></li>
      </ul>
    </nav>
</header>
<br><br><br><br><br><br><br><br>
<div id="tab" align="center">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit Profile</h1>
          <%
     String select="select * from tbl_department p inner join tbl_department_type q on p.department_type_id=q.department_type_id where department_id='"+session.getAttribute("departmentid")+"'";
     ResultSet faculty=con.selectCommand(select);
     faculty.next();
     if (request.getParameter("save")!=null){
         String facultyname=request.getParameter("name");
         String email=request.getParameter("email");
         String contact=request.getParameter("contact");
      
         String update="update tbl_department p inner join tbl_department_type q on p.department_type_id=q.department_type_id set department_type_name='"+facultyname+"',department_email='"+email+"',department_contact='"+contact+"' where department_id='"+session.getAttribute("departmentid")+"'";
        // out.print(update);
         con.executeCommand(update);
         response.sendRedirect("MyProfile.jsp");
     }
    %>
    <body>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        Department name
                    </td>
                    <td>
                         <input type="text" name="name" value="<%=faculty.getString("department_type_name")%>">
                    </td>
                </tr>
                <tr>
                    <td>Department Email</td>
                    <td>
                        <input type="email" name="email" value="<%=faculty.getString("department_email")%>">
                    </td>
                </tr>
                <tr>
                    <td>Department Contact</td>
                    <td>
                        <input type="number" name="contact" value="<%=faculty.getString("department_contact")%>">
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
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
