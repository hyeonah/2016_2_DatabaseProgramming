<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="crazyit.UserMgr" %>
<%@ page import="crazyit.UserDTO" %>
<%
    session.invalidate(); //세션자체를 없애줌
    response.sendRedirect("./home.jsp");
%>
<HTML>
<body>
</body>
</HTML>


    