<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*, enrollBean.*"%>
<html>
<head>
<title>������û ��ȸ</title>
<body>
<%@ include file="top.jsp" %>
<%
 if (session_id==null) response.sendRedirect("login.jsp");
%>
<table width="75%" align="center" border >
<tr bgcolor="F5C29E"><th>����з�</th><th>�����ȣ</th><th>�й�</th><th>�����</th><th>���ǿ���</th><th>���ǽð�</th><th>���ǽ�</th><th>����</th></tr>
<BR>
<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" />
<%
Enroll en = null;
Vector vlist = null;
int year, semester;
if (request.getParameter("year") == null && request.getParameter("semester")==null)
{ 
 year = enrollMgr.getCurrentYear();
 semester = enrollMgr.getCurrentSemester();  
}
else
{
 year = Integer.parseInt(request.getParameter("year"));
 System.out.println(year);
 semester = Integer.parseInt(request.getParameter("semester"));
}
vlist = enrollMgr.getEnrollList(session_id,year,semester);
int counter = vlist.size();
System.out.println(counter);
int totUnit = 0;
for(int i=0; i<vlist.size(); i++){
 en = (Enroll)vlist.elementAt(i);
 totUnit += en.getCUnit();

%>
<tr>
<td align="center"><%=en.getCType()%></td>
<td align="center"><%=en.getCId()%></td>
<td align="center"><%=en.getCIdNo()%></td>
<td align="center"><%=en.getCName()%></td>
<td align="center"><%=en.getTDate()%></td>
<td align="center"><%=en.getTTime()%></td>
<td align="center"><%=en.getTWhere()%></td>
<td align="center"><%=en.getCUnit()%></td>

<% 
   }
%>
</tr>
</table>
<br>
<table width="75%" align="center" border>
<tr><th>�ѽ�û�����</th>
<td align="center"><%= counter %></td>
</tr>
<tr>
<th>�ѽ�û����</th>
<td align="center"><%= totUnit %></td>
</tr>
</table>
<br><br>
<table width="30%" align="center">  
<FORM method="post" action="select_verify.jsp" >
  <tr>
   <td align="center">
      <input type="text" name="year" value=<%= year %> size=4>�⵵   
      <input type="text" name="semester" value=<%= semester %> size=1>�б�
      <INPUT TYPE="SUBMIT" NAME="Submit" VALUE="��ȸ">        
    </td>
  </tr>
</table>
</FORM>
</body>
</html>