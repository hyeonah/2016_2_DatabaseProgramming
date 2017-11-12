<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, enrollBean.*"%>
<% request.setCharacterEncoding("euc_kr"); %>

<jsp:useBean id="pro_EnrollMgr" class="enrollBean.Pro_EnrollMgr" />
<%
Vector vlist = null;
int t_year, t_semester;

if (request.getParameter("year") == null && request.getParameter("semester")==null)
{   
   t_year = pro_EnrollMgr.getCurrentYear();
   t_semester = pro_EnrollMgr.getCurrentSemester();  
}
else
{
   t_year = Integer.parseInt(request.getParameter("year"));
   t_semester = Integer.parseInt(request.getParameter("semester"));
}
%>

<%
String p_id = (String)session.getAttribute("user"); 
int c_id_no  = Integer.parseInt(request.getParameter("c_id_no")); 
String c_id = request.getParameter("c_id");
String[] t_date  = request.getParameterValues("t_date");
String t_d = "";
String t_time = request.getParameter("t_time");
String t_where = request.getParameter("t_where");
int t_max = Integer.parseInt(request.getParameter("t_max"));
System.out.println(c_id);

Connection myConn = null;
Statement stmt = null;
String mySQL = null;
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db01";
String passwd = "ss2";
String dbdriver = "oracle.jdbc.driver.OracleDriver";

Class.forName(dbdriver);
myConn = DriverManager.getConnection (dburl, user, passwd);

stmt = myConn.createStatement();

for(int i = 0 ; i < t_date.length ; i++){
    t_d += t_date[i];
}

mySQL= "INSERT INTO teach VALUES('"+p_id+"','"+c_id+"','"+c_id_no+"','"+t_year+"','"+t_semester+"','"+t_time+"','"+t_d+"','"+t_where+"','"+t_max+"')";
stmt.executeUpdate(mySQL);

stmt.close();
myConn.close();
%>
<script>
alert("강의가 개설되었습니다.");
location.href="pro_main.jsp";
</script>