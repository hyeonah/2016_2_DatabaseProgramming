<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>

<html><head><title>수강신청입력</title></head>
<body>
 
<%@ include file="top.jsp" %>
<% if (session_id==null) response.sendRedirect("login.jsp"); %>
<table width="75%" align="center" border>
<br>
<tr bgcolor="F5C29E"><th>과목분류</th><th>과목번호</th><th>분반</th><th>과목명</th><th>강의요일</th><th>강의시간</th><th>강의실</th><th>학점</th><th>수강신청</th></tr>
<%
Connection myConn= null; Statement stmt= null;
ResultSet myResultSet= null; String mySQL= "";
String dburl= "jdbc:oracle:thin:@localhost:1521:orcl";
String user="db01"; String passwd="ss2";
String dbdriver= "oracle.jdbc.driver.OracleDriver";
try {
Class.forName(dbdriver);
myConn= DriverManager.getConnection(dburl, user, passwd);
stmt= myConn.createStatement();
} catch(SQLException ex) {
System.err.println("SQLException: " + ex.getMessage());
}
mySQL= "select t.c_id cid, c.c_name cname, c.c_unit cunit, c.c_type ctype, t.p_id pid, t.c_id_no cidno, t.t_year tyear, t.t_semester tsemester, t.t_date tdate, t.t_time ttime, t.t_where twhere "
+"from course c, teach t where t.c_id = c.c_id and t.c_id not in"
+" (select c_id from enroll where s_id='" + session_id+ "')";
myResultSet= stmt.executeQuery(mySQL);
if (myResultSet!= null) {
 while (myResultSet.next()) {
  String c_id= myResultSet.getString("cid");
  String c_name= myResultSet.getString("cname");
  int c_unit= myResultSet.getInt("cunit");
  String c_type= myResultSet.getString("ctype");
  String p_id = myResultSet.getString("pid");
  int c_id_no= myResultSet.getInt("cidno");
  int t_year= myResultSet.getInt("tyear");
  int t_semester= myResultSet.getInt("tsemester");
  String t_date= myResultSet.getString("tdate");
  String t_time= myResultSet.getString("ttime");
  String t_where= myResultSet.getString("twhere");
%>
<tr>
<td align="center"><%= c_type%></td>
<td align="center"><%= c_id%></td>
<td align="center"><%= c_id_no%></td>
<td align="center"><%= c_name%></td>
<td align="center"><%= t_date%></td>
<td align="center"><%= t_time%></td>
<td align="center"><%= t_where%>
</td><td align="center"><%= c_unit%></td>
<td align="center"><a href="insert_verify.jsp?&c_id=<%= c_id%>&c_id_no=<%= c_id_no%>">신청</a></td>
</tr>
<%
 }
}
stmt.close(); myConn.close();
%>
 