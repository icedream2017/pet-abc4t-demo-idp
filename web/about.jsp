<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="pet identity provider" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Alice' rel='stylesheet' type='text/css'>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.easydropdown.js"></script>
</head>
<body>
<!-- header -->
<div class="banner">
    <%@include file="includes/header.jsp" %>
    <div class="banner-info1">
        <div class="banner-col">
        </div>

        <div class="container">
            <h2>about</h2>
        </div>
    </div>
</div>
<!-- header -->
<!-- about -->
<div class="about">
    <div class="container">
        <div class="about-top">
            <section class="title-section">
                <ul class="breadcrumb breadcrumb__t"><li><a href="index.html">Home</a></li><li class="active">About</li></ul>
            </section>
            <div class="about-desc">
                <h3><a href="#">Lorem Ipsum is simply dummy text</a></h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Duis aute irure dolor in reprehenderit</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Duis aute irure dolor in reprehenderit Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Duis aute irure dolor in reprehenderit</p>
                <a href="#" title="read more" class="button">read more</a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 about_left">
                <ul class="about-list">
                    <h4 class="m_2">Advantages</h4>
                    <li><a href="#">Always free from repetition</a><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt</p></li>
                    <li><a href="#">Always free from repetition</a><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt</p></li>
                    <li><a href="#">Always free from repetition</a><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt</p></li>
                </ul>
            </div>
            <div class="col-md-8">
                <h3 class="m_3">Testimonials</h3>
                <ul class="about_right">
                    <li class="test_img">
                        <img src="images/pic1.jpg" class="img-responsive" alt=""/>
                    </li>
                    <li class="test_desc">
                        <h4><a href="#">Ut enim ad minim veniam</a></h4>
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim</p>
                    </li>
                    <div class="clearfix"> </div>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- about -->
<!-- footer -->
<%@include file="includes/footer.jsp" %>
</body>
</html>