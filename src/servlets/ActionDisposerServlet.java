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
import javabeans.Person;
import javabeans.RegCode;
import javabeans.User;

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
            out.println("<a href='login.jsp'>RETURN</a>");
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
            if(rcode.getCodeCountById(new_rcode)>0)
            {
                User nu = new User();
                String[] values={null,new_username,new_password,new_rcode};
                res = nu.add(values);
                if(res==1) {
                    rcode.useCode();
                    nu.saveLoginHistory(1, new_username, new_firstvisit, addr, "new user registered.");
                    out.println("Registration successful!<br>");
                    out.println("<a href='login.jsp'>RETURN</a>");
                    ut=0;
                } else {
                    out.println("Registration failed!<br>");
                    out.println("<a href='register.jsp'>RETURN</a>");
                    ut=0;
                }
                nu.close();
            }
            else
            {
                out.println("Wrong registration code!<br>");
                out.println("<a href='register.jsp'>RETURN</a>");
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
            String[] values1 = {cur_name,new_tax_id,
                    new_title,new_last_name,new_first_name,
                    new_gender,new_birth,new_address,new_email,new_phone,new_bio};
            int resp = np.add(values1);
            if(resp==1) {
                User cu = new User();
                cu.identifyUser(cur_name,cur_pass);
                cu.updateType(1);
                cu.activeUser(true);
                out.println("Personal information registered successful!<br>You can now create your first identity.<br>");
                out.println("<a href='login.jsp'>RETURN</a>");
//                ut = 0;
                cu.close();
            } else {
                out.println("Register failed, please check your input.<br>");
                out.println("<a href='register.jsp'>RETURN</a>");
//                ut = 0;
            }
            np.close();
        }

        if(flag==0)
        {
            out.println("Error, wrong operation!<br>");
            out.println("<a href='index.jsp'>RETURN</a>");
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

        // The following actions are required to sign in.
        if(ut==-1)
        {
            out.println("Sorry, it seems that you are not signed in.<br>");
            out.println("<a href='index.jsp'>Return</a>");
            out.println("<a href='login.jsp'>Sign in</a>");
        }

        if(url.equals("/logout.action"))
        {
            flag=1;
            session.invalidate();
            out.println("Log out successful!<br>");
            out.println("<a href='index.jsp'>RETURN</a>");
        }

        if(flag==0)
        {
            out.println("Error, wrong operation!<br>");
            out.println("<a href='index.jsp'>RETURN</a>");
        }

        out.print("</center>");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }
}
