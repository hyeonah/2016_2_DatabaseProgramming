<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head><title> 수강신청 조회 </title></head>
<body>
<% 
 String year = request.getParameter("year");
 String semester = request.getParameter("semester");
 String url = "select.jsp?year="+ year + "&semester=" + semester;
 response.sendRedirect(url);
%>
</body></html>