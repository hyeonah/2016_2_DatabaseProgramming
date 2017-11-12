<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="crazyit.UserMgr"%>
<%

  request.setCharacterEncoding("UTF-8");
    String num=request.getParameter("num");
    
     UserMgr um = new UserMgr();
     
     boolean flag=um.numcheck(num);
     
    %>

<HTML>

<SCRIPT>  

  if(<%=!flag%>){
	  window.opener.document.getElementById("numpart").innerHTML="유효하지 않은 번호입니다.";
	  window.close();
  }else{
	  window.opener.document.joinscreen.checknum.value=1;
	  window.opener.document.getElementById("numpart").innerHTML="인증되었습니다.";
	  window.close(); 
  }
</SCRIPT>

</HTML>