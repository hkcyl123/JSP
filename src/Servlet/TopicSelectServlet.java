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
@WebServlet("/TopicSelectServlet")
public class TopicSelectServlet extends HttpServlet {
    DBConnet db=new DBConnet();
    TopicDao td=new TopicDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String SID = request.getParameter("id");
        String name = (String) request.getSession().getAttribute("name");
        String Topic = request.getParameter("select");
        try {
            Connection con=null;
            con=db.getCon();
            ArrayList<bbstopic> list = null;
            if(Topic != null){
                list= td.selectTopic(con, Topic);
            }else{
                bbstopic bbstopic=new bbstopic();
                bbstopic.setSID(Integer.parseInt(SID));
                list= td.selectall(con, bbstopic);
            }
            if(list != null){//判断是否有帖
                request.setAttribute("list",list);
                request.setAttribute("name",name);
                request.getRequestDispatcher("FindInfo.jsp").forward(request, response);//跳转回主界面并返回信息
            }else{
                request.setAttribute("name",name);
                request.getRequestDispatcher("index.jsp");//跳转回主界面
            }
            getClose(con);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
