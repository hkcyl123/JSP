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

@WebServlet("/transformPersonDataServlet")
public class transformPersonDataServlet extends HttpServlet {
    DBConnet db=new DBConnet();
    UserDao UD=new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Connection con = null;
        try {
            User user = new User(name, "");
            con = db.getCon();
            user = UD.selectUserData(con, user);
            request.setAttribute("User", user);
            request.setAttribute("name", name);
            request.getRequestDispatcher("PersonData.jsp").forward(request, response);
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
