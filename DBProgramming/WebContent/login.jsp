<%@ page contentType="text/html; charset=EUC-KR" %>
<HTML>
<head>
<title>������û �ý��� �α���</title>
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
<tr><td><div align="center"> �α���</table>
<table width="50%" align="center" border>

<tr><td><div align="center">�ź�</div></td>
<td><div align="center">
<input type="radio" name="whoo" value="prof">����
<input type="radio" name="whoo" value="stud" checked>�л�</div></td>
</tr>
<tr><td><div align="center">���̵�</div></td>
<td><div align="center"><input type="text" name="userID"></div></td>
</tr>
<tr><td><div align="center">�н�����</div></td>
<td><div align="center"><input type="password" name="userPassword">
</div></td>
</tr>
<tr>
<td colspan=3><div align="center">
<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="�α���">
<INPUT TYPE="RESET" VALUE="���">
</div></td>
</tr>
</FORM>
</table></form></BODY></HTML>