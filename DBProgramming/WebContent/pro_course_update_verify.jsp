<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page import="java.sql.*" %> 
<html> 
<head><title> 개설 강의 수정 </title></head> 
<body> 
<% 
String c_id = new String(request.getParameter("c_id"));
String c_id_no = new String(request.getParameter("c_id_no"));
String c_name = new String(request.getParameter("c_name"));
String c_date = new String(request.getParameter("c_date"));
String c_time = new String(request.getParameter("c_time"));
String c_where = new String(request.getParameter("c_where"));
String c_max = new String(request.getParameter("c_max"));
Connection myConn = null; 
Statement stmt = null; 
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
      mySQL = "update course "; 
      mySQL = mySQL + " c_id ='" + c_id + "'  where c.c_id=p.c_id from course c professor p'" + c_id + "'"; 
      mySQL = mySQL + " c_id_no ='" + c_id_no + "'  where c.c_id_no=p.c_id_no from course c professor p'" + c_id_no + "'"; 
      mySQL = mySQL + " c_name ='" + c_name + "'  where c.c_id=p.c_id from course c professor p'" + c_id + "'"; 
      mySQL = mySQL + " c_date ='" + c_date + "'  where c.c_id=p.c_id from course c professor p'" + c_id + "'"; 
      mySQL = mySQL + " c_time ='" + c_time + "'  where c.c_id=p.c_id from course c professor p'" + c_id + "'"; 
      mySQL = mySQL + " c_where ='" + c_where + "'  where c.c_id=p.c_id from course c professor p'" + c_id + "'"; 
      mySQL = mySQL + " c_max ='" + c_max + "'  where c.c_id=p.c_id from course c professor p'" + c_id + "'"; 
      try { 
         stmt.executeQuery(mySQL); 
%> 
<script> 
alert("개설 강의 정보가 수정되었습니다."); 
location.href="pro_course_update.jsp"; 
</script> 
<% 
      } catch(SQLException ex) { 
         String sMessage = "잠시 후 다시 시도하십시오."; 
%> 
<script> 
alert("<%= sMessage %>");
location.href = "pro_course_update.jsp"; 
</script> 
<%
      }
      finally { 
         while (stmt != null)
            try {
               stmt.close(); myConn.close(); 
            }
         catch(SQLException ex) { }
      }
%>

</body></html> 