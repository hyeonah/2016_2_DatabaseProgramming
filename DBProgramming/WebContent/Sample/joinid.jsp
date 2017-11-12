<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="crazyit.UserMgr"%>
<%

  request.setCharacterEncoding("UTF-8");
    String id=request.getParameter("id");
    
     UserMgr um = new UserMgr();
     
     boolean flag=um.idcheck(id);
     
    %>

<HTML>

<SCRIPT>  

  if(<%=!flag%>){
   window.opener.document.joinscreen.checkid.value=1;
   window.opener.document.getElementById("info").innerHTML="사용가능한 아이디 입니다.";
   window.close();
  }else{
   window.opener.document.getElementById("info").innerHTML="중복되는 아이디 입니다.";
   window.close();
  }
    </SCRIPT>

</HTML>


    