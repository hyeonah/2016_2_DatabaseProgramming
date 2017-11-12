<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID_FIND</title>
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
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./home.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 }

 function gojoin() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./join.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 }

 function gologin() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./login.jsp";
  frm.submit();
 }

 function goidfind() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./id_find.jsp";
  frm.submit();
 }

 function gopwfind() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./pw_find.jsp";
  frm.submit();
 }
 function logout() {
  var frm = document.idfindscreen;
  frm.method = "post";
  frm.action = "./logoutCtl.jsp";
  alert("로그아웃되었습니다.");
  frm.submit();
 }
 function id_search1() { //이름,핸드폰으로 '찾기' 버튼

  var frm = document.idfindscreen;

  if (frm.num.value.length < 1) {
   alert("임산부카드번호를 입력해주세요");
   return;
  }

  if (frm.phone1.value.length<2 || frm.phone1.value.length>4) {
   alert("핸드폰번호를 정확하게 입력해주세요");
   return;
  }
  if (frm.phone2.value.length<2 || frm.phone2.value.length>4) {
   alert("핸드폰번호를 정확하게 입력해주세요");
   return;
  }

  frm.method = "post";
  frm.action = "./id_searchCtl.jsp"; //넘어간화면
  frm.submit();  }


 function id_search2() { //이름,이메일로 '찾기' 버튼

  var frm = document.idfindscreen;

  if (frm.num2.value.length < 1) {
   alert("임산부카드번호를 입력해주세요");
   return;
  }
  if (frm.email.value.length < 1 || frm.e_domain.value.length < 1) {
   alert("이메일을 입력해주세요");
   return;
  }

  frm.method = "post";
  frm.action = "./id_searchCtl2.jsp"; //넘어간화면
  frm.submit();  }

 function checkid() {

  var frm = document.idfindscreen;

  var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';

  if (!regExp.test(frm.email.value)) {

   alert('올바른 email을 입력해주세요.');

   frm.email.focus();

  }

 }

 function domainCheck() {

  var frm = document.idfindscreen;

  if (frm.domain.value == 0) {
   frm.e_domain.value = "";
   frm.e_domain.disabled = false;

  } else {
   frm.e_domain.value = frm.domain.value;
   frm.e_domain.disabled = true;

  }

 }
</script>
</HEAD>

<BODY>
 <form name="idfindscreen">
  <%@ include file="./top.jsp"%>
  <font face="Yang Rounded">


   <table width="1330px" height="430px" align="center">
    <tr>
     <td>
      <table width="600px" align="center" border="0"
       style="color: black; background-color: #FFEBF0; font-size: 16px;">
       <tr>
        <td>
         <table width="750px" align="center" border=0;
          style="background-color: white; margin-top: 3%">
          <tr>
           <td align="center"><img src="./image/key.png"
            height="50px"></td>
           <td>아이디 찾기</td>
           <td><div id="sub-title">| 회원정보에 등록한 정보로 인증.</td>
           <td width="300px"></td>
          </tr>
         </table>
        </td>
       </tr>

       <tr>
        <td>
         <table width="800px" height="300px" align="center"
          style="border: dotted 5px none; margin-top: 4%">

          <tr>
           <td>
            <table width="300px" height="30px" border="0"
             style="margin-top: 3%; color: black; font-size: 18px;">
             <tr>
              <td>&nbsp;&nbsp; <img src="./image/check.png"
               height="30px">
              </td>
              <td style="font-size :15px";>&nbsp;임산부카드번호, 핸드폰번호로 찾기</td>
             </tr>
            </table>
           </td>
          </tr>

          <tr>
           <td>
            <table width="380px" height="70px" align="center" border="0"
             style="font-size: 16px;">
             <tr>
              <td style="font-size :15px";>임산부카드번호</td>
              <td><input type="text" name="num"></td>
             </tr>
             <tr>
              <td>휴대폰</td>
              <td><select name="phone">
                <option value="010" selected="selected">010</option>
                <option value="011">011</option>
                <option value="017">017</option>
                <option value="019">019</option>
              </select> - <input type="text" name="phone1" style="width: 70px">
               - <input type="text" name="phone2" style="width: 70px"></td>
             </tr>
            </table>
           </td>
          </tr>

 

          <tr>
           <td>
            <table width="140px" height="10px" border="0"
             style="margin-top: 2%;" align="center">
             <tr>
              <td><input type="button" name="enter1" value="  찾기  "
               align="center"
               style="cursor: pointer; background: white; color: black; border-color: black;"
               onClick="id_search1()"></td>
              <td><input type="button" name="cancle1"
               value="  취소  " align="center"
               style="cursor: pointer; background: white; color: black; border-color: black;"
               onClick="cancle()"></td>
             </tr>
            </table>
           </td>
          </tr>

          <tr>
           <td>
            <table width="300px" height="20px" border="0"
             style="margin-top: 3%; font-size: 18px;">
             <br>
             <br>
             <tr>
              <td>&nbsp;&nbsp; <img src="./image/check.png"
               height="30px">
              </td>
              <td style="font-size :15px";>&nbsp;임산부카드번호, 이메일로 찾기</td>
             </tr>
            </table>
           </td>
          </tr>
          <td>
           <table width="400px" height="70px" align="center" border="0"
            style="font-size: 16px;">
            <tr>
             <td style="font-size :15px";>임산부카드번호</td>
             <td><input type="text" name="num2"></td>
            </tr>
            <tr>
             <td>E-mail&nbsp;</td>
             <td><input type="text" name="email"
              style="width: 70px" onblur="checkid()"> @ <input
              type="text" name="e_domain" style="width: 80px"> <select
              name="domain" onchange="domainCheck();">
               <option value="0" selected="selected">직접입력</option>
               <option value="naver.com">naver.com</option>
               <option value="google.com">google.com</option>
               <option value="hanmail.net">hanmail.net</option>
               <option value="nate.com">nate.com</option>
               <option value="yahoo.com">yahoo.com</option>
             </select></td>
            </tr>
           </table>
          </td>
          </tr>

          <tr>
           <td>
            <table width="140px" height="10px" border="0"
             style="margin-top: 2%" align="center">
             <tr>
              <td><input type="button" name="enter2" value="  찾기  "
               align="center"
               style="cursor: pointer; background: white; color: black; border-color: black;"
               onClick="id_search2()"></td>
              <td><input type="button" name="cancle2"
               value="  취소  " align="center"
               style="cursor: pointer; background: white; color: black; border-color: black"
               onClick="cancle()"></td>
             </tr>
            </table>
            <br>
           </td>
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


