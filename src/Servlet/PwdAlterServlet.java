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
import java.sql.Connection;

import static Dao.DBConnet.getClose;

@WebServlet("/PwdAlterServlet")
public class PwdAlterServlet extends HttpServlet {
    DBConnet db=new DBConnet();
    UserDao userDao=new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Uname=(String) request.getSession().getAttribute("name");
        String Password =request.getParameter("password");
        Connection con=null;
        try {
            User user=new User(Uname,Password);
            con=db.getCon();
            int a=userDao.updatapassword(con, user);
            if(a == 1){//判断时候登录成功
                request.setAttribute("xinxi","修改成功");
                request.setAttribute("name", Uname);
                request.getRequestDispatcher("UserData.jsp").forward(request, response);//跳转回登录界面并返回信息
            }else{
                request.setAttribute("xinxi","更新失败");
                request.getRequestDispatcher("PwdAlter.jsp").forward(request,response);//跳转回主界面
            }
            getClose(con);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
