package Servlet;

import Bean.bbsreply;
import Bean.bbstopic;
import Dao.DBConnet;
import Dao.TopicDao;
import Dao.bbsreplyDao;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static Dao.DBConnet.getClose;

@WebServlet("/transform")
public class transformServlet extends HttpServlet {
	DBConnet db=new DBConnet();
	bbsreplyDao bbsreply=new bbsreplyDao();
	TopicDao bbstopicdao=new TopicDao();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Uname=(String)request.getSession().getAttribute("name");
		String TID=request.getParameter("TID");
		String i = request.getParameter("i");
		Connection con=null;
		try {
			bbsreply bs=new bbsreply();
			bbstopic bt1=new bbstopic();
			bt1.setTID(Integer.parseInt(TID));
			bs.setTID(Integer.parseInt(TID));
			con=db.getCon();
			TopicDao topicDao = new TopicDao();
			topicDao.updatacount(con,Integer.parseInt(TID));
			bbstopic bt2 = bbstopicdao.selectopic(con,bt1);
			ArrayList<bbsreply> bbsreplylist=bbsreply.selectallbbsreply(con, bs);
			if(bbsreplylist != null){
				request.setAttribute("bbsreplylist", bbsreplylist);
				request.setAttribute("bt",bt2);
				request.setAttribute("name",Uname);
				request.getRequestDispatcher("topic-main.jsp").forward(request, response);
			}
			getClose(con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
