<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN</title>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<style>
tr,td {
 border: 0px solid none;
}

#main-title {
 color: black;
 font-size: 65px;
 font-weight: bold;
}

#sub-title {
 color: black;
 font-size: 12pt;
}

#middle-title {
 color: black;
 font-size: 13pt;
 font-weight: bold;
}

k:hover {
 text-decoration: none;
 color: #FF1291
}
</style>

<script>

 function gologin() {
  var frm3 = document.loginscreen;
  frm3.method = "post";
  frm3.action = "login.jsp";
  frm3.submit();
 }

 function gohome() {
  var frm = document.loginscreen;
  frm.method = "post";
  frm.action = "./home.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면,정보를 보내겠다.
 }
 
 function gojoin() {
  var frm = document.loginscreen;
  frm.method = "post";
  frm.action = "./join.jsp";
  frm.submit();
 }

 function goidfind(){
  var frm = document.loginscreen;
  frm.method = "post";
  frm.action = "./id_find.jsp";
  frm.submit();
 }
 
 function gopwfind(){
  var frm = document.loginscreen;
  frm.method = "post";
  frm.action = "./pw_find.jsp";
  frm.submit();
 }
 
 function enter() {

  var frm = document.loginscreen;

  if (frm.id.value.length < 4) {
   alert("아이디를 올바르게 입력해주세요");
   return;
  }

  if (frm.pwd.value.length < 4) {
   alert("비밀번호를 올바르게 입력해주세요");
   return;
  }
  frm.method = "post";
  frm.action = "./loginCtl.jsp";
  frm.submit();
 }
 
 function logout() {
	  var frm = document.loginscreen;
	  frm.method = "post";
	  frm.action = "./logoutCtl.jsp";
	  alert("로그아웃되었습니다.");
	  frm.submit();
}
</script>

</HEAD>


<BODY>

 <form name="loginscreen">
  <%@ include file="./top.jsp"%>
  <font face="Yang Rounded">

   <table width="1330px" border="0" height="430px" align="center">
    <tr>
     <td>
      <table width="450px" align="center" border="0"
       style="color: black; background-color: #FFEBF0; font-size: 30px; margin-top: -3%">
       <tr>
        <td>
         <table width="750px" align="center" border=0
          style="background-color: white">
          <tr>
           <td align="center"><img src="./image/babyinmom.png"
            height="60px "></td>
           <td>LOGIN</td>
           <td><div id="sub-title">|  로그인이 필요합니다.</td>
           <td width="300px"></td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
      </td>
      </tr>
     
    <tr>
     <td>
      <table width="500px" height="250px" align=center " border="8"
       style="font-size: 15px; border-color: #F6F6F6; border-style: solid; margin-top: 2%">
       <tr style="border: 0">
        <td style="border: 0">
         <table width="300px" height="100px" align="center" border="0">
          <tr align="center">
           <td colspan="2" style="font-size:17px">* 아이디와 비밀번호를 입력해주세요</td>
          <tr align="center">
           <td><br>ID <input type="text" name="id"
            style="width: 150px"></td>
           <td rowspan="2"><br>
           <input type="button" name="login" value="로그인"
            onClick="enter()" style="width: 60px; height: 60px"></td>
          </tr>
          <tr align="center">
           <td>PW <input type="password" name="pwd"
            style="width: 150px"></td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>

  </font>
 </form>

</BODY>
</HTML>


