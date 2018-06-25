package Servlet;

import Bean.bbstopic;
import Dao.DBConnet;
import Dao.TopicDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import static Dao.DBConnet.getClose;

@WebServlet("/transformMyTopicServlet")
public class transformMyTopicServlet extends HttpServlet {
    DBConnet db=new DBConnet();
    TopicDao td=new TopicDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Connection con=null;
        try {
            bbstopic bbstopic=new bbstopic();
            con=db.getCon();
            bbstopic.setUName(name);
            ArrayList<bbstopic> list= td.selectMyTopic(con, bbstopic);
            if(list != null){//判断是否有帖
                request.setAttribute("list",list);
                request.setAttribute("name",name);
                request.getRequestDispatcher("MyTopic.jsp").forward(request, response);//跳转回用户帖界面并返回信息
            }else{
                request.setAttribute("error", "没有帖子");
                request.getRequestDispatcher("Mytopic.jsp").forward(request,response);
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
