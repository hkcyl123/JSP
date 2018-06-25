<%--
  Created by IntelliJ IDEA.
  User: hkc
  Date: 2017/12/27
  Time: 2:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        String name1 = (String) request.getParameter("name");
        String name2 = (String) request.getAttribute("name");
        String name = null;
        if(name1 == null){
            name = name2;
        }else {
            name = name1;
        }
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