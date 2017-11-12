<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*, enrollBean.*"%>
<html>
<head>
<title>졸업사정결과조회</title>
<body>
<%@ include file="top.jsp" %>
<%
 if (session_id==null) response.sendRedirect("login.jsp");
Enroll en = null;
Vector vlist = null;

int graduate = 0;
int year, semester;
int lackcredit=0;
String satisfygraduate = null;
String name = null;
%>

<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" />
<table width="75%" align="center">
<% if (session_id!= null) { name = enrollMgr.getName(session_id); %>
<% }
int counter = 0;
int totCounter = 0;
int totMajorUnit = 0;
int totCultureUnit = 0;
int totUnit = 0;
int t_year, t_semester;

%>
<th align="center"><%=name%>님의 졸업사정결과 입니다.</th>
<br>
<table width="75%" align="center" border bgcolor="F5C29E">
<br>
<th>전공</th>
<table width="75%" align="center" border>
<tr><th>수강신청년도</th><th>수강학기</th><th>과목번호</th><th>과목명</th><th>학점</th></tr>
<%
vlist = enrollMgr.getEnrollListmajor(session_id,"전공");
for(int i=0; i<vlist.size(); i++){
	 en = (Enroll)vlist.elementAt(i);
	 totMajorUnit += en.getCUnit();
	 totUnit += en.getCUnit();
	 counter++;
	 totCounter++;
%>
<tr>
<td align="center"><%=en.getTYear()%></td>
<td align="center"><%=en.getTSemester()%></td>
<td align="center"><%=en.getCId()%></td>
<td align="center"><%=en.getCName()%></td>
<td align="center"><%=en.getCUnit()%></td>
</tr>
<% 
}
%>
<table width="75%" align="center" border>
<tr><th>전공 총 신청과목수</th>
<td align="center"><%= counter %></td>
</tr>
<tr>
<th>전공 총 신청학점</th>
<td align="center"><%= totMajorUnit %></td>
</tr>
<%
counter=0;
%>
<table width="75%" align="center" border bgcolor="F5C29E">
<br>
<th>교양</th>
<table width="75%" align="center" border>
<tr><th>수강신청년도</th><th>수강학기</th><th>과목번호</th><th>과목명</th><th>학점</th></tr>
<%
vlist = enrollMgr.getEnrollListmajor(session_id,"교양");
for(int i=0; i<vlist.size(); i++){
	 en = (Enroll)vlist.elementAt(i);
	 totCultureUnit += en.getCUnit();
	 totUnit += en.getCUnit();
	 counter++;
	 totCounter++;
%>
<tr>
<td align="center"><%=en.getTYear()%></td>
<td align="center"><%=en.getTSemester()%></td>
<td align="center"><%=en.getCId()%></td>
<td align="center"><%=en.getCName()%></td>
<td align="center"><%=en.getCUnit()%></td>
</tr>
<% 
}
%>
<table width="75%" align="center" border>
<tr><th>교양 총 신청과목수</th>
<td align="center"><%= counter %></td>
</tr>
<tr>
<th>교양 총 신청학점</th>
<td align="center"><%= totCultureUnit %></td>
</tr>
<%
graduate = enrollMgr.getGraduateList(session_id);
lackcredit = graduate - totUnit;
if(lackcredit <= 0){
	satisfygraduate = "가능";
}else{
	satisfygraduate = "불가능";
}
%>
<table width="75%" align="center" border>
<br>
<tr><th>총신청과목수</th>
<td align="center"><%=totCounter  %></td>
<th>총신청학점</th>
<td align="center"><%=totUnit %></td>
<th>졸업부족학점</th>
<td align="center"><%= lackcredit %></td>
<th>졸업가능여부</th>
<td align="center"><%= satisfygraduate %></td>
</tr>
</table>
<br><br>
</body>
</html>