<%@ page contentType="text/html; charset=EUC-KR" %>
<HTML>
<head>
<title>수강신청 시스템 로그인</title>
<style>
.dropdown>ul>li {
 display: inline-block;
 position: relative;
}

.dropdown>ul>li>ul {
 position: absolute;
 list-style-type: none;
 padding-left: 0px;
 padding-top: 5px;
 display: none;
}

.dropdown>ul>li:hover>ul {
 display: block;
}

w:hover {
 text-decoration: none;
 color: red
}
</style>
</head>
<body>
<%@ include file="top.jsp" %>
<FORM method="post" action="login_verify.jsp">
<table width="50%" align="center" bgcolor="#FFEBF0" border>
<tr><td><div align="center"> 로그인</table>
<table width="50%" align="center" border>

<tr><td><div align="center">신분</div></td>
<td><div align="center">
<input type="radio" name="whoo" value="prof">교수
<input type="radio" name="whoo" value="stud" checked>학생</div></td>
</tr>
<tr><td><div align="center">아이디</div></td>
<td><div align="center"><input type="text" name="userID"></div></td>
</tr>
<tr><td><div align="center">패스워드</div></td>
<td><div align="center"><input type="password" name="userPassword">
</div></td>
</tr>
<tr>
<td colspan=3><div align="center">
<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="로그인">
<INPUT TYPE="RESET" VALUE="취소">
</div></td>
</tr>
</FORM>
</table></form></BODY></HTML>