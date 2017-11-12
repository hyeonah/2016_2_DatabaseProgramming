<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOIN</title>
<style>
k:hover {
 text-decoration: none;
 color: #9354ED
}

tr {
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
</style>

<script>
 function gohome() {
  var frm = document.joinscreen;
  frm.method = "post";
  frm.action = "./home.jsp";
  frm.submit();
 }

 function gojoin() {
  var frm = document.joinscreen;
  frm.method = "post";
  frm.action = "./join.jsp";
  frm.submit();
 }
 
 function gologin() {
  var frm = document.joinscreen;
  frm.method = "post";
  frm.action = "./login.jsp";
  frm.submit();
 }

 function logout(){
     var frm=document.joinscreen;
      frm.method="post";
   frm.action="./logoutCtl.jsp"; 
   alert("로그아웃되었습니다.");
   frm.submit();   
 }
 
 function check1() { //중복체크
  var frm = document.joinscreen;
  if (frm.id.value.length < 4) {
   alert("아이디는 4자 이상 입력해주세요");
  }  else {
   window.open("./joinid.jsp?id=" + frm.id.value, "",
     "width=10px,height=10px");
  }
 }
 
 function check2() { // 빨간글씨부분 
  var frm = document.joinscreen;
  frm.checkid.value = 0;
  document.getElementById("info").innerHTML = " 최소 4자이상 영문,숫자만 입력하세요.";
 }

 function check3() { // 알림창부분 
	  var frm = document.joinscreen;
	  if (frm.num.value.length < 5) {
	   alert("카드번호 5자리를 입력해주세요.");
	  }  else {
	   window.open("./joinnum.jsp?num=" + frm.num.value, "",
	     "width=10px,height=10px");
	  }
 }

function check4() { // 빨간글씨부분 
	  var frm = document.joinscreen;
	  frm.checknum.value = 0;
	  document.getElementById("numpart").innerHTML = " 최소 5자이상 영문,숫자만 입력하세요.";
	 }
 
 function enter() { //등록 버튼

  var frm = document.joinscreen;

  if (frm.id.value.length < 4) {
   alert("아이디는 4자 이상 입력해주세요");
   return;
  }

  if (frm.checkid.value == 0) {
   alert("중복확인을 눌러주세요");
   return;
  }

  if (frm.pwd.value.length < 4) {
   alert("비밀번호는 4자이상 입력해주세요");
   return;
  }
  if (frm.pwd1.value != frm.pwd.value) {
   alert("비밀번호가 다릅니다");
   return;
  }
  if (frm.num.value.length < 1) {
   alert("임산부카드번호를 입력해주세요");
   return;
  }
  if (frm.checknum.value == 0) {
	   alert("인증확인버튼을 눌러주세요");
	   return;
	  }
  if (frm.birth.value.length < 1) {
	   alert("예정일을 입력해주세요");
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
  if (frm.email.value.length < 3 || frm.e_domain.value.length < 1) {
   alert("올바른 이메일 주소를 입력해주세요");
   return;
  }

  frm.method = "post";
  frm.action = "./joinCtl.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 }

 //이메일 부분

 function checkid() {

  var frm = document.joinscreen;

  var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/ ';

  if (!regExp.test(frm.email.value)) {

   alert('올바른 email을 입력해주세요.');

   frm.email.focus();
  }
 
 }
 
function goidfind() {
	  var frm = document.joinscreen;
	  frm.method = "post";
	  frm.action = "./id_find.jsp";
	  frm.submit();
}

function gopwfind() {
	  var frm = document.joinscreen;
	  frm.method = "post";
	  frm.action = "./pw_find.jsp";
	  frm.submit();
}

function id_search1() { //이름,핸드폰으로 '찾기' 버튼
	  var frm = document.joinscreen;
	  if (frm.num.value.length < 1) {
	   		alert("임산부카드번호를 입력해주세요");
	   		return; }
	  if (frm.phone1.value.length<2 || frm.phone1.value.length>4) {
	   		alert("핸드폰번호를 정확하게 입력해주세요");
	   		return; }
	  if (frm.phone2.value.length<2 || frm.phone2.value.length>4) {
	   		alert("핸드폰번호를 정확하게 입력해주세요");
	   		return; }
	  frm.method = "post";
	  frm.action = "./id_searchCtl.jsp"; //넘어간화면
	  frm.submit();  
}

function id_search2() { //이름,이메일로 '찾기' 버튼
	  var frm = document.joinscreen;
	  if (frm.num2.value.length < 1) {
	   		alert("임산부카드번호를 입력해주세요");
	   		return; }
	  if (frm.email.value.length < 3 || frm.e_domain.value.length < 1) {
	   		alert("이메일을 입력해주세요");
	   		return; }
	  frm.method = "post";
	  frm.action = "./id_searchCtl2.jsp"; //넘어간화면
	  frm.submit();  
}

function domainCheck() {
	  var frm = document.joinscreen;
	  if (frm.domain.value == 0) {
	   frm.e_domain.value = "";
	   frm.e_domain.disabled = false;
	  } else {
	   frm.e_domain.value = frm.domain.value;
	   frm.e_domain.disabled = true;
	  }
}

function logout() {
	  var frm = document.joinscreen;
	  frm.method = "post";
	  frm.action = "./logoutCtl.jsp";
	  alert("로그아웃되었습니다.");
	  frm.submit();
}
</script>

</HEAD>


<BODY>

 <form name="joinscreen" method="post">

  <%@ include file="./top.jsp"%>
  <font face="Yang Rounded">
   <table width="900px" height="500px" align="center"
    style="background-color: #FFEBF0">
    <tr>
     <td>
      <table width="650px" align="center" border="0"
       style="color: black; font-size: 38px; margin-top: 5%">
       <tr>
        <td>
         <table width="550px" align="center" border="0"
          style="color: black; font-size: 20px;">
          <tr>
           <td>
            <table width="750px" align="center" border=0;
             style="background-color: white">
             <tr>
              <td align="center"><img src="./image/baby&mom.png"
               height="50px"></td>
              <td>&nbsp;회원가입</td>
              <td><div id="sub-title">| 정확한 정보를 입력해주세요.</td>
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
         <table align="center" style="margin-top: -2%; margin:auto;">
          <tr>
           <td>
            <table align="center" border=0
             style="background-color: none; border-color: black; font-size: 15px; border-style: solid"
             width="450" height="350">
             <tr style="border: 1">
              <br>
              <br>
              <td style="text-align: center; border: 1">아이디</td>
              <td style="color: red; font-size: 11px;">
              <input type="text" name="id" value="" onchange="check2()">
              <input type="button" name="id1" value="중복확인" 
                onClick="check1()">
               <div id="info">최소 4자이상 영문,숫자만 입력하세요.</div> <input 
                  type="hidden" name="checkid" value="0"></td>
             </tr>
             <tr>
              <td style="text-align: center;">비밀번호</td>
              <td><input type="password" name="pwd" ></td>
             </tr>
             <tr>
              <td style="text-align: center;">비밀번호 확인</td>
              <td><input type="password" name="pwd1" >
              </td>
             </tr>
             <tr>
              <td style="text-align: center; border:1">임산부카드번호</td>
              <td style="color: red; font-size: 11px;">
              <input type="text" name="num" value="" onchange="check4()">
              <input type="button" name="num1" value="인증확인" 
                onClick="check3()">
               <div id="numpart">7자리의 임산부카드번호를 입력하세요.</div> <input 
                  type="hidden" name="checknum" value="0"></td>
             </tr>
             <tr>
              <td style="text-align: center;">예정일</td>
			  <td><select name="birth" >
              	<option value="2018" selected="selected">2018</option>
                <option value="2017">2017</option>
                <option value="2016">2016</option>
                <option value="2015">2015</option>
                <option value="2014">2014</option>
                <option value="2013">2013</option>
                <option value="2012">2012</option>
                <option value="2011">2011</option>
                <option value="2010">2010</option>
                <option value="2009">2009</option>
                </select>
                <select name="birth1">
                <option value="1" selected="selected">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                </select>
                <select name="birth2">
                <option value="1" selected="selected">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
                </select></td>
             </tr>
             <tr>
              <td style="text-align: center;">연락처</td>
              <td><select name="phone">
                <option value="010" selected="selected">010</option>
                <option value="011">011</option>
                <option value="016">017</option>
                <option value="017">019</option>
              </select> - <input type="text" name="phone1" value=""
               style="width: 70px"> - <input type="text"
               name="phone2" value="" style="width: 70px"></td>
             </tr>
             <tr>
              <td style="text-align: center;">E-mail</td>
              <td><input type="text" name="email"
               style="width: 80px" onblur="checkid()"> @ <input
               type="text" name="e_domain" style="width: 80px">
               <select name="domain" onchange="domainCheck();">
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
         </table>
       </td>
       </tr>
       <tr>
        <td><br>
         <table align="center" style="background-color: none;">
          <tr>
           <td><input type="button" value="  가입  "
            style="cursor: pointer; background-color: white; border: solid 2px black; color: black; font-weight: bold;"
            onClick="enter()"> <input type="reset"
            value="  취소  "
            style="cursor: pointer; background-color: white; border: solid 2px black; color: black; font-weight: bold;"
            onClick="cancle()"></td>
          </tr>
         </table></td>
       </tr>
      </table>
     </td>
    </tr>

   </table>


  </font>
 </form>
</BODY>
</HTML>

 

 

