<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %> 
<html> 
<head><title> 수강신청 사용자 정보 수정 </title></head> 
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
alert("학생 정보가 수정되었습니다."); 
location.href="update.jsp"; 
</script> 
<% 
      } catch(SQLException ex) { 
         String sMessage; 
         if (ex.getErrorCode() == 20002)
            sMessage="암호는 4자리 이상이어야 합니다"; 
         else if (ex.getErrorCode() == 20003) 
            sMessage="암호에 공란은 입력되지 않습니다."; 
         else 
            sMessage="잠시 후 다시 시도하십시오"; 
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
alert("변경할 비밀번호가 일치하지 않습니다.");
location.href = "update.jsp"; 
</script> 
<%
   }
}
else {
%>
<script> 
alert("현재 비밀번호가 일치하지 않습니다.");
location.href = "update.jsp"; 
</script> 
<%
}
%> 
</body></html> 