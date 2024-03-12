<%-- 
    Document   : ApplyForLeave
    Created on : 6 Mar, 2024, 11:40:06 PM
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
      
        <li><a href="Login.php">Logout</a></li>
      </ul>
    </nav>
</header>
<br><br><br><br><br><br><br><br>
<div id="tab" align="center">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Leave Application</h1>
        <%
            String id = session.getAttribute("studentid").toString();
            
        if(request.getParameter("btn_submit") != null){
            
            String title = request.getParameter("txt_leavetitle");
            String content = request.getParameter("txt_leaverason");
              String date = request.getParameter("dob_date");
            
            String insqry = " insert into tbl_leave (student_id,leave_title,leave_content,leave_date) values ('"+id+"','"+title+"','"+content+"','"+date+"') ";
            //out.print(insqry);
           if( con.executeCommand(insqry)){
               %>
             <script>
                            alert("Inserted")
                            
                        </script>
                        <%
                    }else{
                        
                        %>
                      <script>
                            alert("Insertion failed")
                            
                        </script>    
                        <%
                    }
                }


            %>
        
        
        
        <form method="post">
            <table border="2" align="center">
                <tr>
                    <td>
                        Leave Title
                    </td>
                    <td>
                        <input type="text" name="txt_leavetitle">
                    </td>
                </tr>
                <tr>
                    <td>
                        Leave Reason
                    </td>
                    <td>
                        <textarea name="txt_leaverason">
                        </textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                    Leave Applying Date
                    </td>
                    <td>
                        <input type="date" name="dob_date">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Submit"> 
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