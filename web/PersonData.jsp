<!--个人资料界面-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Bean.bbstopic"%>
<%@page import="java.util.*"%>
<%@ page import="Bean.User" %>
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

<!--个人资料修改界面-->
<!--先获取再修改-->
<form method="post" action="userUpDataServlet">
    <div class="line2">
        <div class="userdata-textarea-div">
        <%
            User user = (User)request.getAttribute("User");
        %>
        <center style="font-size:28px;">个人资料</center>
            <div class="userdata-pwdAlter">
            性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:<select name="USex" class="login-input1">
                <%
                    if(user.getUSex().equals("男")){
                %>
                <option value="男" selected="selected">男</option>
                <option value="女">女</option>
                <%
                    }else {
                %>
                <option value="男" >男</option>
                <option value="女" selected="selected">女</option>
                <%
                    }
                %>
            </select><br>
            电子邮箱:<input name="UEmail" class="login-input" type="text" value="<%=user.getUEmail()%>"/><br>
            生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日:<input name="UBirthday" class="login-input" type="text" value="<%=user.getUBirthday()%>"/>
                <div class="userdata-textarea" style="margin-top:1%">
                    备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：<textarea name="USatement"><%=user.getUSatement()%></textarea>
                    <input type="submit" value="修改"/>
                    <a href="UserData.jsp?name=<%=name%>"><input type="button" value="返回"/></a>
                    <%
                        session.setAttribute("name",name);
                    %>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
