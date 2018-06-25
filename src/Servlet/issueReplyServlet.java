package Servlet;

import Bean.User;
import Bean.bbsreply;
import Bean.bbstopic;
import Dao.DBConnet;
import Dao.TopicDao;
import Dao.UserDao;
import Dao.bbsreplyDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import static Dao.DBConnet.getClose;

@WebServlet("/issueReplyServlet")
public class issueReplyServlet extends HttpServlet {//回帖
    DBConnet db=new DBConnet();
    bbsreplyDao bbsreply=new bbsreplyDao();
    TopicDao bbstopicdao=new TopicDao();
    UserDao userDao = new UserDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String RUname=(String) request.getSession().getAttribute("name");
        String Topic=(String) request.getSession().getAttribute("Topic");
        String ReplyCount=(String) request.getSession().getAttribute("ReplyCount");
        String TCountents=(String) request.getSession().getAttribute("TCountents");
        String RContent=request.getParameter("RContent");
        String TUname = (String) request.getSession().getAttribute("TUname");
        String TTime=(String) request.getSession().getAttribute("TTime");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String RTime=df.format(new Date());
        Connection con=null;
        try {
            bbsreply bs=new bbsreply();
            bbstopic bt=new bbstopic();
            User user = new User(RUname,"");
            bt.setUName(TUname);
            bt.setTTime(TTime);
            bt.setReplyCount(ReplyCount);
            bt.setTopic(Topic);
            bt.setTCountents(TCountents);
            con=db.getCon();
            int TID = bbstopicdao.returnTID(con,bt);
            bs.setTID(TID);
            bs.setUName(RUname);
            int UID = userDao.selectname(con,user);
            bs.setUID(UID);
            bs.setRContent(RContent);
            bs.setRTime(RTime);
            int a =  bbsreply.addbbsreply(con,bs);
            if(a !=0){
            ArrayList<bbsreply> bbsreplylist=bbsreply.selectallbbsreply(con, bs);
                if(bbsreplylist != null){
                    request.setAttribute("name",RUname);
                    request.setAttribute("bbsreplylist", bbsreplylist);
                    request.setAttribute("bt",bt);
                    request.getRequestDispatcher("topic-main.jsp").forward(request, response);
                }
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
