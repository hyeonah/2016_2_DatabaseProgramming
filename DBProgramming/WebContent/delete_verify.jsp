<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*, java.util.*,enrollBean.*"  %>
<html>
<head><title> ������û �Է� </title></head>
<body>
<%	String s_id = (String)session.getAttribute("user");
	String c_id = request.getParameter("c_id");
	int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
%>
<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" scope="page"/>
<%		
	enrollMgr.deleteEnroll(s_id, c_id, c_id_no);
%>
<script>	
		alert("<%= "�����Ǿ����ϴ�." %>");
		location.href="delete.jsp";	
</script>
</form></body></html>
