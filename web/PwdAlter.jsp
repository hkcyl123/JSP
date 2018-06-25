<!--修改密码界面-->
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
<script type="text/javascript">
    function mycheck() {
        if (form1.password.value == "") {
            alert("请输入密码！");
            form1.password.focus();
            return;
        }
        if (form1.password.value != form1.password1.value) {
            alert("两次输入密码不一致！");
            form1.password1.focus();
            return;
        }
        form1.submit();
    }
</script>
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
            <li><a class="topic-a" href="LogOut">注销</a></li>
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


<!--修改密码界面-->
<form name="form1" method="post" action="PwdAlterServlet" onsubmit=" return check(this)">
<div class="line2">
	<div class="userdata">
	 
    <center style="font-size:28px;">修改密码</center>
    			<!--jsp：确认两次密码一致-->
   	 	<div class="userdata-pwdAlter">
        请输入新密码:<input name="password" class="login-input" type="password"/><br>
        再次输入密码:<input name="password1" class="login-input" type="password"/>
            <input name="Submit" type="button"  value="确   认" onClick="mycheck()">
         <a href="UserData.jsp?name=<%=name%>"><input type="button" value="返回"/></a>
        </div>
        
    </div>
</div>

</form>
</body>
</html>
