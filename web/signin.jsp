<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sign in</title>
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
<!--- start-content---->
<div class="content login-box">
    <div class="login-main">
        <div class="container">
            <h1>LOGIN OR CREATE AN ACCOUNT</h1>
            <div class="login-left">
                <h3>NEW CUSTOMERS</h3>
                <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                <a class="acount-btn" href="register.html">Create an Account</a>
            </div>
            <div class="login-right">
                <h3>REGISTERED CUSTOMERS</h3>
                <p>If you have an account with us, please log in.</p>
                <form>
                    <div>
                        <span>Email Address<label>*</label></span>
                        <input type="text">
                    </div>
                    <div>
                        <span>Password<label>*</label></span>
                        <input type="password">
                    </div>
                    <a class="forgot" href="#">Forgot Your Password?</a>
                    <input type="submit" value="Login" />
                </form>
            </div>
            <div class="clear"> </div>
        </div>
    </div>
</div>
<!-- footer -->
<div class="footer">
    <div class="container">
        <div class="footer-top">
            <div class="subsc">
                <div class="monthly">
                    <p>Subscribe Our </p>
                    <h5>Monthly Newsletter </h5>
                    <p>for Up to Date</p>
                </div>
                <div class="mail">
                    <form>
                        <input type="text" class="text" value=" Your mail" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = ' Your mail';}">
                        <input type="submit" value="SUBMIT">
                    </form>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="footer-nav">
                <ul>
                    <li><a href="index.html">home </a></li> \
                    <li><a href="portfolio.html">product </a></li> \
                    <li><a href="contact.html">contact </a></li> \
                    <li><a href="about.html">about</a></li> \
                    <li><a href="blog.html">blog</a></li>
                    <div class="clearfix"> </div>
                </ul>
            </div>
            <p>Copyright &copy; 2016.Company name All rights reserved.</p>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp" %>
</body>
</html>