<%@ page import="javabeans.User" %>
<div class="header">
    <%
        User cur_user = new User();
        String cur_uid = (String)session.getAttribute("cur_uid");
        String cur_name = (String)session.getAttribute("cur_name");
        String cur_pass = (String)session.getAttribute("cur_pass");
        int current_user_type = cur_user.identifyUser(cur_name,cur_pass);
        boolean current_user_isActive = cur_user.getActiveFlag()==1;
        cur_user.close();
    %>
    <div class="container">
        <div class="head-bann">
            <div class="logo">
                <a href="index.jsp"><img src="images/logo.png" width="200" height="68" class="img-responsive" alt="" /></a>
            </div>
            <div class="head-part">
                <% if(current_user_type == -1) { %>
                <ul>
                    <li><a href="login.jsp">sign in</a></li> /
                    <li><a href="register.jsp">sign up</a></li>
                </ul>
                <% } else {%>
                <ul>
                    <li>Welcome, <%=cur_name%></li> /
                    <li><a href="logout.action">sign out</a></li>
                </ul>
                <% }%>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!-- start h_menu4 -->
        <div class="h_menu4">
            <a class="toggleMenu" href="">Menu</a>
            <ul class="nav">
                <li class="active"><a href="index.jsp">HOME</a></li>
                <li><a href="person.jsp" class="root">PERSON</a>
                    <ul class="drdw">
                        <li><a href="person.jsp">My Profile</a></li>
                        <li><a href="identities.jsp">My Identities</a></li>
                        <li><a href="identity-add.jsp">New Identity</a></li>
                        <li><a href="verification.jsp">Verification</a></li>
                    </ul>
                </li>
                <li><a href="enterprise.jsp" class="root">COMPANY</a>
                    <ul class="drdw">
                        <li><a href="enterprise.jsp">Profile</a></li>
                        <li><a href="identity-enterprise.jsp">Identity</a></li>
                        <li><a href="verification.jsp">Verification</a></li>
                    </ul>
                </li>
                <li><a href="blog.jsp">BLOG</a></li>
                <li><a href="about.jsp">ABOUT</a></li>
                <li><a href="contact.jsp">CONTACT</a></li>
            </ul>
            <script type="text/javascript" src="js/nav.js"></script>
        </div>
        <!-- end h_menu4 -->



    </div>
</div>