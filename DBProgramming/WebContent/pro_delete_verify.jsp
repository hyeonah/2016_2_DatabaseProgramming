<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>

<html>
<head><title> ���� ���� </title></head>
<body>

<%   
   String p_id = (String)session.getValue("user"); 
   String c_id = request.getParameter("c_id");
   int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
%>

<jsp:useBean id="pro_EnrollMgr" class="enrollBean.Pro_EnrollMgr" scope="page" />
<%
pro_EnrollMgr.deleteEnroll(p_id,c_id,c_id_no);
%>
<script>   
   alert("���ǰ� �����Ǿ����ϴ�."); 
   location.href="pro_delete.jsp";
</script>
</form></body></html>