<!--添加新帖页面-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="Bean.bbstopic"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
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
<script type="text/javascript">
    function mycheck() {
        if (form2.Uname.value == "") {
            alert("请输入用户名！");
            form2.Uname.focus();
            return;
        }
        if (form2.password.value == "") {
            alert("请输入密码！");
            form2.password.focus();
            return;
        }
        form2.submit();
    }
    function error1(error) {
		alert(error)
    }
</script>
<body>
<!--顶部导航栏-->   
<div id="line1">
    <jsp:include page="top.jsp"></jsp:include>
</div>

<!--登录板块--> 
<!--form action什么都没写-->
<font ></font>
<form name="form2" action="LoginServlet" METHOD="post" onsubmit=" return check(this)">
<div class="line2">
	<div class="login">
		<div class="login-user">	
			用户名：<input name="Uname" class="login-input" type="text"/>
		</div>
        
        <div class="login-pwd">	
			密&nbsp;&nbsp;&nbsp;码：<input name="password" class="login-input" type="password"/>
		</div>
        <div class="login-post">
        	<div class="login-post-input">
        	<input type="button" value="登录" onClick="mycheck()"/>
            </div>
        </div>
        
        <div class="register">
        	<div class="register-input">
				<a class="topic-a" href="register.jsp"><input type="button" value="注册"/></a>
            </div>
        </div>
	</div>
    
</div>
</form>



</body>
</html>
