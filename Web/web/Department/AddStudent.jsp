<%-- 
    Document   : ViewLeaveApplication
    Created on : 7 Mar, 2024, 12:08:13 AM
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Add Student</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/AddStudentActionPage.jsp">
            <table border="2" align="center">
                <tr>
                    <td>Name</td>
                    <td>
                        <input required type="text" name="name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/>
                    </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td>
                        <input type="text" required name="contact" pattern="[7-9]{1}[0-9]{9}" 
                title="Phone number with 7-9 and remaing 9 digit with 0-9"/>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <input required type="email" name="email">
                    </td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td>
                        <input required type="file" name="photo">
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <textarea required name="address"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select required name="district" onchange="getPlace(this.value)">
                            <option value="">---select---</option>
                            <%
                                String selectdistrict = "select * from tbl_district";
                                ResultSet objdistrict = con.selectCommand(selectdistrict);
                                while (objdistrict.next()) {
                            %>
                            <option value="<%=objdistrict.getString("district_id")%>"><%=objdistrict.getString("district_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
              
                <tr>
                    <td>Place</td>
                    <td>
                        <select required name="sel_place" id="sel_place">
                            <option>---select---</option>
                        </select>
                      
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <input required type="radio" name="gender" value="male">Male
                        <input type="radio" name="gender" value="female">Female
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td>
                        <input required type="date" name="dob">
                    </td>
                </tr>
                <tr>
                    <td>Course</td>
                    <td>
                        <select required name="course">
                            <option value="">---select---</option>
                            <%
                                String cid = session.getAttribute("departmenttypeid").toString();

                                String selectcourse = "select * from tbl_course p inner join tbl_department q on p.department_id=q.department_id inner join tbl_department_type pqr on q.department_type_id=pqr.department_type_id where pqr.department_type_id='" + cid + "'";

                                ResultSet objcourse = con.selectCommand(selectcourse);
                                while (objcourse.next()) {
                            %>
                            <option value="<%=objcourse.getString("course_id")%>"><%=objcourse.getString("course_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
   <tr>
                    <td>Semester</td>
                    <td>
                        <select required name="semester">
                            <option value="">---select---</option>
                            <%
                                String selectsemester = "select * from tbl_semester";
                                ResultSet objsemester = con.selectCommand(selectsemester);
                                while (objsemester.next()) {
                            %>
                            <option value="<%=objsemester.getString("semester_id")%>"><%=objsemester.getString("semester_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <input ype="text" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required name="password" />
                    
<input type="hidden" name="parent_id" value="<%=request.getParameter("id")%>">
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
    </body>
    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
                         function getPlace(did) {
    $.ajax({
        url: "../Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
        success: function(html) {
            $("#sel_place").html(html);
            // Assuming you have a hidden input field with the id "place_id"
            // Set the selected place's value in the hidden input field
            var selectedPlaceId = $("#sel_place").val();
            $("#place_id").val(selectedPlaceId);
        }
    });
}
    </script>
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

