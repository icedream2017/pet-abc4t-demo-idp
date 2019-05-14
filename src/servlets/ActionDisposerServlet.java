package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import cryptography.Cryptography;
import javabeans.*;

@WebServlet(name = "ActionDisposerServlet")
public class ActionDisposerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out=response.getWriter();
        String url=request.getServletPath();
        int flag=0;
        Date date = new Date(System.currentTimeMillis());
        DateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addr = request.getRemoteAddr();
        String cur_name = (String)session.getAttribute("cur_name");
        String cur_pass = (String)session.getAttribute("cur_pass");
        User cur_user = new User();
        int ut = cur_user.identifyUser(cur_name,cur_pass);
        cur_user.close();
        //out.print(url);
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");
        out.print("<center><h3>Action Disposer Page</h3><hr/><br/>");

        if(url.equals("/login.action"))
        {
            flag=1;
            String l_name = request.getParameter("l_name");
            String l_pass = request.getParameter("l_pass");
            try {
                l_pass = Cryptography.toSHA256(l_pass);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //TODO: add identification of username and password from mysql.
            //according to the TYPE of user (user/administrator), switch to different pages.
            User loginuser = new User();

            if(loginuser.identifyUser(l_name,l_pass)!=-1 && loginuser.getBanFlag()==0)
            {
                loginuser.saveLoginHistory(2, loginuser.getUsername(), dformat.format(date), addr, "web client login.");
                session.setAttribute("cur_uid", loginuser.getUid());
                session.setAttribute("cur_name", loginuser.getUsername());
                session.setAttribute("cur_pass", loginuser.getPassword());
                response.sendRedirect("index.jsp");
            }
            loginuser.close();
            ut=0;
            out.println("Wrong user name or password.<br>");
            out.println("<a href='login.jsp'>RETURN</a><br>");
        }

        if(url.equals("/register.action"))
        {
            flag=1;

            String new_username=request.getParameter("new_username");
            String new_password=request.getParameter("new_password");
            String new_firstvisit=dformat.format(date);
            String new_rcode=request.getParameter("new_rcode");
            int res;
            try {
                new_password = Cryptography.toSHA256(new_password);
            } catch (Exception e) {
                e.printStackTrace();
            }
            RegCode rcode = new RegCode();
            if(rcode.getCodeCountById(new_rcode)>0) {
                User nu = new User();
                String[] values={null,new_username,new_password,new_rcode};
                res = nu.add(values);
                if(res==1) {
                    rcode.useCode();
                    nu.saveLoginHistory(1, new_username, new_firstvisit, addr, "new user registered.");
                    out.println("Registration successful!<br>");
                    out.println("<a href='login.jsp'>RETURN</a><br>");
                    ut=0;
                } else {
                    out.println("Registration failed!<br>");
                    out.println("<a href='register.jsp'>RETURN</a><br>");
                    ut=0;
                }
                nu.close();
            } else {
                out.println("Wrong registration code!<br>");
                out.println("<a href='register.jsp'>RETURN</a><br>");
                ut=0;
            }
            rcode.close();
        }

        // The following actions are required to sign in.
        if(ut==-1)
        {
            out.println("Sorry, it seems that you are not signed in.<br>");
            out.println("<a href='index.jsp'>Return</a>");
            out.println("<a href='login.jsp'>Sign in</a>");
        }

        if(url.equals("/register-personal.action"))
        {
            flag=1;

            if(cur_user.getActiveFlag()==0) {
                String new_first_name=request.getParameter("new_first_name");
                String new_last_name=request.getParameter("new_last_name");
                String new_title=request.getParameter("new_title");
                String new_tax_id=request.getParameter("new_tax_id");
                String new_email=request.getParameter("new_email");
                String new_phone=request.getParameter("new_phone");
                String new_address=request.getParameter("new_address");
                String new_birth=request.getParameter("new_birth");
                String new_gender=request.getParameter("new_gender");
                String new_bio=request.getParameter("new_bio");

                Person np = new Person();
                String[] values1 = {null,cur_name,new_tax_id,
                        new_title,new_last_name,new_first_name,
                        new_gender,new_birth,new_address,new_email,new_phone,new_bio};
                int resp = np.add(values1);
                if(resp==1) {
                    User cu = new User();
                    cu.identifyUser(cur_name,cur_pass);
                    cu.updateType(1);
                    cu.activeUser(true);
                    cu.saveLoginHistory(3,cur_name,dformat.format(date),addr,"personal information added.");
                    out.println("Personal information registered successful!<br>You can now create your first identity.<br>");
                    out.println("<a href='person.jsp'>RETURN</a><br>");
                    cu.close();
                } else {
                    out.println("Register failed, please check your input.<br>");
                    out.println("<a href='register-personal.jsp'>RETURN</a><br>");
                }
                np.close();
            } else {
                out.println("Register failed. Information already exists.<br>");
                out.println("<a href='person.jsp'>RETURN</a><br>");
            }
        }

        if(url.equals("/register-enterprise.action"))
        {
            flag=1;

            if(cur_user.getActiveFlag()==0) {
                String new_company_name=request.getParameter("new_company_name");
                String new_manager_name=request.getParameter("new_manager_name");
                String new_website=request.getParameter("new_website");
                String new_found_date=request.getParameter("new_found_date");
                String new_address=request.getParameter("new_address");
                String new_email=request.getParameter("new_email");
                String new_phone=request.getParameter("new_phone");
                String new_description=request.getParameter("new_description");

                Enterprise np = new Enterprise();
                String[] values1 = {null,cur_name,new_company_name,new_manager_name,
                        new_website,new_found_date,new_address,new_email,new_phone,new_description};
                np.setAll(null,cur_name,new_company_name,new_manager_name,
                        new_website,new_found_date,new_address,new_email,new_phone,new_description);
                int resp = np.add(values1);
                if(resp==1) {
                    User cu = new User();
                    cu.identifyUser(cur_name,cur_pass);
                    cu.updateType(2);
                    cu.activeUser(true);
                    cu.saveLoginHistory(3,cur_name,dformat.format(date),addr,"enterprise information added.");
                    Identity eid = new Identity();
                    eid.add(new String[]{null,cur_name,Identity.generateEnterpriseInfo(np),new_company_name,null,null,Byte.toString(Shadow.PUBLIC)});
                    eid.close();
                    out.println("Enterprise information registered successful!<br>");
                    out.println("<a href='enterprise.jsp'>RETURN</a><br>");
                    cu.close();
                } else {
                    out.println("Register failed, please check your input.<br>");
                    out.println("<a href='register-enterprise.jsp'>RETURN</a><br>");
                }
                np.close();
            } else {
                out.println("Register failed. Information already exists.<br>");
                out.println("<a href='enterprise.jsp'>RETURN</a><br>");
            }
        }

        if(url.equals("/register-identity.action"))
        {
            flag=1;

            if(cur_user.getActiveFlag()==1 && cur_user.getType()!=0) {
                String newid_purpose=request.getParameter("newid_purpose");
                byte sh_taxid=Byte.parseByte(request.getParameter("sh_taxid"));
                byte sh_firstname=Byte.parseByte(request.getParameter("sh_firstname"));
                byte sh_birth=Byte.parseByte(request.getParameter("sh_birth"));
                byte sh_address=Byte.parseByte(request.getParameter("sh_address"));
                byte sh_email=Byte.parseByte(request.getParameter("sh_email"));
                byte sh_phone=Byte.parseByte(request.getParameter("sh_phone"));
                byte sh_bio=Byte.parseByte(request.getParameter("sh_bio"));
                String verify_password=request.getParameter("verify_password");
                try {
                    verify_password = Cryptography.toSHA256(verify_password);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                byte newid_mask = (byte)(sh_taxid|sh_firstname|sh_birth|sh_address|sh_email|sh_phone|sh_bio);

                Person cp = new Person();
                boolean isPersonAvailable = cp.getElementById(cur_name);
                cp.close();

                Identity np = new Identity();
                String newid_hashcode = Identity.generateNewIdentity(cp,new Shadow(newid_mask),newid_purpose);
                String[] values1 = {null,cur_name,newid_hashcode,newid_purpose,null,null,Integer.toString(newid_mask)};

                if(np.add(values1)==1) {
                    User cu = new User();
                    if(cu.identifyUser(cur_name,verify_password)!=-1) {
                        cu.saveLoginHistory(4,cur_name,dformat.format(date),addr,"new identity created.");
                        out.println("New identity created successful!<br>");
                        out.println("<a href='identities.jsp'>RETURN</a><br>");
                    } else {
                        out.println("Failed to verify user password!<br>");
                        out.println("<a href='index.jsp'>RETURN</a><br>");
                    }
                    cu.close();
                } else {
                    out.println("Register failed, please check your input.<br>");
                    out.println("<a href='identity-add.jsp'>RETURN</a><br>");
                }
                np.close();
            } else {
                out.println("Current user is not activated.<br>Please register your personal info first.<br>");
                out.println("<a href='index.jsp'>RETURN</a><br>");
            }
        }

        if(flag==0)
        {
            out.println("Error, wrong operation!<br>");
            out.println("<a href='index.jsp'>RETURN</a><br>");
        }

        out.print("</center>");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out=response.getWriter();
        String url=request.getServletPath();
        int flag=0;
        Date date = new Date(System.currentTimeMillis());
        DateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addr = request.getRemoteAddr();
        String cur_uid = (String)session.getAttribute("cur_uid");
        String cur_name = (String)session.getAttribute("cur_name");
        String cur_pass = (String)session.getAttribute("cur_pass");
        User cur_user = new User();
        int ut = cur_user.identifyUser(cur_name,cur_pass);
        cur_user.close();
        //out.print(url);
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");
        out.print("<center><h3>Action Disposer Page</h3><hr/><br/>");

        if(url.equals("/verify-identity.action"))
        {
            flag=1;
            String hashcode = request.getParameter("iid");
            Identity tid = new Identity();
            if(tid.getElementById(hashcode)) {
                out.println(Verification.getIdentityPlainString(hashcode));
            } else {
                out.println("wrong operation!<br>");
            }
            tid.close();
        }

        // The following actions are required to sign in.
        if(ut==-1)
        {
            out.println("Sorry, it seems that you are not signed in.<br>");
            out.println("<a href='index.jsp'>Return</a>");
            out.println("<a href='login.jsp'>Sign in</a><br>");
        }

        if(url.equals("/logout.action"))
        {
            flag=1;
            session.invalidate();
            out.println("Log out successful!<br>");
            out.println("<a href='index.jsp'>RETURN</a><br>");
        }

        if(url.equals("/identity-del.action"))
        {
            flag=1;
            String hashcode = request.getParameter("iid");
            User cu = new User();
            if(cu.identifyUser(cur_name,cur_pass)!=1) {
                Identity tid = new Identity();
                if(tid.delete(hashcode)==1) {
                    cu.saveLoginHistory(5,cur_name,dformat.format(date),addr,"an identity revoked.");
                    out.println("Identity revoked!<br>");
                } else {
                    out.println("Operation failed!<br>");
                }
                tid.close();
            } else {
                out.println("Operation failed!<br>");
            }
            cu.close();
            out.println("<a href='identities.jsp'>RETURN</a><br>");
        }

        if(flag==0)
        {
            out.println("Error, wrong operation!<br>");
            out.println("<a href='index.jsp'>RETURN</a><br>");
        }

        out.print("</center>");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }
}
