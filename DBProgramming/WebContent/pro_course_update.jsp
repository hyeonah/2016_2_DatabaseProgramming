<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %> 
<html> 
<head><title>������û ����� ���� ����</title></head> 
<body> 
<%@ include file="pro_top.jsp" %> 
<%
   if (session_id==null) response.sendRedirect("login.jsp");
%>
<%   
   String p_id = (String)session.getValue("user"); 
   String c_id = request.getParameter("c_id");
   int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
%>

<table width="60%" align="center" bgcolor="#f08080" border>
<br>
<tr><td><div align="center"> ���� ���� </table>
<table width="60%" align="center" border>
<FORM method="post" action="pro_course_update_verify.jsp">
<jsp:useBean id="pro_enrollMgr" class="enrollBean.Pro_EnrollMgr" />
<%
if (session_id==null) 
	   response.sendRedirect("login.jsp"); 

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
	Vector vlist = pro_enrollMgr.getEnrollList(session_id,t_year,t_semester);

int counter = vlist.size();
int   totalUnit = 0;
for(int i=0; i<vlist.size(); i++){
   Enroll en = (Enroll)vlist.elementAt(i);
   totalUnit += en.getCUnit();

   String c_name = en.geCDate();
   String c_time = en.getCTime();
   String c_where = en.getCWhere();
   int c_max = en.getCMax();

   
%> 
<tr><th>�����ȣ</th> 
<td><input type="text" name="c_id" size="" value="<%= c_id %>"> 
</td></tr> 
<tr><th>�й�</th> 
<td><div align="center">
   1�й�<input type="checkbox" value="1" name="c_id_no" size="1" >
   2�й�<input type="checkbox" value="2" name="c_id_no" size="1" >
   3�й�<input type="checkbox" value="3" name="c_id_no" size="1" >
   </div>
</td></tr> 
<tr><th>���Ǹ�</th> 
<td><input type="text" name="c_name" size="" value="<%= c_name %>">
</td></tr> 
<tr><th>���ǿ���</th> 
<td align="center">
     ������<input type="checkbox" value="������" name="c_date" size="1" >
     ȭ����<input type="checkbox" value="ȭ����" name="c_date" size="1" >
     ������<input type="checkbox" value="������" name="c_date" size="1" >
     �����<input type="checkbox" value="�����" name="c_date" size="1" >
     �ݿ���<input type="checkbox" value="�ݿ���" name="c_date" size="1" >
     �����<input type="checkbox" value="�����" name="c_date" size="1" >
     �Ͽ���<input type="checkbox" value="�Ͽ���" name="c_date" size="1" >    
   </td>
   </tr> 
<tr><th>���ǽð�</th> 
<td><div align="center">
   <select name="c_time" size="1">
   <option value="1����">1���� 9:00-10:15</option>
   <option value="2����">2���� 10:30-11:45</option>
   <option value="3����">3���� 12:00-13:15</option>
   <option value="4����">4���� 13:30-14:45</option>
   <option value="5����">5���� 15:00-16:15</option>
   <option value="6����">6���� 16:30-17:45</option>
   <option value="7����">7���� 18:00-19:15</option>
   <option value="8����">8���� 19:30-20:45</option>
   <option value="9����">9���� 21:00-22:15</option>
   </select>
   </div>
</td></tr> 
<tr><th>���ǽ�</th> 
<td><input type="text" name="c_where" size="" value="<%= c_where %>"> 
</td></tr> 
<tr><th>�����ο�</th> 
<td><input type="text" name="c_max" size="" value="<%= c_max %>"> 
</td></tr> 
<%
}%>
<tr><td colspan="2" align="center"><input type="submit" value="���� ����"></td> </tr> 
</table></form></body></html> 