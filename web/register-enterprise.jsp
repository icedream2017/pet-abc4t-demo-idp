<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Enterprise Register</title>
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
    <!-- check user signing status and active flag -->
    <%
        if (current_user_type==-1) {  // if user is not signed in
            response.sendRedirect("login.jsp");
        } else if (current_user_isActive) {  // if user has already activated
            response.sendRedirect("enterprise.jsp");
        } else if (current_user_type!=2 && current_user_isActive) {  // if user is not a personal user
            response.sendRedirect("index.jsp");
        }
    %>
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
            <form action="register-enterprise.action" method="post">
                <div class="register-top-grid">
                    <h3>PLEASE REGISTER YOUR COMPANY INFORMATION FIRST</h3>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>Company Name<label>*</label></span>
                        <input type="text" name="new_company_name">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Manager Name<label>*</label></span>
                        <input type="text" name="new_manager_name">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Website<label>*</label></span>
                        <input type="text" name="new_website">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Date of Found<label>*</label></span>
                        <input type="text" name="new_found_date">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Address<label>*</label></span>
                        <input type="text" name="new_address">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Email Address<label>*</label></span>
                        <input type="text" name="new_email">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Phone Nr.<label>*</label></span>
                        <input type="text" name="new_phone">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span>Description<label>.</label></span>
                        <input type="text" name="new_description">
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