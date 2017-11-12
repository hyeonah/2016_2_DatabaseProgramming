<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %> 
<html> 
<head><title>수강신청 사용자 정보 수정</title></head> 
<body> 
<%@ include file="top.jsp" %> 
<% 
if (session_id==null) 
   response.sendRedirect("login.jsp"); 
Connection myConn = null; 
Statement stmt = null; 
ResultSet myResultSet = null; 
String mySQL = ""; 
String dburl  = "jdbc:oracle:thin:@localhost:1521:orcl";
String user="db01"; 
String passwd="ss2"; 
String dbdriver = "oracle.jdbc.driver.OracleDriver";   
try { 
   Class.forName(dbdriver);
   myConn = DriverManager.getConnection (dburl, user, passwd); 
   stmt = myConn.createStatement(); 
} catch(SQLException ex) {
   System.err.println("SQLException: " + ex.getMessage()); 
} 
mySQL = "select s_pwd, s_phonenumber, s_email from student where s_id='" + session_id + "'" ; 
myResultSet = stmt.executeQuery(mySQL); 
if (myResultSet.next()) { 
   String s_pwd = myResultSet.getString("s_pwd");
   String s_phonenumber = myResultSet.getString("s_phonenumber");
    String s_email = myResultSet.getString("s_email");
%> 
<form method="post" action="update_verify.jsp"> 
<input type="hidden" name="s_id" size="30" value="<%= session_id %>"> 
<input type="hidden" name="session_pwd" size="30" value="<%= s_pwd %>"> 
<table width="50%" align="center" bgcolor="FFE4E1" border> 
<tr><td><div align="center"> 사용자 정보 수정 </table>
<table width="50%" align="center" border>
<tr><th>현재 비밀번호</th> 
<td><input type="password" name="s_pwd" size="20"> 
</td></tr> 
<tr><th>비밀번호 변경</th> 
<td><input type="password" name="s_pwd1" size="20">
</td></tr> 
<tr><th>비밀번호 확인</th> 
<td><input type="password" name="s_pwd2" size="20">
</td></tr> 
<tr><th>전화번호</th> 
<td><input type="text" name="s_phonenumber" size="" value="<%= s_phonenumber %>"> 
</td></tr> 
<tr><th>e-mail</th> 
<td><input type="text" name="s_email" size="50" value="<%= s_email %>"> 
</td></tr> 
<% 
} 
stmt.close(); 
myConn.close();
%> 
<tr><td colspan="3" align="center">
<input type="submit" value="정보 수정">
<INPUT TYPE="RESET" VALUE="초기화"></td> </tr> 
</table></form></body></html> 