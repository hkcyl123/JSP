package Servlet;

import Bean.User;
import Dao.DBConnet;
import Dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import static Dao.DBConnet.getClose;

@WebServlet("/RegisterUserServlet")
public class RegisterUserServlet extends HttpServlet {
    DBConnet db=new DBConnet();
    UserDao userDao=new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Uname=request.getParameter("Uname");
        String password=request.getParameter("password");
        String UEmail=request.getParameter("UEmail");
        String UBirthday=request.getParameter("UBirthday");
        String USex=request.getParameter("USex");
        Connection con=null;
        try {
            User user=new User(Uname,password);
            user.setUEmail(UEmail);
            user.setUBirthday(UBirthday);
            user.setUSex(USex);
            con=db.getCon();
            int a=userDao.adduser(con, user);
            if(a==1){//判断注册成功
                request.getSession();
                request.getRequestDispatcher("Login.jsp").forward(request,response);//跳转回登录页面
            }
            getClose(con);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            PrintWriter out = response.getWriter();
            out.println("  <script type='text/javascript'> alert('用户名已存在');window.location.href = 'register.jsp';</script>");
            out.flush();
            out.close();//跳转回注册界面
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
