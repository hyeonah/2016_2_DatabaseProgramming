<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ include file="top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>시간표</title>
<style>

table {
   width: 100%;
   margin-left: auto;
   margin-right: auto;
}
#date{width: 800px;}
.margin-top {margin-top: 20px; }
.text-align-center { text-align: center; }

button { width: 75%; height: 25px; }

div{
   border: 1px solid;
}
.schedule {
   position: relative; 
   width: 800px; 
   height: 900px;
   margin-left: auto;
   margin-right: auto;
}

.time{
   width:25px;
   height:110px;
}
.course{
   width: 155px;
   position: absolute;
}
</style>
</head>
<body>

<%!
public int getDateValue(String str){
   if(str.equals("월"))
      return 0;
   else if(str.equals("화"))
      return 1;
   else if(str.equals("수"))
      return 2;
   else if(str.equals("목"))
      return 3;
   else if(str.equals("금"))
      return 4;
   else return -1;
}

public int getTimeValue(String str){
   if(str.equals("1교시"))
      return 0;
   else if(str.equals("2교시"))
      return 1;
   else if(str.equals("3교시"))
      return 2;
   else if(str.equals("4교시"))
      return 3;
   else if(str.equals("5교시"))
      return 4;
   else if(str.equals("6교시"))
      return 5;
   else if(str.equals("7교시"))
      return 6;
   else if(str.equals("8교시"))
      return 7;
   else return -1;
}
%>
<% 
//String yearStr = request.getParameter("year");
//String semesterStr = request.getParameter("semester");
if (session_id==null) 
   response.sendRedirect("login.jsp"); 
int year = 2016;
int semester = 2;

int totalEnrolledClass = 0;
int totalEnrolledUnit = 0;

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
mySQL = "select c_id, c_id_no from enroll where s_id = '" + session_id + "' and t_year = '" + year + "' and t_semester = '" + semester + "'";
ResultSet rs = stmt.executeQuery(mySQL);
%>
<table border= "1" id="date" class="text-align-center, margin-top" bgcolor="F5C29E">
   <tr><td width="20px"></td><td><center>월</center></td><td><center>화</center></td><td><center>수</center></td><td><center>목</center></td><td><center>금</center></td></tr>
</table>
<div class="schedule" background-color="FAE4D5">
<%
   int y = 0;
   for(int i=1; i<=8; i++){
%>
   <div class="time" style="top:<%=y%>; left:0;"><%=i%></div>
<%
      y += 110;
   }
   while(rs.next()){
      String c_id = rs.getString("c_id");
      int c_id_no = rs.getInt("c_id_no");
      
      Statement stmt2 = myConn.createStatement();
      String mySQL2 = "select c.c_unit cunit, c.c_name cname, t.p_id tpid, t.t_time ttime, t.t_date tdate, t.t_where twhere from enroll e, course c, teach t where e.c_id=c.c_id and c.c_id = '" + c_id + "'and t.c_id= '" + c_id + "'  and t.c_id_no = '" + c_id_no + "'";
      ResultSet rs2 = stmt2.executeQuery(mySQL2);
      rs2.next();
      int c_unit = rs2.getInt("cunit");
      String c_name = rs2.getString("cname");
      String p_id = rs2.getString("tpid");
      String t_time = rs2.getString("ttime");
      String t_date = rs2.getString("tdate");
      String t_where = rs2.getString("twhere");
      
      mySQL2 = "select p_name from professor where p_id='" + p_id + "'";
      rs2 = stmt2.executeQuery(mySQL2);
      rs2.next();   
      String p_name = rs2.getString("p_name");
   
      totalEnrolledClass += 1;
      totalEnrolledUnit += c_unit;
      
      int height = getTimeValue(t_time);
      
      int len = t_date.length();
      for(int i=0; i<len; i++){
         int datePos = 25 + 155*getDateValue(t_date.substring(i, i+1));
%>
   <div class="course" style="top:<%=height*110%>px; left:<%=datePos%>px; height:<%=110%>px">
      <font size='3'><b><%=c_name%></br><%=p_name%></br><%=t_where%></b></font>
   </div>
<%
      }
   }
%> 
</div>

<table bgcolor = "F7C8C8">
   <tr><td width= "65%"></td><td>총 수강 과목: <%= totalEnrolledClass %></td><td>총 수강 학점: <%= totalEnrolledUnit %></td></tr>
</table>

</body>
</html>