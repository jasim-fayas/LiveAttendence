<%-- 
    Document   : AssignFaculty
    Created on : 25 Jan, 2024, 11:11:51 PM
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
        <title>Assign Faculty</title>
    </head>
    <body>
        <h1 align="center">Assign Faculty</h1>
 
        
        
        
        
        
        
        
        
        
      
  <%
      String did = session.getAttribute("departmentid").toString();
      String fid=request.getParameter("fid");
  String faculty = " select * from tbl_faculty p inner join tbl_department q on p.department_id=q.department_id inner join tbl_department_type r on q.department_type_id=r.department_type_id where faculty_id='"+ fid +"' ";
  ResultSet rs = con.selectCommand(faculty);
  rs.next();
  %>
  
         <%
       if(request.getParameter("btn_submit")!= null){
           
           String semester = request.getParameter("sel_semester");
            String name = rs.getString("faculty_id");     
             String subject = request.getParameter("sel_subject");    
             
             String insert = " insert into tbl_assign(faculty_id,semester_id,subject_id) values ('"+name+"','"+semester+"','"+subject+"')";
        //  out.print(insert);
             con.executeCommand(insert);
       } 
  
  
  
  
  %>
  <form method="post">
      <table border="2" align="center">
          <tr>
              <td colspan="2" align="center">
                        <img src="../Assets/Files/Teacher/<%=rs.getString("faculty_photo")%>" width="150px">
              </td>
          </tr>
          <tr>
              <td>
                  Faculty Name
              </td>
           
              <td>
                  
                  <%=rs.getString("faculty_name")%>
                  
              </td>
          </tr>
          <tr>
              <td>
                  Faculty Department
              </td>
              <td>
                  
                        <%=rs.getString("department_type_name")%>  
                  
              </td>
          </tr>
          <tr>
              <td>
                  Assigning Semester
              </td>
            
              <td>
                  <select name="sel_semester" id="sel_semester">
                      <option>----SELECT----</option>
                     <%
              String semester = " select * from tbl_semester ";
              ResultSet rss = con.selectCommand(semester);
              while(rss.next())
              {
              
              %>   
              <option value="<%=rss.getString("semester_id")%>"><%=rss.getString("semester_name")%></option>
                      <%
              }
                      %>
                  </select>
                  
                  
              </td>
          </tr>
          <tr>
              <td>
              Assigning Subject
              </td>
              <td>
                  
                    <select name="sel_subject" id="sel_subject">
                      <option>----SELECT----</option>
                     <%
              String subject = " select * from tbl_subject where department_id='"+did+"' ";
              ResultSet rssp = con.selectCommand(subject);
              while(rssp.next())
              {
              
              %>   
              <option value="<%=rssp.getString("subject_id")%>"><%=rssp.getString("subject_name")%></option>
                       <%
              }
                      %>
                  </select>
                  
              </td>
          </tr>
          <tr>
              <td colspan="2" align="center">
                  <input type="submit" name="btn_submit" value="Assign">
              </td>
          </tr>
      </table>
          
  </form>
</body>

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

