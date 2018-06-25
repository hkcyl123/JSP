<!--添加新帖页面-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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
        if (form1.Topic.value == "") {
            alert("请输入主题！");
            form1.Topic.focus();
            return;
        }
        if (form1.TCountents.value == "") {
            alert("请输入主要内容！");
            form1.TCountents.focus();
            return;
        }
        form1.submit();
    }
</script>
<body>

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
<!--发帖板块-->
<!--form action什么都没写-->
<form name="form1" method="post" action="issueTopicServlet" onsubmit=" return check(this)">
    <div id="line2">
        <div class="post" style="margin-top:3%;">
            <div class="post-title">发表主题</div>
            <div class="post-hr"><hr></div>
            <!--选择发帖类型-->
            <div class="post-select">
                <select name="SID">
                    <option value = "1">C</option>
                    <option value = "2">JAVA</option>
                    <option value = "3">Web</option>
                    <option value = "4">Python</option>
                    <option value = "5">Android</option>
                </select>
            </div>
            <!--帖名-->
            <div class="post-title-textarea">
                <input name="Topic" type="text" placeholder="标题（50字以内）"/>
            </div>
            <div class="post-textarea">
                <!--帖的内容-->
                <textarea name="TCountents" placeholder="<正文>（1000字以内）"></textarea>
                <div class="post-submit">
                    <div class="post-submit-input">
                        <!--提交键 action什么都没写-->
                        <input name="Submit" type="button"  value="发表" onClick="mycheck()">
                    </div>
                </div>
            </div>

        </div>
    </div>
</form>



</body>
</html>
