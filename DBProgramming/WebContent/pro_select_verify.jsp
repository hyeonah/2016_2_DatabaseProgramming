<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>

<html>
<head><title> ���� ��ȸ </title></head>
<body>

<%   
   String year = request.getParameter("year");
   String semester = request.getParameter("semester");

   String url = "pro_select.jsp?year="+ year + "&semester=" + semester;

   response.sendRedirect(url);
%>
</body></html>