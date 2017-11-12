<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*, enrollBean.*"%>
<!DOCTYPE html>
<HTML>
<%@ include file="pro_top.jsp" %> 
<% if (session_id==null) response.sendRedirect("login.jsp"); %>
<head>
   <title>수강신청 시스템 로그인</title>
</head>
<BODY>

<table width="60%" align="center" bgcolor="F5C29E" border>
<br>
<tr><td><div align="center"> 강의 개설 </table>
<table width="60%" align="center" border>
<FORM method="post" action="pro_insert_verify.jsp">
   
<jsp:useBean id="pro_enrollMgr" class="enrollBean.Pro_EnrollMgr" />
<tr><td><div align="center">강의명</div></td>
   <td><div align="center">
   <select name="c_id" size="1">
<%
Vector vlist = pro_enrollMgr.getInsertList();
int counter = vlist.size();
for(int i=0; i<vlist.size(); i++){
   Enroll en = (Enroll)vlist.elementAt(i);
   String c_id = en.getCId();
   int c_unit = en.getCUnit();
   String c_name = en.getCName();
   String m_id = en.getMId();
   String c_type = en.getCType();
   
%>
<option value="<%=c_id%>"><%=c_name%></option>
 <%
 }
 %>
   </select>
   </div></td></tr>
   
   <tr><td><div align="center">분반번호</div></td>
   <td><div align="center">
   1분반<input type="checkbox" value="1" name="c_id_no" size="1" >
   2분반<input type="checkbox" value="2" name="c_id_no" size="1" >
   3분반<input type="checkbox" value="3" name="c_id_no" size="1" >
   </div>
   </td></tr>

   <tr>
   <td align="center">강의 요일</td>
   <td align="center">
     월요일<input type="checkbox" value="월" name="t_date" size="1" >
     화요일<input type="checkbox" value="화" name="t_date" size="1" >
     수요일<input type="checkbox" value="수" name="t_date" size="1" >
     목요일<input type="checkbox" value="목" name="t_date" size="1" >
     금요일<input type="checkbox" value="금" name="t_date" size="1" >
   </td>
   </tr>
   
   
   <tr><td><div align="center">강의 시간</div></td>
   <td><div align="center">
   <select name="t_time" size="1">
   <option value="1교시">1교시 9:00-10:15</option>
   <option value="2교시">2교시 10:30-11:45</option>
   <option value="3교시">3교시 12:00-13:15</option>
   <option value="4교시">4교시 13:30-14:45</option>
   <option value="5교시">5교시 15:00-16:15</option>
   <option value="6교시">6교시 16:30-17:45</option>
   <option value="7교시">7교시 18:00-19:15</option>
   <option value="8교시">8교시 19:30-20:45</option>
   </select>
   </div></td></tr>

   <tr><td><div align="center">강의실</div></td>
   <td><div align="center"><input type="text" name="t_where" size="60" maxlength="20"></div></td></tr>

   <tr><td><div align="center">수강인원</div></td>
   <td><div align="center"><input type="text" name="t_max" size="60" maxlength="5"></div></td></tr>
   
   <tr>
   <td colspan=3><div align="center">
   <input type="submit" value="개설등록">
   <input type="button" value="개설취소" onclick="location.href='pro_main.jsp'">
   <input type="reset" value="초기화">
   </div></td>
   </tr>
</table>
</FORM>
</BODY> </HTML>