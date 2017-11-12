<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<style>
.dropdown>ul>li {
 display: inline-block;
 position: relative;
}

.dropdown>ul>li>ul {
 position: absolute;
 list-style-type: none;
 padding-left: 0px;
 padding-top: 5px;
 display: none;
}

.dropdown>ul>li:hover>ul {
 display: block;
}

a{
text-decoration: none
}

t{
color:white;
font-weight:bold
}

m{
color:9400d3;
font-weight:bold
}

w:hover {
 text-decoration: none;
 color: red
}
</style>
</head>
<body>
  <font family: "Exo">
   <table height="170px" border="0" width="1330px"
    style="background-color: white" border="0">
    <tr>
     <td>
      <%
      String session_id= (String)session.getAttribute("user");
       if (session_id == null) {
      %>
      <table width="1330px" height="40px" border="0" align="right"
       border="0" style="color: white; background-color: black">
       <tr>
        <td><audio controls
          style="width:250px; margin-left:7%; margin-top:1%;">
         <source src="./music/Rough.mp3" type="audio/mpeg"></audio>
        </td>
        <td style="width: 550px"></td>
        <td><a href="login.jsp"><t><w>로그인</w></t></a></td>
        <td></td>
        <td><a href="pro_update.jsp"><t><w>회원정보수정</w></t></a></td>
        <td></td>
       </tr>
      </table> 
<%} else {
%>
      <table width="1340px" height="40px" border="0" align="right"
       border="0" style="color: white; background-color: black">
       <tr>
        <td><audio controls
          style="width:250px; margin-left:7%; margin-top:1%;">
         <source src="./music/Rough.mp3" type="audio/mpeg"></audio>
        </td>
        <td style="width: 550px"></td>
        <td onClick="myinfomenu()" style="cursor: pointer"><w><%=session.getAttribute("user")%>님</w></td>
        <td></td>
        <td><a href=logout.jsp><t><w>로그아웃</w></t></a></td>
        <td></td>
        <td><a href=pro_update.jsp><t><w>회원정보수정</w></t></a></td>
        <td></td>
       </tr>
      </table>
<%} %>
     </td>
    </tr>
    <tr align="center">
     <td align="center" style=" height: 180px;">
      <table width="700px" align=center>
       <tr>
        <td>
         <table width="500px" height="150px" align=center border="0">
          <tr>
           <td align="center"><a href="pro_main.jsp"><img src="snow.gif" 
            width="250px" height="300px"></a></td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>

    <tr>
     <td>
      <table width="1000px" border="0" align="center" border="0">
       <tr>
        <td>
         <table width="1000px" border="0" align="center" border="0"
          style="color: black">
          <tr>
           <td>
            <div class="dropdown" style="margin : 0 auto ">
             <ul align="center" style="font-size: 17px">
              <li align="center"><a href="pro_insert.jsp" style="cursor: pointer;">
               <m><w> 강의개설</w></m></a></li>
              <li style="width: 60px">|</li>
              <li align="center"><a href="pro_delete.jsp" style="cursor: pointer;">
              <m><w>개설 강의 삭제</w></m></a></li>
              <li style="width: 60px">|</li>
              <li align="center"><a href="pro_select.jsp" style="cursor: pointer;">
              <m><w>개설 강의 조회</w></m></a></li>
              <li style="width: 60px">|</li>
               </ul></li>
             </ul>
            </div>
           </td>
          </tr>
       <tr>
           <td height="20px"></td>
          </tr>
         </table>
        </td>
       </tr>
      </table> 
     </font>
     </td>
    </tr>
   </table>
</body>
</html>


