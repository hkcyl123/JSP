<!--查看帖子主页 回复帖子-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="Bean.bbstopic"%>
<%@page import="java.util.*"%>
<%@ page import="Bean.bbsreply" %>
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

    <jsp:include page="top.jsp"></jsp:include>

<%
    bbstopic bt = (bbstopic)(request.getAttribute("bt"));
%>
<!--主贴Div--> 
<div class="line2">
	<div class="topic-main">
            <div class="topic-title">
                <%=bt.getTopic()%>
            </div>
        	<div class="topic-small-row">
                    	<div class="topic-small-row-left">
                        <span><%=bt.getUName()%></span>
                  		<span><%=bt.getTTime()%></span>
                            <%
                                session.setAttribute("TUname",bt.getUName());
                                session.setAttribute("TTime",bt.getTTime());
                                session.setAttribute("Topic",bt.getTopic());
                                session.setAttribute("ReplyCount",bt.getReplyCount());
                                session.setAttribute("TCountents",bt.getTCountents());
                            %>
                        <span style="margin-left:1%;margin-right:0%;"><img class="ico_eye" src="./image/eye_icon.png"></span>
                        <span style="margin:0%;"><%=bt.getReplyCount()%></span>
                        </div>
             </div>
             <div class="topic-hr"><hr></div> 
             <div class="topic-text">
             	<%=bt.getTCountents()%>
             </div> 
	</div>
</div>
<!--回贴Div-->
<div class="line3">
	<div class="reply">
		<div class="topic-title">
                最新回复
        </div>
		<div class="reply-hr"><hr></div>
        <!--动态生成回复 表格-->
        <div class="replytable">
            <table class="replygridtable">
                <%
                    ArrayList<bbsreply> list = (ArrayList<bbsreply>)(request.getAttribute("bbsreplylist"));
                    if(list==null||list.size()<1) {
                        out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何回复！</td></tr>");
                    } else {
                        for(int i = list.size() - 1 ; i >= 0; i--) {
                            bbsreply tip = list.get(i);
                %>
                <tr>
                    <td>
                        <div class="td-row">
                            <div class="reply-row-1">
                                <span><%=tip.getUName()%></span>
                                <span><%=tip.getRTime()%></span>
                            </div>
                            <div class="reply-row-2">
                                <div class="reply-row-2-1"><span><%=tip.getRContent()%>
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
</div>
<!--发回帖-->
<form action="issueReplyServlet" method="post">
<div class="line3">
    <div class="reply-post">
    	<div class="reply-post-author">
    	</div>
        <div class="reply-post-text">
            <input name="RContent" type="text" placeholder="内容"/>
        </div>
        <%
            if(request.getSession().getAttribute("name")!=null){
        %>
        <div class="reply-post-button">
            <input type="submit" value="发表"/>
        </div>
        <%
        }else {
        %>
        <div class="reply-post-button">
            <input type="button" onclick="error()" value="发表"/>
        </div>
        <%
            }
        %>
    </div>
</div>
</form>
</body>
</html>
