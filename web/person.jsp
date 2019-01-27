<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>portfolio</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="4useri Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
    <div class="banner-info1">
        <div class="banner-col">
        </div>

        <div class="container">

        </div>
    </div>
</div>
<!-- header -->
<div class="projects">
    <div class="products-section">
        <div class="container">
            <h2>PROJECT/<span>all</span></h2>
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
</div>
<!-- product -->
<!-- footer -->
  <%@include file="includes/footer.jsp" %>
<!-- footer -->
</body>
</html>