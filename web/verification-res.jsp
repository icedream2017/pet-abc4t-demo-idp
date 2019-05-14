<%@ page import="javabeans.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Person</title>
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
        String hashcode = request.getParameter("vid");
        Identity ia = new Identity();
        boolean isIdAvailable = ia.getElementById(hashcode);
        ia.close();
        Person p = new Person();
        boolean isPersonAvailable = p.getElementById(ia.getUid());
        p.close();
        byte idmask = ia.getMask();
    %>
    <div class="products-section">
        <div class="container">
            <h2>VERIFICATION RESULT</h2>
            <div>
                <% if (isIdAvailable && isPersonAvailable) { %>
                <table width="90%" align="center" border=1>
                    <tr>
                        <th width="20%">Attribute</th>
                        <th width="80%">Value</th>
                    </tr>
                    <tr>
                        <td width="20%">Hashcode</td>
                        <td width="80%"><%=ia.getHashcode()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Purpose</td>
                        <td width="80%"><%=ia.getPurpose()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Is Adult?</td>
                        <td width="80%"><%=Verification.isAdult(p)?"Yes":"No"%></td>
                    </tr>
                    <tr>
                        <td width="20%">Tax ID</td>
                        <td width="80%"><%=(Shadow.TAXID&idmask)==64?p.getTaxID():"[hidden]"%></td>
                    </tr>
                    <tr>
                        <td width="20%">Title</td>
                        <td width="80%"><%=p.getTitle()%></td>
                    </tr>
                    <tr>
                        <td width="20%">Last Name</td>
                        <td width="80%"><%=p.getSurname()%></td>
                    </tr>
                    <tr>
                        <td width="20%">First Name</td>
                        <td width="80%"><%=(Shadow.FIRSTNAME&idmask)==32?p.getFirstname():"[hidden]"%></td>
                    </tr>
                    <tr>
                        <td width="20%">Gender</td>
                        <td width="80%"><%=p.getGender()==1?"Male":"Female"%></td>
                    </tr>
                    <tr>
                        <td width="20%">Birth Date</td>
                        <td width="80%"><%=(Shadow.BIRTHDATE&idmask)==16?p.getBirthdate():"[hidden]"%></td>
                    </tr>
                    <tr>
                        <td width="20%">Home Address</td>
                        <td width="80%"><%=(Shadow.ADDRESS&idmask)==8?p.getAddress():"[hidden]"%></td>
                    </tr>
                    <tr>
                        <td width="20%">Email</td>
                        <td width="80%"><%=(Shadow.EMAIL&idmask)==4?p.getEmail():"[hidden]"%></td>
                    </tr>
                    <tr>
                        <td width="20%">Phone Nr.</td>
                        <td width="80%"><%=(Shadow.PHONE&idmask)==2?p.getPhone():"[hidden]"%></td>
                    </tr>
                    <tr>
                        <td width="20%">Bio</td>
                        <td width="80%"><%=(Shadow.DESCRIPTION&idmask)==1?p.getDescription():"[hidden]"%></td>
                    </tr>
                </table>
                <%} else { %>
                <p>Verification failed. This ID is unavailable.</p>
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