<!--我的帖子界面-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Bean.bbstopic"%>
<%@page import="java.util.*"%>
<%
    String name1 = (String) request.getParameter("name");
    String name2 = (String) request.getAttribute("name");
    String name = null;
    if(name1 == null){
        name = name2;
    }else {
        name = name1;
    }
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
<!--顶部导航栏-->

<div id="headbgline">
    <div id="nav">
        <ul>
            <li>首页</li>
            <li><a class="topic-a" href="TopicSelectServlet?id=1">C</a></li>
            <li><a class="topic-a" href="TopicSelectServlet?id=2">JAVA</a></li>
            <li><a class="topic-a" href="TopicSelectServlet?id=3">Web</a></li>
            <li><a class="topic-a" href="TopicSelectServlet?id=4">Python</a></li>
            <li><a class="topic-a" href="TopicSelectServlet?id=5">Android</a></li>
        </ul>
    </div>
    <!--新增搜索栏-->
    <form method="post" action="TopicSelectServlet">
        <!--新增搜索栏-->
        <div class="search">
            <input type="text" name="select" placeholder="搜索条件">
            <div class="searchButton"><input style="width:50px; height:25px;" type="submit"  value="查询"></div>
        </div>
    </form>


<%
           
            if (name != null){
            	request.setAttribute("name",name);
        %>
    <div id="nav-login">
        <ul>
            <li><a class="topic-a" href="UserData.jsp?name=<%=name%>"><%=name%></a></li>
            <li><a class="topic-a" href="LogOut.jsp">注销</a></li>
        </ul>
    </div>
        <%
            }
            else{
        %>
    <div id="nav-login">
        <ul>
            <li><a class="topic-a" href="Login.jsp">登录</a></li>
            <li><a class="topic-a" href="register.jsp">注册</a></li>
        </ul>
    </div>
  
<%
    }
%>


<!--我的发帖界面-->
<div id="line3">
	
    <!--表格-->
    <div id="table" style="margin-top:3%;">
    <!--返回和打印-->
    <a href="UserData.jsp?name=<%=name%>"><input type="button" value="返回"/></a>
        <a href="#" style="color:black;" class="topic-a" onClick="window.print()">打印</a>

        <table class="gridtable">
            <%
                List<bbstopic> list=(List<bbstopic>)request.getAttribute("list");
                if(list==null||list.size()<1){
                    out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何帖子信息！</td></tr>");
                }else{
                    for(bbstopic tip:list){
                        session.setAttribute("TID",tip.getTID());
                        session.setAttribute("name",name);
            %>
            <tr>
             <td>
            	<div class="td-row">
                	<div class="title-row">
                        <%=tip.getTopic()%>
                    </div>
                	<div class="small-row">
                    	<div class="small-row-left">
                        <span><%=tip.getUName()%></span>
                  		<span><%=tip.getTTime()%></span>
                        </div>
                        <div class="small-row-right">
                    	<span><img class="ico_eye" src="./image/eye_icon.png"></span>
                        <span><%=tip.getReplyCount()%></span>
                          <!--删除键-->
                           <span>
                           <a style="color:red;" class="topic-a" href="DeleteTopicServlet">删除</a>
                           </span>
                        </div>
                    </div>
                </div>
                </td>
            </tr>
            <%
                    }
                }
            %>
    	</table>
    		
    			
 	</div>
</div> 
</body>
</html>
