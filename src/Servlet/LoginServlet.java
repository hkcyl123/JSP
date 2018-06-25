package Servlet;

import java.io.*;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.User;
import Dao.DBConnet;
import Dao.UserDao;

import static Dao.DBConnet.getClose;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{//登录，失败跳转回登录界面，成功后跳转会主页面
    DBConnet db=new DBConnet();
    UserDao userDao=new UserDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Uname=request.getParameter("Uname");
        String password=request.getParameter("password");
        Connection con=null;
        try {
            User user=new User(Uname,password);
            con=db.getCon();
            User currentUser=userDao.login(con, user);
            if(currentUser==null){//判断是否登录成功
                PrintWriter out = response.getWriter();
                out.println("  <script type='text/javascript'> alert('用户名或者密码错误');window.location.href = 'Login.jsp';</script>");
                out.flush();
                out.close();
            }else{
                request.setAttribute("name",currentUser.getUname());
                request.getRequestDispatcher("index.jsp").forward(request,response);//跳转回主界面
            }
            getClose(con);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
