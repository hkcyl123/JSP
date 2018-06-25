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

@WebServlet("/DeleteTopicServlet")
public class DeleteTopicServlet extends HttpServlet {
    DBConnet db=new DBConnet();
    TopicDao bbstopicdao=new TopicDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int TID=(int) request.getSession().getAttribute("TID");
        String name = (String)request.getSession().getAttribute("name");
        Connection con=null;
        try {
            bbstopic bt=new bbstopic();
            bt.setTID(TID);
            bt.setUName(name);
            con=db.getCon();
            int a=bbstopicdao.deletetopic(con, bt);
            if(a==1){//删帖成功后,跳转到主页面
                ArrayList<bbstopic> list = bbstopicdao.selectMyTopic(con,bt);
                request.setAttribute("name",name);
                request.setAttribute("list",list);
                request.getRequestDispatcher("MyTopic.jsp").forward(request, response);
            }else{//失败后跳转回原帖
                request.setAttribute("error", "无法删除");
                request.setAttribute("name",name);
                request.getRequestDispatcher("MyTopic.jsp").forward(request,response);
            }
            getClose(con);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
