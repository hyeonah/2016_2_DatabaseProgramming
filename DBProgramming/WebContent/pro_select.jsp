<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*, enrollBean.*"%>
<html>
<head>
<title>������ȸ</title>

<body>

<%@ include file="pro_top.jsp" %>

<%
   if (session_id==null) response.sendRedirect("login.jsp");
%>

<table width="75%" align="center" border>
<tr bgcolor="F5C29E"><th>�����ȣ</th><th>�й�</th><th>�����</th><th>����</th><th>���ǿ���</th><th>���ǽð�</th><th>���ǽ�</th><th>�����ο�</th></tr>
<BR>

<jsp:useBean id="pro_enrollMgr" class="enrollBean.Pro_EnrollMgr" />
<%
      
Vector vlist = null;
int t_year, t_semester;

if (request.getParameter("year") == null && request.getParameter("semester")==null)
{   
   t_year = pro_enrollMgr.getCurrentYear();
   t_semester = pro_enrollMgr.getCurrentSemester();  
}
else
{
   t_year = Integer.parseInt(request.getParameter("year"));
   t_semester = Integer.parseInt(request.getParameter("semester"));
}

vlist = pro_enrollMgr.getEnrollList(session_id,t_year,t_semester);

int counter = vlist.size();
int   totalUnit = 0;
for(int i=0; i<vlist.size(); i++){
   Enroll en = (Enroll)vlist.elementAt(i);
   totalUnit += en.getCUnit();
%>

<tr>
<td align="center"><%=en.getCId()%></td>
<td align="center"><%=en.getCIdNo()%></td>
<td align="center"><%=en.getCName()%></td>
<td align="center"><%=en.getCUnit()%></td>
<td align="center"><%=en.getTDate()%></td>
<td align="center"><%=en.getTTime()%></td>
<td align="center"><%=en.getTWhere()%></td>
<td align="center"><%=en.getTMax()%></td>

<%   
   }
%>
</tr>
</table>
<br>

<br>
<table width="30%" align="center">  
<FORM method="post" action="pro_select_verify.jsp" >
  <tr>
   <td align="center">
      <input type="text" name="year" value=<%= t_year %> size=4>�⵵     
      <input type="text" name="semester" value=<%= t_semester %> size=1>�б�
      <INPUT TYPE="SUBMIT" NAME="Submit" VALUE="��ȸ">        
    </td>
  </tr>
</table>
</FORM>

</body>
</html>