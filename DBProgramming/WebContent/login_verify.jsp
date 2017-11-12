<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<%
String userID = request.getParameter("userID");
String userPassword = request.getParameter("userPassword");
String whoo = request.getParameter("whoo");

Connection myConn = null;
Statement stmt = null;
String mySQL = null;
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db01";
String passwd = "ss2";
String dbdriver = "oracle.jdbc.driver.OracleDriver";

Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);

stmt = myConn.createStatement();
if(whoo.equals("stud")){
	mySQL = "select s_id from student where s_id='" + userID + "' and s_pwd='" + userPassword + "'";
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	if(myResultSet.next()){
		session.putValue("user",userID);
		response.sendRedirect("main.jsp");
	}
	else {
%>
		<script>
			alert("사용자아이디 혹은 암호가 틀렸습니다.");
			location.href("login.jsp");
		</script>
<%
	}
}
else if(whoo.equals("prof")){
	mySQL = "select p_id from professor where p_id='" + userID + "' and p_pwd='" + userPassword + "'";
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet.next()) {
	      session.putValue("user", userID);
	      response.sendRedirect("pro_main.jsp");
	 } else {
%>
		<script>
			alert("사용자아이디 혹은 암호가 틀렸습니다");
			location.href("login.jsp");
	    </script>
<%  
	}  
}
stmt.close();
myConn.close();
%>
