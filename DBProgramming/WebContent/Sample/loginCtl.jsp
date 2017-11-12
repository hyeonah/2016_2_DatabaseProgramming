<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="crazyit.UserMgr" %>
<%@ page import="crazyit.UserDTO" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.net.Socket" %>
<%@ page import="java.net.UnknownHostException" %>
<%@ page import="java.io.DataOutputStream" %>
<%@ page import="java.io.OutputStream" %>

<%
	 
     request.setCharacterEncoding("UTF-8");//request 해오는 글씨 인코딩설정
     String id=request.getParameter("id");
     String pwd=request.getParameter("pwd");
     System.out.println("id:"+id);
     System.out.println("pwd:"+pwd);
     UserMgr um = new UserMgr();
     UserDTO dto=um.login(id,pwd);
     if(dto.getId()!=null){//하나라도 null이 아니면 성공
      session.setAttribute("id",dto.getId());
      session.setAttribute("num",dto.getNum());
      session.setAttribute("birth",dto.getBirth());
      session.setAttribute("phone",dto.getPhone());
      session.setAttribute("email",dto.getEmail()); 
      session.setMaxInactiveInterval(600);//10분동안 아무것도 하지않으면 로그아웃
      response.sendRedirect("./home.jsp");
 	  Socket soc = new Socket("203.252.195.155",8080);
	//InputStream in = soc.getInputStream();
	//DatainputStream dis = new DataInputStream(in);
	  System.out.println("서버와 연결성공");
	  OutputStream os = soc.getOutputStream();
	  DataOutputStream dos = new DataOutputStream(os);
	  dos.writeUTF("로그인되었습니다.");
	  soc.close();
     }
     
%>
    
<SCRIPT>
	if(<%=dto.getId()==null%>){ //로그인 실패시
 		alert('실패');
 		history.back(); //전화면으로 돌아감(로그인화면)
	}
	else
    	alert("로그인되었습니다.");
</SCRIPT>

<HTML>
<HEAD>
</HEAD>
<BODY >
</BODY>
</HTML> 


