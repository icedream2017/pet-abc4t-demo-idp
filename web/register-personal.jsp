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
            <form action="register-personal.action" method="post">
                <div class="register-top-grid">
                    <h3>PERSONAL INFORMATION</h3>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>First Name<label>*</label></span>
                        <input type="text" name="new_first_name">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Last Name<label>*</label></span>
                        <input type="text" name="new_last_name">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Title<label>.</label></span>
                        <input type="radio" name="new_title" value="" checked> (Empty)
                        <input type="radio" name="new_title" value="Dr." > Dr.
                        <input type="radio" name="new_title" value="Prof." > Prof.
                        <input type="radio" name="new_title" value="Assoc Prof." > Assoc Prof.
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Gender<label>*</label></span>
                        <input type="radio" name="new_gender" value="1" checked> Male
                        <input type="radio" name="new_gender" value="0"> Female
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Tax ID<label>*</label></span>
                        <input type="text" name="new_tax_id">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Email Address<label>*</label></span>
                        <input type="text" name="new_email">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Phone<label>*</label></span>
                        <input type="text" name="new_phone">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Address<label>*</label></span>
                        <input type="text" name="new_address">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Birthdate<label>*</label></span>
                        <input type="text" name="new_birth">
                    </div>

                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Description<label>.</label></span>
                        <input type="text" name="new_bio">
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