<%@ page contentType="text/html; charset=EUC-KR" %>
<html><head>
<title>�����ͺ��̽��� Ȱ���� ������û �ý����Դϴ�.</title></head>
<body>
<%@ include file="top.jsp" %>
<%String name = null; %>
<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" />
<table width="30%" align="center" height="30%">
<% if (session_id!= null) { name = enrollMgr.getName(session_id);%>
<tr>
<td align="center">�� <%=name%>�� �湮�� ȯ���մϴ�. ��</td>
</tr>
<% 
} else { 
%>
<tr>
<td align="center">�α����� �� ����ϼ���.</td>
</tr>
<%
}
%>
</table>
</body>
</html>