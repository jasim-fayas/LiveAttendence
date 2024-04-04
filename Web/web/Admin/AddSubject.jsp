<%-- 
    Document   : AddSubject
    Created on : 25 Jan, 2024, 7:07:35 PM
    Author     : jasim fayas
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
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
        <title>Add Subject</title>
    </head>
    <body>
        <h1>Add Subject</h1>
          <%
            if (request.getParameter("save") != null) {
               
            
                    String subject = request.getParameter("subject");
                    String course = request.getParameter("course");
                    String sem = request.getParameter("sem");
                    String department = request.getParameter("department");
                    String insert = "insert into tbl_subject (course_id,subject_name,semester_id,department_id)value('" + course + "','" + subject + "','" + sem + "','" + department + "')";
                    con.executeCommand(insert);
                }
            

            if (request.getParameter("del") != null) {
                String id = request.getParameter("del");
                String delete = "delete from tbl_subject where subject_id='" + id + "'";
                con.executeCommand(delete);
            }
           
           
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        Department
                    </td>
                    <td>
                        <select name="department" id="sel_department" onchange="getCourse(this.value)">
                            <option value="">--select--</option>
                            <%
                              
                                    String select = "select * from tbl_department p inner join tbl_department_type q on q.department_type_id=p.department_type_id ";
                                    ResultSet rs = con.selectCommand(select);
                                    while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("department_id")%>" ><%=rs.getString("department_type_name")%></option>
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
                        <select name="course" id="sel_course">
                            <option value="">--select--</option>
                           
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Semester
                    </td>
                    <td>
                        <select name="sem" id="sel_semester">
                            <option value=" ">--select--</option>
                            <%
                               
                                    String sid = request.getParameter("sid");
                                    String selsemester = "select * from tbl_semester ";
                                    ResultSet rese = con.selectCommand(selsemester);
                                    while (rese.next()) {
                            %>
                                    <option value="<%=rese.getString("semester_id")%>" ><%=rese.getString("semester_name")%></option>
                            <%
                                    }
                                
                            %>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td>
                        Subject
                    </td>
                    <td>
                        <input type="text" name="subject" >
                       
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
                        <a href="Homepage.jsp">Homepage</a>
            <table border="2">
                <tr>
                    <td>S.NO</td>
                    <td>Course</td>
                    <td>Semester</td>
                    <td>Subject</td>
                    <td colspan="2" align="center">Action</td>
                </tr>
                <%
                    String selsubject = "select * from tbl_subject s inner join tbl_course c on s.course_id=c.course_id inner join tbl_semester sem on s.semester_id=sem.semester_id";
                    ResultSet display = con.selectCommand(selsubject);
                    int i = 0;
                    while (display.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=display.getString("course_name")%></td>
                    <td><%=display.getString("semester_name")%></td>
                    <td><%=display.getString("subject_name")%></td>
                    <td><a href="AddSubject.jsp?del=<%=display.getString("subject_id")%>">Delete</a></td>
                    
                </tr>
                <%
                    }
                %>
            </table>
        </form>
    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
                            function getCourse(did)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxCourse.jsp?did=" + did,
                                    success: function(html) {
                                        $("#sel_course").html(html);

                                    }
                                });
                            }

//                            function getSemester(sid)
//                            {
//                                $.ajax({
//                                    url: "../Assets/AjaxPages/AjaxSemester.jsp?sid=" + sid,
//                                    success: function(html) {
//                                        $("#sel_semester").html(html);
//
//                                    }
//                                });
//                            }
    </script>
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
