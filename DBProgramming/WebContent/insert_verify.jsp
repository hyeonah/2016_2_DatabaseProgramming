<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html><head><title> ������û�Է�</title></head>
<body>
<%
String s_id= (String)session.getAttribute("user");
String c_id= request.getParameter("c_id");
int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
%>
<%
Connection myConn= null; 
String result = null;
String dburl= "jdbc:oracle:thin:@localhost:1521:orcl";
String user="db01"; String passwd="ss2";
String dbdriver= "oracle.jdbc.driver.OracleDriver";
try {
Class.forName(dbdriver);
myConn= DriverManager.getConnection(dburl, user, passwd);
} catch(SQLException ex) {
System.err.println("SQLException: " + ex.getMessage());
}
CallableStatement cstmt= myConn.prepareCall("{call InsertEnroll(?,?,?,?)}");
cstmt.setString(1, s_id);
cstmt.setString(2, c_id);
cstmt.setInt(3,c_id_no);
cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
try {
cstmt.execute();
result = cstmt.getString(4);
%>
<script>
alert("<%= result %>");
location.href="insert.jsp";
</script>
<%
} catch(SQLException ex) {
System.err.println("SQLException: " + ex.getMessage());
}
finally {
if (cstmt!= null)
try { myConn.commit(); cstmt.close(); myConn.close(); }
catch(SQLException ex) {
 System.err.println("SQLException: " + ex.getMessage());}
}
%>
</form></body></html>

 