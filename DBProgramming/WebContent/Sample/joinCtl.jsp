<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="crazyit.UserMgr" %>
<%
    
     request.setCharacterEncoding("UTF-8");//request 해오는 글씨 인코딩설정
     String id=request.getParameter("id");
     String pwd=request.getParameter("pwd");
     String num=request.getParameter("num");
     String birth=request.getParameter("birth");
     String birth1=request.getParameter("birth1");
     String birth2=request.getParameter("birth2");
     String phone=request.getParameter("phone");
     String phone1=request.getParameter("phone1");
     String phone2=request.getParameter("phone2");
     String domain=request.getParameter("domain");
     String e_domain=request.getParameter("e_domain");
     String email=request.getParameter("email");
     
     if(domain.equals("0")){
         email=email+"@"+e_domain;
        }else{
         email=email+"@"+domain;
        }
        
        phone=phone+phone1+phone2; // 가져온 핸드폰 번호 정보 데이터 가공
        
        birth=birth+birth1+birth2;
    
        
        UserMgr um2 = new UserMgr();
        
        boolean flag=um2.join(id,pwd,num,birth,phone,email);
        if(flag){//회원가입 성공시
         
         //response.sendRedirect("./home.jsp");
     
        }   
%>

   ​
<HTML>
<HEAD>
<style>

tr, td{
       border: 0px solid none; 
   }
    
#main-title {
     color:black;
     font-size:65px;
     font-weight:bold;
     }


#sub-title {
     color:black;
     font-size:15pt;
     font-weight:bold;
     }

#middle-title {
     color:black;
     font-size:13pt;
     font-weight:bold;
     }

k:hover {text-decoration:none; color:#9354ED}


</style>
     
<script>

function gohome(){
     var frm=document.joinsuccess;
     frm.method="post";
     frm.action="./home.jsp"; 
     frm.submit();  
}

function gologin(){
     var frm=document.joinsuccess;
     frm.method="post";
     frm.action="./login.jsp"; 
     frm.submit();  
}

function logout(){
     var frm=document.joinsuccess;
     frm.method="post";
     frm.action="./logoutCtl.jsp"; 
     frm.submit();  
}
</script>
</HEAD>
<SCRIPT>  
      if(!<%=flag%>){ //회원가입 실패시
        alert('실패');
        //history.back(); //전화면으로 돌아감(로그인화면)
       }
       </SCRIPT>
       <body>
        <form name="joinsuccess" method="post" >
       <%@ include file="./top.jsp" %>
     <font face="THE왼손잡이">

     <table width="1330px"  height="530px" align="center"  >
     <tr>
     <td>
      <table width="550px" align=center  border="0" style="color:black;  font-size:30px; ">
      <tr align=center> 
      <td style="height:170px"> * 회원가입이 완료되었습니다 * </td>
      </tr>
       <tr align=center>
       <td style="font-size:20px; color:FF69B4"><b><%=id%></b>님 환영합니다!가입하신 아이디로 로그인해주세요 *^^*</td>
       </tr>
     </table>
      </font>
       </form>
       </font>
       </body>
       </HTML>




    