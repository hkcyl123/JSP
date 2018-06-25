package Servlet;

import Bean.bbstopic;
import Dao.DBConnet;
import Dao.TopicDao;
import Dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.SimpleTimeZone;

import static Dao.DBConnet.getClose;

@WebServlet("/issueTopicServlet")
public class issueTopicServlet extends HttpServlet {//发帖
    DBConnet db=new DBConnet();
    TopicDao bbstopicdao=new TopicDao();
    UserDao userDao = new UserDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String SID=request.getParameter("SID");
        String UName=(String)request.getSession().getAttribute("name");
        String ReplyCount="0";
        String Topic=request.getParameter("Topic");
        String TCountents=request.getParameter("TCountents");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String TTime=df.format(new Date());
        Connection con=null;
        try {
            bbstopic bt=new bbstopic();
            bt.setSID(Integer.parseInt(SID));
            bt.setUName(UName);
            con=db.getCon();
            int UID = userDao.returnUID(con,UName);
            bt.setUID(UID);
            bt.setReplyCount(ReplyCount);
            bt.setTopic(Topic);
            bt.setTCountents(TCountents);
            bt.setTTime(TTime);
            int a=bbstopicdao.addtopic(con, bt);
            if(a==1){//发帖成功后,跳转到主题帖页面
                request.setAttribute("bt", bt);
                request.setAttribute("name",UName);
                request.getRequestDispatcher("topic-main.jsp").forward(request, response);
            }else{//失败后跳转回发帖页面
                request.setAttribute("error", "发帖失败");
                request.getRequestDispatcher("Post.jsp").forward(request,response);
            }
            getClose(con);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
