<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Identity</title>
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
            <form action="register-identity.action" method="post">
                <div class="register-top-grid">
                    <h3>CREATE A NEW IDENTITY</h3>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>Purpose<label>*</label></span>
                        <input type="text" name="newid_purpose">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span></span>
                        <input type="hidden">
                    </div>
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>Privacy Mode<label>*</label></span>
                        <input type="checkbox" name="newid_mask1" value="64">Tax ID <br>
                        <input type="checkbox" name="newid_mask2" value="32" checked>First Name <br>
                        <input type="checkbox" name="newid_mask3" value="16">Birthday <br>
                        <input type="checkbox" name="newid_mask4" value="8">Address <br>
                        <input type="checkbox" name="newid_mask5" value="4">Email Address <br>
                        <input type="checkbox" name="newid_mask6" value="2">Phone Number <br>
                        <input type="checkbox" name="newid_mask7" value="1" checked>Description <br>
                    </div>
                </div>
                <div class="register-bottom-grid">
                    <div class="wow fadeInLeft" data-wow-delay="0.4s">
                        <span>Verify your Password<label>*</label></span>
                        <input type="password" name="verify_password">
                    </div>
                    <div class="wow fadeInRight" data-wow-delay="0.4s">
                        <span></span>
                        <input type="hidden">
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