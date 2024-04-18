<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>Parent home</title>
    
    <!-- Bootstrap core CSS -->
    <link href="../Assets/Template/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../Assets/Template/main/assets/css/fontawesome.css">
    <link rel="stylesheet" href="../Assets/Template/main/assets/css/templatemo-grad-school.css">
    <link rel="stylesheet" href="../Assets/Template/main/assets/css/owl.css">
    <link rel="stylesheet" href="../Assets/Template/main/assets/css/lightbox.css">
<!--
    
TemplateMo 557 Grad School

https://templatemo.com/tm-557-grad-school

-->
  </head>

<body>

   
  <!--header-->
  <header class="main-header clearfix" role="header">
    <div class="logo">
        <a href="#"><em>Live</em> Attendance</a>
    </div>
    <a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>
    <nav id="menu" class="main-nav" role="navigation">
        <ul class="main-menu">
            <li><a href="../index.jsp">Homepage</a></li>
            <li class="has-submenu">
                <ul class="sub-menu">
                    <li><a href="MyProfile.jsp">My Profile</a></li>
                    <li><a href="EditProfile.jsp">Edit Profile</a></li>
                    <li><a href="ChangePassword.jsp">Password</a></li>
                </ul>
            </li>
            <li><a href="feedback.jsp">FeedBack</a></li>
            <!-- New dropdown list -->
            <li class="has-submenu"><a href="TimeTable.jsp">Student Details</a>
                <ul class="sub-menu">
                   
                    <li><a href="ViewLeaveApplication.jsp">Leave Request</a></li>
                    <li><a href="TimeTable.jsp">Time Table</a></li>
                    <li><a href="ViewAttendance.jsp">View Attendance</a></li>
                </ul>
            </li>
            <!-- End of new dropdown list -->
            <li><a href="../Logout.jsp">Logout</a></li>
        </ul>
    </nav>
</header>


  <!-- ***** Main Banner Area Start ***** -->
  <section class="section main-banner" id="top" data-section="section1">
      <video autoplay muted loop id="bg-video">
          <source src="../Assets/Template/main/assets/images/course-video.mp4" type="video/mp4" />
      </video>

      <div class="video-overlay header-text">
          <div class="caption">
              <h6>Indira Gandhi Group Of Institution</h6>
                <%
              String pid = session.getAttribute("parentid").toString();
            
                     
              
              String sel = "select * from tbl_parent q  inner join tbl_student y on q.parent_id=y.parent_id inner join tbl_department p on y.department_id=p.department_id inner join tbl_department_type r on p.department_type_id=r.department_type_id where q.parent_id='"+pid+"'  ";
              ResultSet tr = con.selectCommand(sel);
              tr.next();
              
              
              %>
              <h2> Guardian <em><%=tr.getString("parent_name")%></em> </h2>
              <div class="main-button">
                   <div class="scroll-to-section"><a href="#section2"><%=tr.getString("student_name")%></a></div>
                   <br>
                  <div class="scroll-to-section"><a href="#section2"><%=tr.getString("department_type_name")%></a></div>
                  
              </div>
          </div>
      </div>
  </section>
  <!-- ***** Main Banner Area End ***** -->


  <section class="features">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-12">
          <div class="features-post">
            <div class="features-content">
              <div class="content-show">
                  <h4><i class="fa fa-pencil"></i>Variety Courses</h4>
              </div>
              <div class="content-hide">
                <p>We offer a wide variety of courses such a arts courses,science courses,dental science,law studies etc</p>
                <p class="hidden-sm">Curabitur id eros vehicula, tincidunt libero eu, lobortis mi. In mollis eros a posuere imperdiet.</p>
                <div class="scroll-to-section"><a href="#section2">More Info.</a></div>
            </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-12">
          <div class="features-post second-features">
            <div class="features-content">
              <div class="content-show">
                <h4><i class="fa fa-graduation-cap"></i>Top Rated Faculties</h4>
              </div>
              <div class="content-hide">
                <p>We have top rated faculties in our store. Graduated from top universities</p>
                <p class="hidden-sm">Curabitur id eros vehicula, tincidunt libero eu, lobortis mi. In mollis eros a posuere imperdiet.</p>
                <div class="scroll-to-section"><a href="#section3">Details</a></div>
            </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-12">
          <div class="features-post third-features">
            <div class="features-content">
              <div class="content-show">
                <h4><i class="fa fa-book"></i>NAAC Approved</h4>
              </div>
              <div class="content-hide">
                <p>NAAC stands for National Assessment Accreditation Council. It is a body that grades colleges , institutions and universities based on their performance in certain set parameters.It gives an idea about the university and it's quality status </p>
                <p class="hidden-sm">Curabitur id eros vehicula, tincidunt libero eu, lobortis mi. In mollis eros a posuere imperdiet.</p>
                <div class="scroll-to-section"><a href="#section4">Read More</a></div>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

 <section class="section why-us" data-section="section2">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
           <h2>Why choose Live Attendance?</h2>
          </div>
        </div>
        <div class="col-md-12">
          <div id='tabs'>
            <ul>
                <li><a href='#tabs-1'>Best Education</a></li>
              <li><a href='#tabs-2'>Top Management</a></li>
              <li><a href='#tabs-3'>Quality Interactions</a></li>
            </ul>
            <section class='tabs-content'>
              <article id='tabs-1'>
                <div class="row">
                  <div class="col-md-6">
                    <img src="../Assets/Template/main/assets/images/choose-us-image-01.png" alt="">
                  </div>
                  <div class="col-md-6">
                    <h4>Best Education</h4>
                    <p>"Access to high-quality, inclusive education is essential for empowering individuals and fostering equitable opportunities for personal and societal advancement." <a href="https://paypal.me/templatemo" target="_parent" rel="sponsored"></a> </p>
                  </div>
                </div>
              </article>
              <article id='tabs-2'>
                <div class="row">
                  <div class="col-md-6">
                    <img src="../Assets/Template/main/assets/images/choose-us-image-02.png" alt="">
                  </div>
                  <div class="col-md-6">
                    <h4>Top Level Management</h4>
                    <p>"Effective education management requires strategic vision, innovative leadership, and a commitment to continuous improvement to ensure optimal learning outcomes for all stakeholders."</p> 
                  </div>
                </div>
              </article>
              <article id='tabs-3'>
                <div class="row">
                  <div class="col-md-6">
                    <img src="../Assets/Template/main/assets/images/choose-us-image-03.png" alt="">
                  </div>
                  <div class="col-md-6">
                    <h4>Quality Intraction</h4>
                    <p>"Quality educational interaction cultivates a dynamic exchange of ideas, fosters critical thinking skills, and nurtures a supportive learning environment where students are engaged and empowered to reach their full potential." <a rel="nofollow" href="https://templatemo.com/contact" target="_parent"></a> now.</p>
                  </div>
                </div>
              </article>
            </section>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="section coming-soon" data-section="section3">
    <div class="container">
      <div class="row">
        <div class="col-md-7 col-xs-12">
          <div class="continer centerIt">
            <div>
              <h4>Take <em>any online course for your children</em> and win a scholarship</h4>
              <div class="counter">

                <div class="days">
                  <div class="value">00</div>
                  <span>Days</span>
                </div>

                <div class="hours">
                  <div class="value">00</div>
                  <span>Hours</span>
                </div>

                <div class="minutes">
                  <div class="value">00</div>
                  <span>Minutes</span>
                </div>

                <div class="seconds">
                  <div class="value">00</div>
                  <span>Seconds</span>
                </div>

              </div>
            </div>
          </div>
        </div>
        <div class="col-md-5">
          <div class="right-content">
            <div class="top-content">
              <h6>Register your free account and <em>get immediate</em> access to online courses</h6>
            </div>
            <form id="contact" action="" method="get">
              <div class="row">
                <div class="col-md-12">
                  <fieldset>
                    <input name="name" type="text" class="form-control" id="name" placeholder="Your Name" required>
                  </fieldset>
                </div>
                <div class="col-md-12">
                  <fieldset>
                    <input name="email" type="text" class="form-control" id="email" placeholder="Your Email" required>
                  </fieldset>
                </div>
                <div class="col-md-12">
                  <fieldset>
                    <input name="phone-number" type="text" class="form-control" id="phone-number" placeholder="Your Phone Number" required>
                  </fieldset>
                </div>
                <div class="col-md-12">
                  <fieldset>
                    <button type="submit" id="form-submit" class="button">Get it now</button>
                  </fieldset>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="section courses" data-section="section4">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Here is the List Of Add On Courses We Provide</h2>
                </div>
            </div>
        </div>
        <div class="owl-carousel owl-theme">
            <%
                
                String sel4 = "select * from tbl_add_on p inner join tbl_course q on p.course_id=q.course_id";
                ResultSet rt = con.selectCommand(sel4);
                int i = 0;
                while(rt.next()) {
                    i++;
            %>
            <div class="item">
                <img src="../Assets/Files/AddON/<%= rt.getString("add_on_photo") %>" alt="Course #<%=i%>">
                <div class="down-content">
                    <h4><%= rt.getString("add_on_name") %></h4>
                    <p>You can get free images and videos for your websites by visiting Unsplash, Pixabay, and Pexels.</p>
                    <div class="text-button-pay">
<!--                        <a href="#">Pay <i class="fa fa-angle-double-right"></i></a>-->
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</section>
  

  <section class="section video" data-section="section5">
    <div class="container">
      <div class="row">
        <div class="col-md-6 align-self-center">
          <div class="left-content">
              <span>our presentation is for you</span>
            <h4>Watch the video to learn more <em>about IGC</em></h4>
            <p>Indira Gandhi College of Arts and Science is a first grade Post Graduate institution of higher education established in the year 2002 at Nellikuzhy about 5 KM from Kothamangalam The Educational Hub of Kerala. The College is approved by the Govt. of Kerala and affiliated with Mahatma Gandhi University, Kottayam. It is founded & managed by the Indira Gandhi Memorial Trust. The Trust also owns and manages Indira Gandhi Institute of Dental Sciences, Indira Gandhi Institute of Engineering & Technology, Indira Gandhi Polytechnic College, Indira Gandhi College of Paramedical Science, KMP Group of Institutions & SSM LP School Kudumunda. <a rel="nofollow" href="https://templatemo.com/contact" target="_parent">contact jaasimee</a> for details.
            <br><br>Kothamangalam/kerala/india</p>
          </div>
        </div>
        <div class="col-md-6">
          <article class="video-item">
            <div class="video-caption">
             <h4>Indira Gandhi Group Of Instituions</h4>
            </div>
            <figure>
                <a href="https://youtu.be/BWEnX9ECoEI?si=wvqeezzOQWTID8Z7" class="play"><img src="../Assets/Template/main/assets/images/ig.jpg"></a>
            </figure>
          </article>
        </div>
      </div>
    </div>
  </section>

  <section class="section contact" data-section="section6">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
            <h2>Let?s Keep In Touch</h2>
          </div>
        </div>
        <div class="col-md-6">
        
        <!-- Do you need a working HTML contact-form script?
                	
                    Please visit https://templatemo.com/contact page -->
                    
          <form id="contact" action="" method="post">
            <div class="row">
              <div class="col-md-6">
                  <fieldset>
                    <input name="name" type="text" class="form-control" id="name" placeholder="Your Name" required>
                  </fieldset>
                </div>
                <div class="col-md-6">
                  <fieldset>
                    <input name="email" type="text" class="form-control" id="email" placeholder="Your Email" required>
                  </fieldset>
                </div>
              <div class="col-md-12">
                <fieldset>
                  <textarea name="message" rows="6" class="form-control" id="message" placeholder="Your message..." required></textarea>
                </fieldset>
              </div>
              <div class="col-md-12">
                <fieldset>
                  <button type="submit" id="form-submit" class="button">Send Message Now</button>
                </fieldset>
              </div>
            </div>
          </form>
        </div>
        <div class="col-md-6">
          <div id="map">
           <iframe src="https://maps.google.com/maps?q=10.0745,76.5911&output=embed" width="100%" height="422px" frameborder="0" style="border:0" allowfullscreen></iframe>
          </div>
        </div>
      </div>
    </div>
  </section>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <p><i class="fa fa-copyright"></i> Copyright 2020 by Live Attendance 
          
           | Design: <a href="https://templatemo.com" rel="sponsored" target="_parent">Jaasimee</a><br>
           Distributed By: <a href="https://themewagon.com" rel="sponsored" target="_blank">Jaasimee</a>
          
          </p>
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
<!--    <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .scroll-to-section').on('click', 'a', function (e) {
          if($(e.target).hasClass('external')) {
            return;
          }
          e.preventDefault();
          $('#menu').removeClass('active');
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>-->
</body>
</html>