<!--首页-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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

    function error(){
        alert("请登录");
    }
</script>
<body>
<!--顶部导航栏-->
<div id="line1">
    <jsp:include page="top.jsp"></jsp:include>
</div>
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

            </table>
        </div>
    </form>
</div> 

</body>
</html>
