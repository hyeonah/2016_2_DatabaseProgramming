<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*, enrollBean.*"%>
<html>
<head>
<title>���� ����</title>

<body>

<%@ include file="pro_top.jsp" %>

<%
   if (session_id==null) response.sendRedirect("login.jsp");
%>

<table width="75%" align="center" border>
<tr bgcolor="F5C29E"><th>�����ȣ</th><th>�й�</th><th>�����</th><th>����</th><th>��������</th></tr>
<BR>

<jsp:useBean id="pro_enrollMgr" class="enrollBean.Pro_EnrollMgr" />
<%
Vector vlist = pro_enrollMgr.getEnrollList(session_id);
int counter = vlist.size();
for(int i=0; i<vlist.size(); i++){
   Enroll en = (Enroll)vlist.elementAt(i);
%>
<tr>
<td align="center"><%=en.getCId()%></td>
<td align="center"><%=en.getCIdNo()%></td>
<td align="center"><%=en.getCName()%></td>
<td align="center"><%=en.getCUnit()%></td>
<td align="center">
<a href="pro_delete_verify.jsp?c_id=<%= en.getCId() %>&c_id_no=<%= en.getCIdNo() %>">����</a></td>  

<%
   }
%>
</tr>
</table>
</body>
</html>