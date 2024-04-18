<%-- 
    Document   : AddAdmin
    Created on : 25 Jan, 2024, 5:37:03 PM
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
        <title>Add District</title>
    </head>
    <body>
        <h1>Add District</h1>

        <%

            if (request.getParameter("btn_submit") != null) {
                String District = request.getParameter("txt_district");
                String insQry = "insert into tbl_district (district_name) values('" + District + "')";

                if (con.executeCommand(insQry)) {
        %>
        <script>
            alert("Inserted");
            window.location.href = "AddDistrict.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("Failed");
            window.location.href = "AddDistrict.jsp";
        </script>






        <%
                }
            }

            if (request.getParameter("id") != null) {
                String id = request.getParameter("id");
                String DelQry = " delete from tbl_district where district_id='" + id + "'";
                if (con.executeCommand(DelQry)) {
        %>
        <script>
            alert("Deteted");
            window.loaction.href("AddDistrict.jsp");

        </script>
        <%
        } else {
        %>
        <script>
            alert("Deletion Failed");
            window.loaction.href("AddDistrict.jsp");

        </script>
        <%
                }
            }
        %>
    <body>

        <form method="post">
            <table border="2">
                <tr>
                    <td>District</td>
                    <td>
                        <input type="text" name="txt_district" id="txt_district" >

                    </td> 

                </tr>

                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btn_submit" id="btn_submit" value="submit"></td>

                </tr>
            </table>
        </form>
        <br>
        <table border="2">
            <tr>
                <td>Sl.No</td>
                <td>District</td>
                <td>Action</td>
            </tr>
            <%
                String selQry = "select * from tbl_district";
                ResultSet rs = con.selectCommand(selQry);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td>
                    <a href="AddDistrict.jsp?id=<%=rs.getString("district_id")%>">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
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
