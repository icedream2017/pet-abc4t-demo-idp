<%@ page import="java.util.ArrayList" %>
<%@ page import="javabeans.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Identities</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="4pet identity provider" />
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
        Person p = new Person();
        boolean flag = p.getElementById(cur_name);
        p.close();
    %>
    <div class="products-section">
        <div class="container">
            <h2>MY IDENTITIES</h2>
            <div>
                <% if (flag && current_user_isActive && current_user_type==1) {
                    Identity identity = new Identity();
                    ArrayList<Identity> arrayList = identity.getIdentitiesByUid(cur_name);
                    for (Identity i: arrayList) {
                %>
                <%--<img src="https://zxing.org/w/chart?cht=qr&chs=120x120&chld=L&choe=UTF-8&chl=<%=i.getHashcode()%>">--%>
                <table width=90% align="center" border=1>
                    <tr>
                        <td width="20%">Hashcode</td>
                        <td width="80%"><%=i.getHashcode()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Purpose</td>
                        <td width="80%"><%=i.getPurpose()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Masked Info</td>
                        <td width="80%"><%=Identity.generatePersonalInfo(p,new Shadow(i.getMask()),i.getPurpose())%></td>
                    </tr>
                    <tr>
                        <td width="20%">Is Adult?</td>
                        <td width="80%"><%=Verification.isAdult(p)?"Yes":"No"%></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            &nbsp;&nbsp;<a href="verification-res.jsp?iid=<%=i.getHashcode()%>">[verify]</a>&nbsp;&nbsp;
                            &nbsp;&nbsp;<a href="identity-del.action?iid=<%=i.getHashcode()%>">[revoke]</a>&nbsp;&nbsp;
                            &nbsp;&nbsp;<a href="#">[modify]</a>&nbsp;&nbsp;
                        </td>
                    </tr>
                </table><br><br>
                <%  }
                    identity.close();
                  } else {
                %>
                <p>Identity information unavailable.</p>
                <p>You may register your information first to use this function,</p>
                <p>or sign in with a personal account.</p>
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