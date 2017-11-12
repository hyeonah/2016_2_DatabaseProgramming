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
	  var frm = document.homescreen;
	  frm.method = "post";
	  frm.action = "./home.jsp"; //넘어간화면
	  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
}

function gojoin() {
	  var frm = document.homescreen;
	  frm.method = "post";
	  frm.action = "./join.jsp"; //넘어간화면
	  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
}

function gologin() {
	  var frm = document.homescreen;
	  frm.method = "post";
	  frm.action = "./login.jsp";
	  frm.submit();
}

function goidfind() {
	  var frm = document.homescreen;
	  frm.method = "post";
	  frm.action = "./id_find.jsp";
	  frm.submit();
}

function gopwfind() {
	  var frm = document.homescreen;
	  frm.method = "post";
	  frm.action = "./pw_find.jsp";
	  frm.submit();
}

function logout() {
	  var frm = document.homescreen;
	  frm.method = "post";
	  frm.action = "./logoutCtl.jsp";
	  alert("로그아웃되었습니다.");
	  frm.submit();
}

function id_search1() { //이름,핸드폰으로 '찾기' 버튼
	  var frm = document.homescreen;
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
	  var frm = document.homescreen;
	  if (frm.num2.value.length < 1) {
	   		alert("임산부카드번호를 입력해주세요");
	   		return; }
	  if (frm.email.value.length < 1 || frm.e_domain.value.length < 1) {
	   		alert("이메일을 입력해주세요");
	   		return; }
	  frm.method = "post";
	  frm.action = "./id_searchCtl2.jsp"; //넘어간화면
	  frm.submit();  
}

function checkid() {
	  var frm = document.homescreen;
	  var regExp = '/^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/';
	  if (!regExp.test(frm.email.value)) {
	   		alert('올바른 email을 입력해주세요.');
	  		frm.email.focus(); }
}

function domainCheck() {
	  var frm = document.homescreen;
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
<form name="homescreen" method="post">
<%@ include file="./top.jsp"%>
반갑습니다. 
</BODY>
</HTML>

 

 

