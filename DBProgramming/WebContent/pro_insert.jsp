<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*, enrollBean.*"%>
<!DOCTYPE html>
<HTML>
<%@ include file="pro_top.jsp" %> 
<% if (session_id==null) response.sendRedirect("login.jsp"); %>
<head>
   <title>������û �ý��� �α���</title>
</head>
<BODY>

<table width="60%" align="center" bgcolor="F5C29E" border>
<br>
<tr><td><div align="center"> ���� ���� </table>
<table width="60%" align="center" border>
<FORM method="post" action="pro_insert_verify.jsp">
   
<jsp:useBean id="pro_enrollMgr" class="enrollBean.Pro_EnrollMgr" />
<tr><td><div align="center">���Ǹ�</div></td>
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
   
   <tr><td><div align="center">�йݹ�ȣ</div></td>
   <td><div align="center">
   1�й�<input type="checkbox" value="1" name="c_id_no" size="1" >
   2�й�<input type="checkbox" value="2" name="c_id_no" size="1" >
   3�й�<input type="checkbox" value="3" name="c_id_no" size="1" >
   </div>
   </td></tr>

   <tr>
   <td align="center">���� ����</td>
   <td align="center">
     ������<input type="checkbox" value="��" name="t_date" size="1" >
     ȭ����<input type="checkbox" value="ȭ" name="t_date" size="1" >
     ������<input type="checkbox" value="��" name="t_date" size="1" >
     �����<input type="checkbox" value="��" name="t_date" size="1" >
     �ݿ���<input type="checkbox" value="��" name="t_date" size="1" >
   </td>
   </tr>
   
   
   <tr><td><div align="center">���� �ð�</div></td>
   <td><div align="center">
   <select name="t_time" size="1">
   <option value="1����">1���� 9:00-10:15</option>
   <option value="2����">2���� 10:30-11:45</option>
   <option value="3����">3���� 12:00-13:15</option>
   <option value="4����">4���� 13:30-14:45</option>
   <option value="5����">5���� 15:00-16:15</option>
   <option value="6����">6���� 16:30-17:45</option>
   <option value="7����">7���� 18:00-19:15</option>
   <option value="8����">8���� 19:30-20:45</option>
   </select>
   </div></td></tr>

   <tr><td><div align="center">���ǽ�</div></td>
   <td><div align="center"><input type="text" name="t_where" size="60" maxlength="20"></div></td></tr>

   <tr><td><div align="center">�����ο�</div></td>
   <td><div align="center"><input type="text" name="t_max" size="60" maxlength="5"></div></td></tr>
   
   <tr>
   <td colspan=3><div align="center">
   <input type="submit" value="�������">
   <input type="button" value="�������" onclick="location.href='pro_main.jsp'">
   <input type="reset" value="�ʱ�ȭ">
   </div></td>
   </tr>
</table>
</FORM>
</BODY> </HTML>