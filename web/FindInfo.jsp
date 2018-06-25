<!--结果返回后的新页面 通过超链接切换跳转-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
  function test(){
//实现页面的跳转
	  window.location.href = 'transform?TID='+document.getElementById("TID").value;
  }
  function error(){
      alert("请登录");
  }
 </script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
<!--顶部导航栏-->
<div id="line1">
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
		<form>
			<div class="search">
				<input type="text" name="select" placeholder="搜索条件">
				<div class="searchButton"><input style="width:50px; height:25px;" type="submit"  value="查询"></div>
			</div>
		</form>

		<%
			if (name != null){
				session.setAttribute("name",name);
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
</div>
 <!--右侧发布新帖-->
<div id="line2">
	<%
		if(name!=null){
	%>
	<div id="publish">
		<a class="topic-a" href="Post.jsp?name=<%=name%>">发表新帖</a>
	</div>
	<%
		}else {
	%>
	<div id="publish">
		<a onclick="error()">发表新帖</a>
	</div>
	<%
		}
	%>
</div>
<div id="line3">
	  <!--右侧公告栏-->
	<div id="notice">
		
	<h2>公告栏</h2>
    	<div style="text-align:left;">
	您已经对代码进行了修改<br>
    如果要编辑选定对象的属性,请点击刷新或按F5
		</div>
	</div>
    <!--表格-->
    <form>
		<div id="table">
			<table class="gridtable">
				<%
					List<bbstopic> list=(List<bbstopic>)request.getAttribute("list");
					if(list==null||list.size()<1){
					    out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何帖子信息！</td></tr>");
					}else{
						for(int i = list.size() - 1 ; i >= 0; i--) {
							bbstopic tip = list.get(i);
				%>
				<tr onclick="test()">
					<td>
						<div class="td-row">
							<div id="Topic" class="title-row">
								<%=tip.getTopic()%>
							</div>
							<input type="hidden" id="TID" value="<%=tip.getTID()%>">
							<div class="small-row">
								<div class="small-row-left">
									<span id="Uname"><%=tip.getUName()%></span>
									<span id="TTime"><%=tip.getTTime()%></span>
								</div>
								<div class="small-row-right">
									<span><img class="ico_eye" src="./image/eye_icon.png"></span>
									<span id="ReplyCount"><%=tip.getReplyCount()%></span>
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
	</form>
</div> 

</body>
</html>
