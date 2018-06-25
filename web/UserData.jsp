<!--用户管理界面-->
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
<script>
    alert(xinxi);
</script>
<body>
<!--顶部导航栏-->

<div id="headbgline">
    <div id="nav">
        <ul>
            <li>首页</li>
            <li><a class="topic-a" href="TopicSelectServlet?id=1&name=<%=name%>">C</a></li>
            <li><a class="topic-a" href="TopicSelectServlet?id=2&name=<%=name%>">JAVA</a></li>
            <li><a class="topic-a" href="TopicSelectServlet?id=3&name=<%=name%>">Web</a></li>
            <li><a class="topic-a" href="TopicSelectServlet?id=4&name=<%=name%>">Python</a></li>
            <li><a class="topic-a" href="TopicSelectServlet?id=5&name=<%=name%>">Android</a></li>
        </ul>
    </div>

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

 <!--用户管理界面-->
<div class="line2">
	<div class="userdata">
	
   	 	<div class="userdata-hello">您好，<%=name%>：<hr class="post-hr"></div>
        <div class="userdata-option">
            <ul>
            	<!--超链接-->
                <li><a class="topic-a" style="color:black;" href="transformPersonDataServlet?name=<%=name%>">个人资料</a></li>
                <li><a class="topic-a" style="color:black;" href="transformMyTopicServlet?name=<%=name%>">我的帖子</a></li>
           		<li><a class="topic-a" style="color:black;" href="PwdAlter.jsp?name=<%=name%>">修改密码</a></li>     
            </ul>
         </div>	
    </div>
</div>

</body>
</html>
