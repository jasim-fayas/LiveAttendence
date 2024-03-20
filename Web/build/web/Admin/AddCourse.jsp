<%-- 
    Document   : AddCourse
    Created on : 25 Jan, 2024, 6:39:45 PM
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
        <title>Add Course</title>


    </head>
    <body>
        <%
            if (request.getParameter("save") != null) {

                String course = request.getParameter("course");

                String departmenttype = request.getParameter("department_id");
                String insert = "insert into tbl_course (course_name,department_id)values ('" + course + "','" + departmenttype + "')";
                if (con.executeCommand(insert)) {
                    //  out.print(insert);
        %>
        <script>
            alert(" Course Added");
            window.location('AddCourse.jsp');

        </script>
        <% } else {

        %>
        <script>
            alert(" Course Submission failed");
            window.location('AddCourse.jsp');

        </script>
        <%        }
            }

        %>


        <%             if (request.getParameter("del") != null) {
                String id = request.getParameter("del");
                String delete = "delete from tbl_course where course_id='" + id + "'";
                if (con.executeCommand(delete)) {
        %>

        <script>
            alert(" deletion completed");
            window.location('AddCourse.jsp');
        </script>




        <% } else {

        %>
        <script>
            alert("Deletion Failed");
            window.location('AddCourse.jsp');

        </script>
        <%        }
            }


        %>
        <form method="post">
            <table border="1" align="center">

                <tr>
                    <td>
                        Department Type
                    </td>
                    <td>
                        <select name="department_id">
                            <option value="">--select--</option>
                            <%                             String selectdepartmenttype = "select * from tbl_department_type d inner join tbl_department p on d.department_type_id=p.department_type_id";
                                ResultSet dep = con.selectCommand(selectdepartmenttype);
                                while (dep.next()) {
                            %>
                            <option value="<%=dep.getString("department_id")%>"><%=dep.getString("department_type_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Course
                    </td>
                    <td>
                        <input type="text" name="course" >

                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
            <table border="1">
                <tr>
                    <th>S.NO</th>

                    <th>Department Type</th>
                    <th>Course</th>

                    <th colspan="2" align="center">Action</th>
                </tr>
                <%
                    String selcategory = "select * from tbl_course c  inner join tbl_department d on c.department_id=d.department_id inner join tbl_department_type  pq on pq.department_type_id=d.department_type_id";
                    ResultSet display = con.selectCommand(selcategory);
                    int i = 0;
                    while (display.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>

                    <td><%=display.getString("department_type_name")%></td>
                    <td><%=display.getString("course_name")%></td>  
                    <td><a href="AddCourse.jsp?del=<%=display.getString("course_id")%>">Delete</a></td>
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