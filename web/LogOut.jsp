<%@ page language="java" pageEncoding="GBK"%>
<%
if( session.getAttribute("name") != null ) {
	session.removeAttribute("name");
}
response.sendRedirect("index.jsp");
%>