<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<% 
   Connection conn = null;
   PreparedStatement pstmt = null;
   
   try{
	   String url = "jdbc:mysql://localhost:3306/itDB";
	   String id = "root";
	   String pwd = "411a";
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(url,id,pwd);
      
       String sql = "insert into member values(?,?,?,?,?,?)";
       pstmt = conn. prepareStatement(sql);
       pstmt.setString(1,request.getParameter("id"));
       pstmt.setString(2,request.getParameter("pwd"));
       pstmt.setString(3,request.getParameter("pwd2"));
       pstmt.setString(4,request.getParameter("num"));
       pstmt.setString(5,request.getParameter("date1"));
       pstmt.setString(6,request.getParameter("email"));
      
       
      if(request.getParameter("id") !=null){
      	pstmt.executeUpdate();
      }
   }
   catch(Exception e){
   	System.out.println(e);
   }
   
%>

<html>
<head>
<script>
function lengthcheck(){
	var fr = document.getElementById("my_form");
    if (fr.id.value.length < 4) {
        alert("ID는 4글자 이상 입력하세요.");
        fr.id.focus();
    }
}

function passwordcheck() {
    var fr = document.getElementById("my_form");
    if (fr.pwd.value != fr.pwd2.value) {
        alert("password가 일치하지 않습니다.")
        fr.pwd2.focus();
    }

}
	
function confirm(){
	 if (!document.my_form.id.value) {
         alert("아이디를 입력하세요");
         document.my_form.id.focus();
         return false;
     }
	 if (!document.my_form.pwd.value) {
         alert("비밀번호를 입력하세요");
         document.my_form.pwd.focus();
         return false;
     }

     if (!document.my_form.pwd2.value) {
         alert("비밀번호를 확인해주세요");
         document.my_form.pwd2.focus();
         return false;
     }
     if (!document.my_form.num.value) {
         alert("임산부번호를 입력하세요");
         document.my_form.num.focus();
         return false;
     }
     if (!document.my_form.date1.value) {
         alert("출산예정일을 선택해주세요");
         document.my_form.date1.focus();
         return false;
     }
     
     var fr = document.getElementById("my_form");
     alert("회원가입을 축하합니다.");

}
function check() { //중복체크
	  var fr = getElementById("my_form");

	  if (fr.id.value.length < 4) {
	   alert("ID는 4글자 이상 입력하세요.");
	  }  else {
	   window.open("./joinid.jsp?id=" + fr.id.value, "",
	     "width=10px,height=10px");

	  }
	 }

</script> 
<meta charset=UTF-8">
<title>JOIN FORM</title>
</head>
<body>
<h1>회원가입 양식</h1>
<hr/>
<form id=my_form name=my_form method=post action=startpage.jsp>
<tr>
 <p><label>아이디 : <input type="text" name="id" size=10 onblur="lengthcheck()" placeholder="아아디입력"></label>
    <input type="button" name="id1" value="중복확인" onclick="check"/></p>
    <div id="info"></div> 
    <input type="hidden" name="checkid" value="0" font-size=9>
  
 <p><label>비밀번호 : <input type="password" name="pwd" placeholder="비밀번호입력" size=15></label></p>
 <p><label>비밀번호 확인 : <input type="password" name="pwd2" placeholder="비밀번호입력" size=15 onblur="passwordcheck()"></label></p>
 <p><label>임산부 번호 : <input type="text" name="num" size=11 placeholder="임산부번호입력"> 
                    <input type="button" value="인증확인" /></label></p>
 <p><label>출산예정일 : <input type="date" name="birth"></label></p> 
 <p><label>연락처 : <input type="text" name="phone" size=13 placeholder=" -없이입력하세요"></label></p>		
 <p><label>E-mail : <input type="email" name="email" size=13></label></p> 
 <p><label> <input type="submit" name="submit" value="가입하기" onclick="return confirm()" />
&nbsp;<input type="reset" value="취소하기" /> </label></p>
</tr>
</form>
</body>
</html>