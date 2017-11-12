<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %> 
<html> 
<head><title> 교수 정보 수정 </title></head> 
<body> 
<% 
String p_id = new String(request.getParameter("p_id"));
String session_pwd = new String(request.getParameter("session_pwd"));
String p_pwd = new String(request.getParameter("p_pwd"));
String p_pwd1 = new String(request.getParameter("p_pwd1"));
String p_pwd2 = new String(request.getParameter("p_pwd2"));
String p_phonenumber = new String(request.getParameter("p_phonenumber"));
String p_email = new String(request.getParameter("p_email"));
Connection myConn = null; 
Statement stmt = null; 
String mySQL = ""; 
String dburl  = "jdbc:oracle:thin:@localhost:1521:orcl";
String user="db01"; 
String passwd="ss2"; 
String dbdriver = "oracle.jdbc.driver.OracleDriver";   
if(session_pwd.equals(p_pwd))
{
   if(p_pwd1.equals(p_pwd2))
   {
      try {
         Class.forName(dbdriver); 
         myConn = DriverManager.getConnection (dburl, user, passwd); 
         stmt = myConn.createStatement(); 
      } catch(SQLException ex) { 
         System.err.println("SQLException: " + ex.getMessage()); 
      }
      mySQL = "update professor "; 
      mySQL = mySQL + " set p_pwd ='" + p_pwd1 + "' , " ; 
      mySQL = mySQL + " p_email ='" + p_email + "' , " ; 
      mySQL = mySQL + " p_phonenumber ='" + p_phonenumber + "' where p_id='" + p_id + "'"; 
      try { 
         stmt.executeQuery(mySQL); 
%> 
<script> 
alert("교수 정보가 수정되었습니다."); 
location.href="pro_update.jsp"; 
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
location.href = "pro_update.jsp"; 
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
location.href = "pro_update.jsp"; 
</script> 
<%
   }
}
else {
%>
<script> 
alert("현재 비밀번호가 일치하지 않습니다.");
location.href = "pro_update.jsp"; 
</script> 
<%
}
%> 
</body></html> 