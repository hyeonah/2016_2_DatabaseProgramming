<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %> 
<html> 
<head><title> ������û ����� ���� ���� </title></head> 
<body> 
<% 
String s_id = new String(request.getParameter("s_id"));
String session_pwd = new String(request.getParameter("session_pwd"));
String s_pwd = new String(request.getParameter("s_pwd"));
String s_pwd1 = new String(request.getParameter("s_pwd1"));
String s_pwd2 = new String(request.getParameter("s_pwd2"));
String s_phonenumber = new String(request.getParameter("s_phonenumber"));
String s_email = new String(request.getParameter("s_email"));
Connection myConn = null; 
Statement stmt = null; 
String mySQL = ""; 
String dburl  = "jdbc:oracle:thin:@localhost:1521:orcl";
String user="db01"; 
String passwd="ss2"; 
String dbdriver = "oracle.jdbc.driver.OracleDriver";   
if(session_pwd.equals(s_pwd))
{
   if(s_pwd1.equals(s_pwd2))
   {
      try {
         Class.forName(dbdriver); 
         myConn = DriverManager.getConnection (dburl, user, passwd); 
         stmt = myConn.createStatement(); 
      } catch(SQLException ex) { 
         System.err.println("SQLException: " + ex.getMessage()); 
      }
      mySQL = "update student "; 
      mySQL = mySQL + " set s_pwd ='" + s_pwd1 + "' , " ; 
      mySQL = mySQL + " s_email ='" + s_email + "' , " ; 
      mySQL = mySQL + " s_phonenumber ='" + s_phonenumber + "' where s_id='" + s_id + "'"; 
      try { 
         stmt.executeQuery(mySQL); 
%> 
<script> 
alert("�л� ������ �����Ǿ����ϴ�."); 
location.href="update.jsp"; 
</script> 
<% 
      } catch(SQLException ex) { 
         String sMessage; 
         if (ex.getErrorCode() == 20002)
            sMessage="��ȣ�� 4�ڸ� �̻��̾�� �մϴ�"; 
         else if (ex.getErrorCode() == 20003) 
            sMessage="��ȣ�� ������ �Էµ��� �ʽ��ϴ�."; 
         else 
            sMessage="��� �� �ٽ� �õ��Ͻʽÿ�"; 
%> 
<script> 
alert("<%= sMessage %>");
location.href = "update.jsp"; 
</script> 
<%
      }
      finally { 
         if (stmt != null)
            try {
               stmt.close(); myConn.close(); 
            }
         catch(SQLException ex) { }
      }
   }
   else {
%>
<script> 
alert("������ ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
location.href = "update.jsp"; 
</script> 
<%
   }
}
else {
%>
<script> 
alert("���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
location.href = "update.jsp"; 
</script> 
<%
}
%> 
</body></html> 