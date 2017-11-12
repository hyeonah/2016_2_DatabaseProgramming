<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %> 
<html> 
<head><title>수강신청 사용자 정보 수정</title></head> 
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
<tr><td><div align="center"> 강의 수정 </table>
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
<tr><th>과목번호</th> 
<td><input type="text" name="c_id" size="" value="<%= c_id %>"> 
</td></tr> 
<tr><th>분반</th> 
<td><div align="center">
   1분반<input type="checkbox" value="1" name="c_id_no" size="1" >
   2분반<input type="checkbox" value="2" name="c_id_no" size="1" >
   3분반<input type="checkbox" value="3" name="c_id_no" size="1" >
   </div>
</td></tr> 
<tr><th>강의명</th> 
<td><input type="text" name="c_name" size="" value="<%= c_name %>">
</td></tr> 
<tr><th>강의요일</th> 
<td align="center">
     월요일<input type="checkbox" value="월요일" name="c_date" size="1" >
     화요일<input type="checkbox" value="화요일" name="c_date" size="1" >
     수요일<input type="checkbox" value="수요일" name="c_date" size="1" >
     목요일<input type="checkbox" value="목요일" name="c_date" size="1" >
     금요일<input type="checkbox" value="금요일" name="c_date" size="1" >
     토요일<input type="checkbox" value="토요일" name="c_date" size="1" >
     일요일<input type="checkbox" value="일요일" name="c_date" size="1" >    
   </td>
   </tr> 
<tr><th>강의시간</th> 
<td><div align="center">
   <select name="c_time" size="1">
   <option value="1교시">1교시 9:00-10:15</option>
   <option value="2교시">2교시 10:30-11:45</option>
   <option value="3교시">3교시 12:00-13:15</option>
   <option value="4교시">4교시 13:30-14:45</option>
   <option value="5교시">5교시 15:00-16:15</option>
   <option value="6교시">6교시 16:30-17:45</option>
   <option value="7교시">7교시 18:00-19:15</option>
   <option value="8교시">8교시 19:30-20:45</option>
   <option value="9교시">9교시 21:00-22:15</option>
   </select>
   </div>
</td></tr> 
<tr><th>강의실</th> 
<td><input type="text" name="c_where" size="" value="<%= c_where %>"> 
</td></tr> 
<tr><th>수강인원</th> 
<td><input type="text" name="c_max" size="" value="<%= c_max %>"> 
</td></tr> 
<%
}%>
<tr><td colspan="2" align="center"><input type="submit" value="강의 수정"></td> </tr> 
</table></form></body></html> 