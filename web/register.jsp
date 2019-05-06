<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
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
<!-- registration -->
<div class="login-main">
    <div class="container">
        <div class="register">
            <form action="register.action" method="post">
                <div class="register-top-grid">
                    <h3>LOGIN CREDENTIAL</h3>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>Username<label>*</label></span>
                        <input type="text" name="new_username">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Register Code<label>*</label></span>
                        <input type="text" name="new_rcode">
                    </div>
                </div>
                <div class="register-bottom-grid">
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>Password<label>*</label></span>
                        <input type="password" name="new_password">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Confirm Password<label>*</label></span>
                        <input type="password" name="new_password_1">
                    </div>
                </div>
                <div class="register-but">
                    <input type="submit" value="Submit" />
                </div>
            </form>
        </div>
    </div>
</div>
<!-- registration -->
<!-- footer -->
<%@include file="includes/footer.jsp" %>
<!-- footer -->
</body>
</html>