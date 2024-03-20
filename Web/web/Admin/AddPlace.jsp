<%-- 
    Document   : AddPlace
    Created on : 25 Jan, 2024, 10:21:35 PM
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
        <title>Add Place</title>
    </head>
    <body>
     
     <h1>Add Place</h1>
        <%
         if(request.getParameter("save")!= null){
             String place=request.getParameter("place");
             String district=request.getParameter("district");
             String insert="insert into tbl_place (district_id,place_name)value('"+district+"','"+place+"')";
             con.executeCommand(insert);
         }
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        District
                    </td>
                    <td>
                        <select name="district">
                            <option value="">--select--</option>
                            <%
                         String select="select * from tbl_district";
                         ResultSet rs=con.selectCommand(select);
                         while(rs.next())
                         {
                        %>
                            <option value=<%=rs.getString("district_id")%>><%=rs.getString("district_name")%></option>
                         <%
                         }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        place
                    </td>
                    <td>
                        <input type="text" name="place">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
                        <br><br>
                        <table border="2" align="center">
                            <tr>
                                <td>
                                    Sl number
                                </td>
                                <td>
                                    Place Name
                                </td>
                                <td>
                                    District Name
                                </td>
                              
                            </tr>
                            <tr>
                                <%
                                String selqry = " select * from tbl_place p inner join tbl_district q on p.district_id=q.district_id ";
                                ResultSet rsss= con.selectCommand(selqry);
                                int i = 0;
                                while (rsss.next()){
                                    
                               i++;
                                
                                %>
                                <td>
                                   <%=i%> 
                                </td>
                                <td>
                                   <%=rsss.getString("place_name")%>   
                                </td>
                                <td>
                                      <%=rsss.getString("district_name")%>   
                                </td>
                            </tr>
                            <%
                                }
                            %>
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
