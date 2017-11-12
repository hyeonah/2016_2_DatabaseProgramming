<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*, java.util.*,enrollBean.*"  %>
<html>
<head> <title>수강신청 삭제</title> </head>
<body>
<%@ include file="top.jsp" %>			

<%	if (session_id==null) response.sendRedirect("login.jsp");  %>
<table width="75%" align="center" border>
<br>
<tr bgcolor="F5C29E"><th>과목분류</th><th>과목번호</th><th>분반</th><th>과목명</th><th>학점</th><th>수강신청</th></tr>
<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr"/>
<%	
	Vector visit = null;
if(request.getParameter("year") == null && request.getParameter("semester")==null)
{ 
	visit = enrollMgr.getEnrollList(session_id);
	int counter=visit.size();
	int totUnit=0;
	for(int i=0; i<visit.size();i++){
		Enroll en = (Enroll)visit.elementAt(i);
		totUnit += en.getCUnit();

%>

<tr>
<tr>
<td align="center"><%=en.getCType()%></td>
<td align="center"><%=en.getCId()%></td>
<td align="center"><%=en.getCIdNo()%></td>
<td align="center"><%=en.getCName()%></td>
<td align="center"><%=en.getCUnit()%></td>
<td align="center"><a href="delete_verify.jsp?c_id=<%= en.getCId()%>&c_id_no=<%= en.getCIdNo()%>">삭제</a></td>
<%
	}
}
%>
</tr>
</table>
</body>
</html>