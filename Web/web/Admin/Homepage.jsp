<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>

     


<!DOCTYPE html>
<html lang="zxx">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Admin</title>

        <!-- <link rel="icon" href="../Assets/Template/Admin/img/favicon.png" type="image/png"> -->
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="../Assets/Template/Admin/css/bootstrap.min.css" />
        <!-- themefy CSS -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/themefy_icon/themify-icons.css" />
        <!-- swiper slider CSS -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/swiper_slider/css/swiper.min.css" />
        <!-- select2 CSS -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/select2/css/select2.min.css" />
        <!-- select2 CSS -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/niceselect/css/nice-select.css" />
        <!-- owl carousel CSS -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/owl_carousel/css/owl.carousel.css" />
        <!-- gijgo css -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/gijgo/gijgo.min.css" />
        <!-- font awesome CSS -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/font_awesome/css/all.min.css" />
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/tagsinput/tagsinput.css" />
        <!-- datatable CSS -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/datatable/css/jquery.dataTables.min.css" />
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/datatable/css/responsive.dataTables.min.css" />
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/datatable/css/buttons.dataTables.min.css" />
        <!-- text editor css -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/text_editor/summernote-bs4.css" />
        <!-- morris css -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/morris/morris.css">
        <!-- metarial icon css -->
        <link rel="stylesheet" href="../Assets/Template/Admin/vendors/material_icon/material-icons.css" />

        <!-- menu css  -->
        <link rel="stylesheet" href="../Assets/Template/Admin/css/metisMenu.css">
        <!-- style CSS -->
        <link rel="stylesheet" href="../Assets/Template/form.css">
        <link rel="stylesheet" href="../Assets/Template/Admin/css/style.css" />
        <link rel="stylesheet" href="../Assets/Template/Admin/css/colors/default.css" id="colorSkinCSS">
        <link rel="stylesheet" href="../Assets/Template/Main/css/style.css">
    </head>
    <body class="crm_body_bg">



        <!-- main content part here -->

        <!-- sidebar  -->
        <!-- sidebar part here -->
        <nav class="sidebar">
            <div class="logo d-flex justify-content-between">
                <a href="HomePage.php"><h2 align="center">Welcome<br>Admin<br><%=session.getAttribute("adminname")%></h2></a>
                <div class="sidebar_close_icon d-lg-none">
                    <i class="ti-close"></i>
                </div>
            </div>
            <ul id="sidebar_menu">
                <li class="side_menu_title">
                    <span>Homepage</span>
                </li>
                <li class="mm-active">
                    <a  href="../"  aria-expanded="false">
                        <img src="../Assets/Template/Admin/img/menu-icon/1.svg" alt="">
                        <span>IndexPage</span>
                    </a>
                   
                </li>
                <li class="side_menu_title">
                    <span>Applications</span>
                </li>
                <li class="">
                    <a   class="has-arrow" href="javascript:void(0)" aria-expanded="false">
                        <img src="../Assets/Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>Profile</span>
                    </a>
                    
                   <ul>
                   <li>
                    
                   <li><a href="ViewProfile.jsp">My profile</a></li>
                   <li><a href="EditProfile.jsp">Edit profile</a></li>
                   <li><a href="ChangePassword.jsp">Change Password</a></li>
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="javascript:void(0)" aria-expanded="false">
                        <img src="../Assets/Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>Add Admin/Place</span>
                    </a>
                    
                   <ul>
                   <li>
                    
                   <li><a href="AddPlace.jsp">Add Place</a></li>
                   <li><a href="AddDistrict.jsp">Add District</a></li>
                   <li><a href="AddAdmin.jsp">Add Admin</a></li>
                        
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="javascript:void(0)" aria-expanded="false">
                        <img src="../Assets/Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>Department</span>
                    </a>
                    
                   <ul>
                   <li>
                   <li><a href="AddDepartmentType.jsp"> Department Type </a></li>
                   <li><a href="AddDepartment.jsp"> Department</a></li>
                       
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="javascript:void(0)" aria-expanded="false">
                        <img src="../Assets/Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>Faculty</span>
                    </a>
                    
                   <ul>
                   <li>
                    
                   <li><a href="AddFaculty.jsp">Add Faculty </a></li>
                   <li><a href="ViewAddedFaculty.jsp">View Added Faculty </a></li>
                       
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="javascript:void(0)" aria-expanded="false">
                        <img src="../Assets/Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>Course</span>
                    </a>
                    
                   <ul>
                   <li>
                    
                   <li><a href="AddCourse.jsp">Add Course</a></li>
                   <li><a href="AddSemester.jsp">Add Semester</a></li>
                   <li><a href="AddSubject.jsp">Add Subjects</a></li>
                           
                    </ul>
                </li>
                <li class="">
                    <a   class="has-arrow" href="javascript:void(0)" aria-expanded="false">
                        <img src="../Assets/Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>TimeTable</span>
                    </a>
                    
                   <ul>
                   <li>
                    
                   <li><a href="TimeTable.jsp">View Time Table</a></li>
                       
                    </ul>
                </li>
  
<!--                <li class="">
                    <a   class="has-arrow" href="javascript:void(0)" aria-expanded="false">
                        <img src="../Assets/Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>promocodes</span>
                    </a>
                    
                   <ul>
                   <li>
                    
                        <li><a href="Promocode.php">Add promocode</a></li>
                        <li><a href="UsedPromocodes.php">View used promocodes</a></li>
                    </ul>
                   <li class="">
                    <a   class="has-arrow" href="javascript:void(0)" aria-expanded="false">
                        <img src="../Assets/Template/Admin/img/menu-icon/2.svg" alt="">
                        <span>Complaints</span>
                    </a>
                    
                   <ul>
                   <li>
                    
                        <li><a href="ViewComplaints.php">View complaints</a></li>
                        <li><a href="ComplaintReply.php">Complaint reply</a></li>
                        <li><a href="SolvedComplaints.php">Solved complaints</a></li>
                    </ul>-->
<!--                </li-->
                   <li class="">
                       <a   class="has-arrow" href="../Logout.jsp" aria-expanded="false">
                            <img src="../Assets/Template/Admin/img/menu-icon/2.svg" alt="">
                            <span>Logout</span>
                        </a>	
                   </li>
            </ul>

        </nav>
        <!-- sidebar part end -->
        <!--/ sidebar  -->

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Untitled Document</title>
        
        <section class="main_content dashboard_part">
    <div class="main_content_iner ">
        <div class="container-fluid p-0">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="single_element">
                        <div class="quick_activity">
                            <div class="row">
                                <div class="col-12">
                                    <div class="quick_activity_wrap">
                                        <div class="single_quick_activity d-flex">
                                            <div class="icon">
                                                <img src="../Assets/Template/Admin/img/icon/user.png" alt="">
                                            </div>
                                            <div class="count_content">
                                                <h3><span class="counter">
                                                    <%
                                                        String sel = "select count(department_id) as id from tbl_department";
                                                        ResultSet rs = con.selectCommand(sel);
                                                        rs.next();
                                                        out.print(rs.getString("id"));
                                                    %>
                                                </span> </h3>
                                                <p>Department</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="single_element">
                        <div class="quick_activity">
                            <div class="row">
                                <div class="col-12">
                                    <div class="quick_activity_wrap">
                                        <div class="single_quick_activity d-flex">
                                            <div class="icon">
                                                <img src="../Assets/Template/Admin/img/icon/user.png" alt="">
                                            </div>
                                            <div class="count_content">
                                                <h3><span class="counter">
                                                    <%
                                                        String selStudents = "select count(student_id) as id from tbl_student";
                                                        ResultSet rsStudents = con.selectCommand(selStudents);
                                                        rsStudents.next();
                                                        out.print(rsStudents.getString("id"));
                                                    %>
                                                </span> </h3>
                                                <p>Students</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                        <div class="col-lg-12">
                    <div class="single_element">
                        <div class="quick_activity">
                            <div class="row">
                                <div class="col-12">
                                    <div class="quick_activity_wrap">
                                        <div class="single_quick_activity d-flex">
                                            <div class="icon">
                                                <img src="../Assets/Template/Admin/img/icon/user.png" alt="">
                                            </div>
                                            <div class="count_content">
                                                <h3><span class="counter">
                                                    <%
                                                        String selfaculty = "select count(faculty_id) as idf from tbl_faculty";
                                                        ResultSet rsfaculty = con.selectCommand(selfaculty);
                                                        rsfaculty.next();
                                                        out.print(rsfaculty.getString("idf"));
                                                    %>
                                                </span> </h3>
                                                <p>Faculties</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                        
                <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Faculties</h3>
                                    </div>
                                </div>
                                <div class="staf_list_wrapper sraf_active owl-carousel">
                                    <%
                                        String selQry = "select * from tbl_faculty p inner join tbl_department q on p.department_id=q.department_id inner join tbl_department_type r on q.department_type_id=r.department_type_id";
                                        ResultSet rssp = con.selectCommand(selQry);
										while(rssp.next())
                                        {
                                    %>
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="../Assets/Files/Teacher/<%=rssp.getString("faculty_photo")%>" alt="">
                                        </div>
                                        <h4><%=rssp.getString("faculty_name")%></h4>
                                        <p><%=rssp.getString("department_type_name")%></p>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>
        <!-- main content part end -->

        <!-- footer  -->
        <!-- jquery slim -->
        <script src="../Assets/Template/Admin/js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="../Assets/Template/Admin/js/popper.min.js"></script>
        <!-- bootstarp js -->
        <script src="../Assets/Template/Admin/js/bootstrap.min.js"></script>
        <!-- sidebar menu  -->
        <script src="../Assets/Template/Admin/js/metisMenu.js"></script>
        <!-- waypoints js -->
        <script src="../Assets/Template/Admin/vendors/count_up/jquery.waypoints.min.js"></script>
        <!-- waypoints js -->
        <script src="../Assets/Template/Admin/vendors/chartlist/Chart.min.js"></script>
        <!-- counterup js -->
        <script src="../Assets/Template/Admin/vendors/count_up/jquery.counterup.min.js"></script>
        <!-- swiper slider js -->
        <script src="../Assets/Template/Admin/vendors/swiper_slider/js/swiper.min.js"></script>
        <!-- nice select -->
        <script src="../Assets/Template/Admin/vendors/niceselect/js/jquery.nice-select.min.js"></script>
        <!-- owl carousel -->
        <script src="../Assets/Template/Admin/vendors/owl_carousel/js/owl.carousel.min.js"></script>
        <!-- gijgo css -->
        <script src="../Assets/Template/Admin/vendors/gijgo/gijgo.min.js"></script>
        <!-- responsive table -->
        <script src="../Assets/Template/Admin/vendors/datatable/js/jquery.dataTables.min.js"></script>
        <script src="../Assets/Template/Admin/vendors/datatable/js/dataTables.responsive.min.js"></script>
        <script src="../Assets/Template/Admin/vendors/datatable/js/dataTables.buttons.min.js"></script>
        <script src="../Assets/Template/Admin/vendors/datatable/js/buttons.flash.min.js"></script>
        <script src="../Assets/Template/Admin/vendors/datatable/js/jszip.min.js"></script>
        <script src="../Assets/Template/Admin/vendors/datatable/js/pdfmake.min.js"></script>
        <script src="../Assets/Template/Admin/vendors/datatable/js/vfs_fonts.js"></script>
        <script src="../Assets/Template/Admin/vendors/datatable/js/buttons.html5.min.js"></script>
        <script src="../Assets/Template/Admin/vendors/datatable/js/buttons.print.min.js"></script>

        <script src="../Assets/Template/Admin/js/chart.min.js"></script>
        <!-- progressbar js -->
        <script src="../Assets/Template/Admin/vendors/progressbar/jquery.barfiller.js"></script>
        <!-- tag input -->
        <script src="../Assets/Template/Admin/vendors/tagsinput/tagsinput.js"></script>
        <!-- text editor js -->
        <script src="../Assets/Template/Admin/vendors/text_editor/summernote-bs4.js"></script>

        <script src="../Assets/Template/Admin/vendors/apex_chart/apexcharts.js"></script>

        <!-- custom js -->
        <script src="../Assets/Template/Admin/js/custom.js"></script>

        <script src="../Assets/Template/Admin/vendors/apex_chart/bar_active_1.js"></script>
        <script src="../Assets/Template/Admin/vendors/apex_chart/apex_chart_list.js"></script>
    </body>
</html>
