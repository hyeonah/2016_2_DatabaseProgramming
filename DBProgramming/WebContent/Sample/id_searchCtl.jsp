<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="crazyit.UserMgr"%>
<%
 request.setCharacterEncoding("UTF-8");
 String num = request.getParameter("num");
 String phone = request.getParameter("phone");
 String phone1 = request.getParameter("phone1");
 String phone2 = request.getParameter("phone2");

 phone = phone + phone1 + phone2;
 UserMgr um4 = new UserMgr();
 String id = um4.id_search(num, phone); //아이디를 디비에서 가져옴..실패시 널
%>
<HTML>
<HEAD>
<style>
tr {
 border: 0px solid none;
}

 

k:hover {
 text-decoration: none;
 color: #9354ED
}
</style>

<script>
 function gohome() {
  var frm = document.idsearch;
  frm.method = "post";
  frm.action = "./home.jsp";
  frm.submit();
 }
 function gojoin() {
  var frm = document.idsearch;
  frm.method = "post";
  frm.action = "./join.jsp";
  frm.submit();
 }

 function gologin() {
  var frm = document.idsearch;
  frm.method = "post";
  frm.action = "./login.jsp";
  frm.submit();
 }

 function goidfind() {
  var frm = document.idsearch;
  frm.method = "post";
  frm.action = "./id_find.jsp";
  frm.submit();
 }

 function gopwfind() {
  var frm = document.idsearch;
  frm.method = "post";
  frm.action = "./pw_find.jsp";
  frm.submit();
 }
</script>
</HEAD>

<body>
 <font face="Yang Rounded">
  <form name="idsearch" method="post">
   <%@ include file="./top.jsp"%>
   <table width="1330px" height="530px" align="center">
    <tr>
     <td>
      <%
       if (id != null) {
      %>
      <table width="550px" align=center border="0"
       style="color: black; font-size: 30px;">
       <tr align=center>
        <td style="height: 170px">* 회원님의 아이디를 찾았습니다! *</td>
       </tr>
       <tr align=center>
        <td style="font-size: 20px">회원님의 아이디는 <style= "color:blue;"><%=id%> 입니다.</td>
       </tr>
      </table> <%
  } else {
 %>
      <table width="550px" align=center border="0"
       style="color: black; font-size: 30px;">
       <tr align=center>
        <td style="height: 170px">* 아이디 찾기를 실패하셨습니다. *</td>
       </tr>
       <tr align=center>
        <td><input type="button" value="돌아가기"
         onClick="history.back()"></td>
       </tr>
      </table> <%
  }
 %> </font>
</form> </font>
</body>
</HTML>


    