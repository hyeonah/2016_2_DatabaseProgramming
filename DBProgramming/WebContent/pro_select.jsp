<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*, enrollBean.*"%>
<html>
<head>
<title>강의조회</title>

<body>

<%@ include file="pro_top.jsp" %>

<%
   if (session_id==null) response.sendRedirect("login.jsp");
%>

<table width="75%" align="center" border>
<tr bgcolor="F5C29E"><th>과목번호</th><th>분반</th><th>과목명</th><th>학점</th><th>강의요일</th><th>강의시간</th><th>강의실</th><th>수강인원</th></tr>
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
      <input type="text" name="year" value=<%= t_year %> size=4>년도     
      <input type="text" name="semester" value=<%= t_semester %> size=1>학기
      <INPUT TYPE="SUBMIT" NAME="Submit" VALUE="조회">        
    </td>
  </tr>
</table>
</FORM>

</body>
</html>