<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PW_FIND</title>
<style>

  tr, td{
    border: 0px solid none; 
}
    </style>


<script>

  function gologin() {
  var frm = document.pwfindscreen;
  frm.method = "post";
  frm.action = "./login.jsp";
  frm.submit();
 }

 function gohome() {
  var frm = document.pwfindscreen;
  frm.method = "post";
  frm.action = "./home.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 }
 
 function gojoin() {
  var frm = document.pwfindscreen;
  frm.method = "post";
  frm.action = "./join.jsp";
  frm.submit();
 }

 function goidfind(){
  var frm = document.pwfindscreen;
  frm.method = "post";
  frm.action = "./id_find.jsp";
  frm.submit();
 }
 
 function gopwfind(){
  var frm = document.pwfindscreen;
  frm.method = "post";
  frm.action = "./pw_find.jsp";
  frm.submit();
 }
 
 function logout(){
     var frm=document.pwfindscreen;
      frm.method="post";
   frm.action="./logoutCtl.jsp"; 
   frm.submit();   
 }

   function enter(){

  var frm=document.pwfindscreen;

  if(frm.id.value.length<4){
   alert("아이디를 올바르게 입력해주세요");
   return;
  }

  if(frm.phone1.value.length<1){
   alert("연락처를 올바르게 입력해주세요");
   return;
  }
  if(frm.phone2.value.length<1){
   alert("연락처를 올바르게 입력해주세요");
   return;
  }
  frm.method="post";
  frm.action="./pw_searchCtl.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
  }
   

 </script>


 </HEAD>

 <BODY>

 <form name="pwfindscreen">
  <%@ include file="./top.jsp" %>
  <font face="Yang Rounded">
  
<table width="1330px"  border="0"  height="430px" align="center"   >
   <tr>
    <td>
     <table width="800px" align="center"  border="0" style="color:black; background-color: #FFEBF0; font-size:16px; ">
    <tr>
    <td>
     <table width="750px" align="center" border=0; style="background-color:white; margin-top:3%" >
      <tr>
       <td align="center"><img src="./image/password&monitor.png" height="50px"></td>
       <td>비밀번호 찾기</td>
       <td><div id="sub-title"> |  회원정보에 등록한 정보로 인증.</td>
       <td style="width:300px"></td>
      </tr>
     </table>
    </td> 
    </tr>       
   <tr> 
    <td>
   <table width="600px"  height="300px" align="center" border="0"  style=" background-color:none; border:dotted 5px none;">
    <tr>
     <td>
      <table width="400px"  border="0" style="margin-top:3%">
       <tr>
        <td>&nbsp;&nbsp;<img src="./image/check.png" height="30px" >
        </td>
        <td><div id="middle-title">&nbsp;아이디와 핸드폰번호를 입력해주세요.</div>
        </td>
       </tr>
      </table>
     </td>
    </tr>

    <tr>
     <td>
      <table width="380px" align="center" border="0" style="font-size:19px">
       <tr>
        <td>아이디</td>
        <td><input type="text" name="id"></td>
       </tr>
       <tr>
        <td>휴대폰</td>
        <td><select name="phone">
        <option value ="010" selected="selected">010</option>
        <option value ="011">011</option>
        <option value ="017">017</option> 
        <option value ="019">019</option>
        </select> -
        <input type="text" name="phone1" style="width:70px"> -
        <input type="text" name="phone2" style="width:70px"></td>
       </tr>
      </table>
     </td>
    </tr>
   
    <tr>
     <td>
      <table width="150px"  align="center" border="0" style="margin-top:1%">
       <tr>
        <td><input type="button" name="enter2" value="  찾기  " align="center" style="cursor:pointer; border-color:black; background:white; color:black;" onClick="enter()" >
         <input type="button" name="cancle2" value="  취소  " align="center" style="cursor:pointer; border-color:black; background:white; color:black;" onclick="cancle()"></td>
       </tr>
      </table>
     </td>
    </tr>

  </table>
 </td>
</tr>
</table>
</td>
</table>

</font>
</form>

 </BODY>
</HTML> 


