<%@ page import="javabeans.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Enterprise Identity</title>
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
    <!-- check user signing status and active flag -->
    <%
        if (current_user_type==-1) {  // if user is not signed in
            response.sendRedirect("login.jsp");
        } else if (!current_user_isActive) {  // if user has not registered person
            response.sendRedirect("register-enterprise.jsp");
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
<div class="projects">
    <%
        Enterprise e = new Enterprise();
        boolean isEnterpriseAvailable = e.getElementById(cur_name);
        e.close();
    %>
    <div class="products-section">
        <div class="container">
            <h2>ENTERPRISE IDENTITY</h2>
            <div>
                <%if (isEnterpriseAvailable && current_user_isActive && current_user_type==2) {
                    Identity identity = new Identity();
                    ArrayList<Identity> arrayList = identity.getIdentitiesByUid(cur_name);
                    for (Identity i: arrayList) {
                %>
                <%String hashcode = i.getHashcode();%>
                <table width="90%" align="center" border=1>
                    <tr>
                        <th width="20%">Attribute</th>
                        <th width="80%">Value</th>
                    </tr>
                    <tr>
                        <td width="20%">Hashcode</td>
                        <td width="80%"><%=hashcode%></td>
                    </tr>
                    <tr>
                        <td width="20%">Company Name</td>
                        <td width="80%"><%=e.getName()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Manager</td>
                        <td width="80%"><%=e.getManager()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Website</td>
                        <td width="80%"><%=e.getWebsite()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Date of Found</td>
                        <td width="80%"><%=e.getDate()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Address</td>
                        <td width="80%"><%=e.getAddress()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Email</td>
                        <td width="80%"><%=e.getEmail()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Phone Nr.</td>
                        <td width="80%"><%=e.getPhone()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Description</td>
                        <td width="80%"><%=e.getDescription()%></td>
                    </tr>
                </table>
                <img src="https://zxing.org/w/chart?cht=qr&chs=120x120&chld=L&choe=UTF-8&chl=<%=hashcode%>">
                <p>QR Code is provided by zxing.org</p>
                <%}%>
                <%} else { %>
                <p>Not an enterprise account.</p>
                <%} %>
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