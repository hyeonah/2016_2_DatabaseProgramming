<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>�л���Ϻ���</title>
</head>
<body>
<table>
<tr><th>name<th></tr>
<%
Connection myConn = null;
Statement stmt = null;
String mySQL = null;
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db01";
String passwd = "ss2";
String dbdriver = "oracle.jdbc.driver.OracleDriver";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();
%>
<%
String s_major = "��ǻ�Ͱ��к�";
mySQL = "select s_name from STUDENTS where s_major='" + s_major + "'";
ResultSet myResultSet = stmt.executeQuery(mySQL);
if(myResultSet != null){
while(myResultSet.next()){
String name = myResultSet.getString("s_name");
%>
<tr><td align="center"><%=name%></td></tr>
<%
}
}
%>
</table>
<%
stmt.close();
myConn.close();
%>
</body>
</html>