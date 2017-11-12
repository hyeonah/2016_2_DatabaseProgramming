<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %> 
<html> 
<head><title>수강신청 교수사용자 정보 수정</title></head> 
<body> 
<%@ include file="pro_top.jsp" %> 
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
mySQL = "select p_pwd, p_phonenumber, p_email from professor where p_id='" + session_id + "'" ; 
myResultSet = stmt.executeQuery(mySQL); 
if (myResultSet.next()) { 
   String p_pwd = myResultSet.getString("p_pwd");
   String p_phonenumber = myResultSet.getString("p_phonenumber");
    String p_email = myResultSet.getString("p_email");
%> 

<form method="post" action="pro_update_verify.jsp"> 
<input type="hidden" name="p_id" size="30" value="<%= session_id %>"> 
<input type="hidden" name="session_pwd" size="30" value="<%= p_pwd %>"> 
<table width="50%" align="center" bgcolor="FFE4E1" border> 
<tr><td><div align="center"> 사용자 정보 수정 </table>
<table width="50%" align="center" border>
<tr><th>현재 비밀번호</th> 
<td><input type="password" name="p_pwd" size="20"> 
</td></tr> 
<tr><th>비밀번호 변경</th> 
<td><input type="password" name="p_pwd1" size="20">
</td></tr> 
<tr><th>비밀번호 확인</th> 
<td><input type="password" name="p_pwd2" size="20">
</td></tr> 
<tr><th>전화번호</th> 
<td><input type="text" name="p_phonenumber" size="" value="<%= p_phonenumber %>"> 
</td></tr> 
<tr><th>e-mail</th> 
<td><input type="text" name="p_email" size="50" value="<%= p_email %>"> 
</td></tr> 
<% 
} 
stmt.close(); 
myConn.close();
%> 
<tr><td colspan="2" align="center"><input type="submit" value="수정"></td> </tr> 
</table></form></body></html> 