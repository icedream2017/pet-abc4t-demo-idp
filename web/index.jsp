<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>PET Identity Center</title>
  <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
  <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="pet identity provider" />
  <script type="application/x-javascript">
      addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
  </script>
  <link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
  <link href='http://fonts.useso.com/css?family=Alice' rel='stylesheet' type='text/css'>
  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.easydropdown.js"></script>
  <script type="text/javascript" src="js/easing.js"></script>
  <script type="text/javascript">
      jQuery(document).ready(function($) {
          $(".scroll").click(function(event){
              event.preventDefault();
              $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
          });
      });
  </script>

</head>
<body>
<!-- header -->
<div class="banner">
  <%@include file="includes/header.jsp" %>
  <div class="banner-slider">
    <div class="banner-col">
    </div>

    <div class="wmuSlider example1 section" id="section-1">
      <article style="position: absolute; width: 100%; opacity: 0;">
        <div class="banner-info">
          <div class="container">
            <h1>“WE LOVE TO KEEP YOUR PRIVACY”</h1>
          </div>
        </div>
      </article>
      <article style="position: absolute; width: 100%; opacity: 0;">
        <div class="banner-info">
          <div class="container">
            <h1>“Attribute-Based Credentials”</h1>
          </div>
        </div>
      </article>
      <article style="position: absolute; width: 100%; opacity: 0;">
        <div class="banner-info">
          <div class="container">
            <h1>“We provide secure identities”</h1>
          </div>
        </div>
      </article>
      <ul class="wmuSliderPagination">
        <li><a href="#" class="">0</a></li>
        <li><a href="#" class="">1</a></li>
        <li><a href="#" class="">2</a></li>
      </ul>
    </div>

    <!-- script -->
    <script src="js/jquery.wmuSlider.js"></script>
    <script>
        $('.example1').wmuSlider();
    </script>
  </div>	<!-- script -->

</div>
<!-- header -->


<!-- product -->
<div class="products-section">
  <div class="container">
    <h2>PRODUCT/<span>all</span></h2>
    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true   // 100% fit in a container
            });
        });

    </script>
    <link rel="stylesheet" href="css/swipebox.css">
    <script src="js/jquery.swipebox.min.js"></script>
    <script type="text/javascript">
        jQuery(function($) {
            $(".swipebox").swipebox();
        });
    </script>
    <!-- Portfolio Ends Here -->
    <div class="sap_tabs">
      <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
        <ul class="resp-tabs-list">
          <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>mobile apps</span></li>
          <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>web design</span></li>
          <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>ios ui</span></li>
          <li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><span>ANDROID UI</span></li>
          <div class="clearfix"></div>
        </ul>
        <div class="resp-tabs-container">
          <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
            <div class="tab_img">
              <div class="col-md-3 img-top ">
                <a href="images/3.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/3.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/4.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/4.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/5.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/5.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/6.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/6.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/5.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/5.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/3.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/3.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/6.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/6.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/4.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/4.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="clearfix"></div>
            </div>

          </div>
          <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
            <div class="tab_img">
              <div class="col-md-3 img-top ">
                <a href="images/3.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/3.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/6.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/6.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/4.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/4.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
          <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
            <div class="tab_img">

              <div class="col-md-3 img-top ">
                <a href="images/4.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/4.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/5.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/5.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>

              <div class="clearfix"></div>
            </div>
          </div>
          <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-3">
            <div class="tab_img">
              <div class="col-md-3 img-top ">
                <a href="images/3.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/3.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/4.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/4.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="col-md-3 img-top ">
                <a href="images/5.jpg" rel="title" class="b-link-stripe b-animate-go  swipebox">
                  <img src="images/5.jpg" class="img-responsive" alt=""/>
                  <div class="link-top">
                    <i class="link"> </i>
                  </div>
                </a>
              </div>
              <div class="clearfix"></div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- product -->
<!-- project -->
<div class="project">
  <div class="container">
    <div class="col-md-6 project-left">
      <h3>OUR LATEST<span>PROJECT</span></h3>
    </div>
    <div class="col-md-6 project-right">
      <a class="view" href="#">VIEW</a>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<!-- project -->
<!-- post -->
<div class="post">
  <div class="container">
    <div class="col-md-6 post-left">
      <h3>NEWEST BLOG POST </h3>
      <div class="post-left1">
        <h4>Top 10 site for sell Your ui element</h4>
        <p>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh </p>
        <div class="lab">
          <h6>3 june 2014 / 5 comment</h6>
        </div>
        <div class="but">
          <a class="more" href="#">READ MORE...</a>
        </div>
        <div class="clearfix"></div>
      </div>
      <div class="post-left1">
        <h5> IOS 8 User Interface vs android kitkat ui interface </h5>
        <p>Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh </p>
        <div class="lab">
          <h6>3 june 2014 / 5 comment</h6>
        </div>
        <div class="but">
          <a class="more" href="#">READ MORE...</a>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
    <div class="col-md-6 post-right">
      <h3>TWEET FROM <span>@4USERI</span></h3>
      <div class="post-right1">
        <h4><span>@envato</span> nec sagittis sem nibh id elit. Duis sed<span> #odio sit</span> amet nibh vulputate cursus a</h4>
        <div class="lab">
          <h6>3 june 2014</h6>
        </div>
        <div class="but">
          <a class="use" href="#">@4useri</a>
        </div>
        <div class="clearfix"></div>
      </div>
      <div class="post-right2">
        <div class="col-md-8 follow-left">
          <h5>follow us @twitter </h5>
        </div>
        <div class="col-md-4 follow-right">
          <h6>12.6 k</h6>
        </div>
        <div class="clearfix"></div>
      </div>
      <div class="post-right1">
        <h5><span>@rongbazz</span> you take my place Duis sed<span> #odio sit</span> that’s not good...</h5>
        <div class="lab">
          <h6>3 june 2014</h6>
        </div>
        <div class="but">
          <a class="use" href="#">@4useri</a>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<!-- post -->
<!-- ourteam -->
<div class="ourteam">
  <div class="container">
    <h3>MEET WITH OUR TEAM</h3>
    <div class="team">
      <ul id="flexiselDemo3">
        <li>
          <div class="team1">
            <a href="#small-dialog6" class="b-link-stripe b-animate-go  thickbox play-icon popup-with-zoom-anim">
              <img src="images/team1.jpg" class="img-responsive" alt="" /></a>
            <div class="both">
              <div class="both-left">
                <h5>Sheak Reza</h5>
                <p>CEO, Both kicu</p>
              </div>
              <div class="both-right">
                <h6><a href="#">facebook</a> /<a href="#">twitter</a>
                  <a href="#">dribbble </a>/<a href="#"> linkedin</a></h6>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </li>
        <li>
          <div class="team1">
            <a href="#small-dialog6" class="b-link-stripe b-animate-go  thickbox play-icon popup-with-zoom-anim">
              <img src="images/team2.jpg" class="img-responsive" alt="" /></a>
            <div class="both">
              <div class="both-left">
                <h5>Sheak Reza</h5>
                <p>CEO, Both kicu</p>
              </div>
              <div class="both-right">
                <h6><a href="#">facebook</a> /<a href="#">twitter</a>
                  <a href="#">dribbble </a>/<a href="#"> linkedin</a></h6>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </li>
        <li>
          <div class="team1">
            <a href="#small-dialog6" class="b-link-stripe b-animate-go  thickbox play-icon popup-with-zoom-anim">
              <img src="images/team3.jpg" class="img-responsive" alt="" /></a>
            <div class="both">
              <div class="both-left">
                <h5>Sheak Reza</h5>
                <p>CEO, Both kicu</p>
              </div>
              <div class="both-right">
                <h6><a href="#">facebook</a> /<a href="#">twitter</a>
                  <a href="#">dribbble </a>/<a href="#"> linkedin</a></h6>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </li>
        <li>
          <div class="team1">
            <a href="#small-dialog6" class="b-link-stripe b-animate-go  thickbox play-icon popup-with-zoom-anim">
              <img src="images/team2.jpg" class="img-responsive" alt="" /></a>
            <div class="both">
              <div class="both-left">
                <h5>Sheak Reza</h5>
                <p>CEO, Both kicu</p>
              </div>
              <div class="both-right">
                <h6><a href="#">facebook</a> /<a href="#">twitter</a>
                  <a href="#">dribbble </a>/<a href="#"> linkedin</a></h6>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </li>
        <li>
          <div class="team1">
            <a href="#small-dialog6" class="b-link-stripe b-animate-go  thickbox play-icon popup-with-zoom-anim">
              <img src="images/team1.jpg" class="img-responsive" alt="" /></a>
            <div class="both">
              <div class="both-left">
                <h5>Sheak Reza</h5>
                <p>CEO, Both kicu</p>
              </div>
              <div class="both-right">
                <h6><a href="#">facebook</a> /<a href="#">twitter</a>
                  <a href="#">dribbble </a>/<a href="#"> linkedin</a></h6>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </li>

      </ul>
    </div>
    <script type="text/javascript">
        $(window).load(function() {

            $("#flexiselDemo3").flexisel({
                visibleItems: 3,
                animationSpeed: 1000,
                autoPlay: true,
                autoPlaySpeed: 3000,
                pauseOnHover: true,
                enableResponsiveBreakpoints: true,
                responsiveBreakpoints: {
                    portrait: {
                        changePoint:480,
                        visibleItems: 1
                    },
                    landscape: {
                        changePoint:640,
                        visibleItems: 2
                    },
                    tablet: {
                        changePoint:768,
                        visibleItems: 3
                    }
                }
            });

        });
    </script>
    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
  </div>
</div>
<!-- ourteam -->

<!-- contuct -->
<div class="contuct">
  <div class="container">
    <h3>CONTACT WITH US</h3>
    <div class="col-md-6 contuct-left">
      <form>
        <input type="text" class="text" value=" Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = ' Name';}">
        <input type="text" class="text" value=" Your mail address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = ' Your mail address';}">
        <textarea value="Message" onfocus="if(this.value == 'Message') this.value='';" onblur="if(this.value == '') this.value='Message';">Message</textarea>
      </form>
    </div>
    <div class="col-md-6 contuct-right">
      <h4>A Little About Us</h4>
      <p>This is Photoshop's version  of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, </p>
      <p>nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit. Class aptent taciti soci</p>
    </div>
    <div class="clearfix"></div>

  </div>
</div>
<!-- contuct -->
<!-- footer -->
  <%@include file="includes/footer.jsp" %>
<!-- footer -->
</body>
</html>

