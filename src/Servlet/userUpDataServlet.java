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

@WebServlet("/userUpDataServlet")
public class userUpDataServlet extends HttpServlet {
    DBConnet db=new DBConnet();
    UserDao userDao=new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Uname=(String) request.getSession().getAttribute("name");
        String USex = request.getParameter("USex");
        String UEmail = request.getParameter("UEmail");
        String UBirthday = request.getParameter("UBirthday");
        String USatement = request.getParameter("USatement");
        Connection con=null;
        try {
            User user=new User(Uname,"");
            user.setUSex(USex);
            user.setUSatement(USatement);
            user.setUEmail(UEmail);
            user.setUBirthday(UBirthday);
            con=db.getCon();
            int a=userDao.updatauser(con, user);
            if(a == 1){//判断时候登录成功
                request.setAttribute("xinxi","更新成功");
                request.setAttribute("name", Uname);
                request.getRequestDispatcher("UserData.jsp").forward(request, response);//跳转回登录界面并返回信息
            }else{
                request.setAttribute("xinxi","更新失败");
                request.getRequestDispatcher("PersonData.jsp").forward(request,response);//跳转回主界面
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
