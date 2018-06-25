<!--添加新帖页面-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<%@page import="java.util.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="./css/style.css">

<script type="text/javascript">
	function mycheck() {
		if (form1.Uname.value == "") {
			alert("请输入用户名！");
			form1.Uname.focus();
			return;
		}
		if (form1.password.value == "") {
			alert("请输入密码！");
			form1.password.focus();
			return;
		}
		if (form1.UEmail.value == "") {
			alert("请输入邮箱！");
			form1.UEmail.focus();
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

</head>
<body>
<!--顶部导航栏-->   
<div id="line1">
	<jsp:include page="top.jsp"></jsp:include>
</div>
<!--登录板块--> 
<!--form action什么都没写-->

<form name="form1" action="RegisterUserServlet" method="post" onsubmit=" return check(this)" >
<div class="line2">
	<div class="login1">
		<div class="login-user1">
			&nbsp;用&nbsp;户&nbsp;名&nbsp;：<input name="Uname" class="login-input" type="text"/>
		</div>
		
		<div class="login-user2">	
			&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;：<input name="password" class="login-input" type="password"/>
		</div>
        
        <div class="login-pwd1">	
			确认密码：<input name="password1" class="login-input" type="password"/>
		</div>
		
		<div class="login-pwd2">
			电子邮件：<input name="UEmail" class="login-input" type="text" pattern="\d{3,9}" title="sfsfa"/>
		</div>
		
        <div class="login-pwd1">	
			&nbsp;生&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;：<input name="UBirthday" class="login-input" type="DATE"/>
		</div>
		
		<div class="login-pwd3">
			&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;别&nbsp; ：<select name="USex" class="login-input1">
			<option value ="男">男</option>
			<option value ="女">女</option>
		</select>
		</div>
        
        <div class="login-post1">
        	<div class="login-post-input1">
				<input name="Submit" type="button"  value="确   认" onClick="mycheck()">
            </div>
        </div>
	</div>
</div>
</form>



</body>
</html>
