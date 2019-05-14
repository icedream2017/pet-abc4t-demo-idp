<%@ page import="javabeans.*" %>
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
    <%
        Person p = new Person();
        boolean flag = p.getElementById(cur_name);
        p.close();
    %>
    <div class="container">
        <div class="register">
            <form action="register-identity.action" method="post">
                <div class="container">
                    <h2>CREATE A NEW IDENTITY</h2>
                    <div>
                        <span>Purpose</span><br>
                        <input type="text" name="newid_purpose">
                        <br><br>
                    </div>
                    <div>
                        <span>Privacy Mode</span><br>
                        <div>
                            <% if (flag) { %>
                            <table width="90%" align="center" border=1>
                                <tr>
                                    <th width="20%">Attribute</th>
                                    <th width="60%">Value</th>
                                    <th width="20%">Mode</th>
                                </tr>
                                <tr>
                                    <td width="20%">Username</td>
                                    <td width="60%"><%=p.getUid()%></td>
                                    <td width="20%">(Not included in identity)</td>
                                </tr>
                                <tr>
                                    <td width="20%">Tax ID</td>
                                    <td width="60%"><%=p.getTaxID()%></td>
                                    <td width="20%">
                                        <input type="radio" name="sh_taxid" value="64">Public /
                                        <input type="radio" name="sh_taxid" value="0" checked>Private
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">Title</td>
                                    <td width="60%"><%=p.getTitle()%></td>
                                    <td width="20%">(Public by default)</td>
                                </tr>
                                <tr>
                                    <td width="20%">Last Name</td>
                                    <td width="60%"><%=p.getSurname()%></td>
                                    <td width="20%">(Public by default)</td>
                                </tr>
                                <tr>
                                    <td width="20%">First Name</td>
                                    <td width="60%"><%=p.getFirstname()%></td>
                                    <td width="20%">
                                        <input type="radio" name="sh_firstname" value="32" checked>Public /
                                        <input type="radio" name="sh_firstname" value="0">Private
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">Gender</td>
                                    <td width="60%"><%=p.getGender()==1?"Male":"Female"%></td>
                                    <td width="20%">(Public by default)</td>
                                </tr>
                                <tr>
                                    <td width="20%">Birth Date</td>
                                    <td width="60%"><%=p.getBirthdate()%></td>
                                    <td width="20%">
                                        <input type="radio" name="sh_birth" value="16">Public /
                                        <input type="radio" name="sh_birth" value="0" checked>Private
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">Home Address</td>
                                    <td width="60%"><%=p.getAddress()%></td>
                                    <td width="20%">
                                        <input type="radio" name="sh_address" value="8">Public /
                                        <input type="radio" name="sh_address" value="0" checked>Private
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">Email</td>
                                    <td width="60%"><%=p.getEmail()%></td>
                                    <td width="20%">
                                        <input type="radio" name="sh_email" value="4">Public /
                                        <input type="radio" name="sh_email" value="0" checked>Private
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">Phone Nr.</td>
                                    <td width="60%"><%=p.getPhone()%></td>
                                    <td width="20%">
                                        <input type="radio" name="sh_phone" value="2">Public /
                                        <input type="radio" name="sh_phone" value="0" checked>Private
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">Bio</td>
                                    <td width="60%"><%=p.getDescription()%></td>
                                    <td width="20%">
                                        <input type="radio" name="sh_bio" value="1">Public /
                                        <input type="radio" name="sh_bio" value="0" checked>Private
                                    </td>
                                </tr>
                            </table>
                            <%} else { %>
                            <p>Personal information unavailable.</p>
                            <%} %>
                        </div>
                        <br>
                    </div>
                    <div>
                        <span>Verify your Password<label>*</label></span>
                        <input type="password" name="verify_password">
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