<%@page import="LoginTask.service.loginService"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="joiner" scope="session" class="LoginTask.model.Joiner" />
<jsp:setProperty name="joiner" property="*" />

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	int resultCnt = 0;

	loginService service = loginService.getInstance();
	resultCnt = service.login(id, pwd);
%>

<%
	if (resultCnt == 1) {
		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);
%>
	<script>
		alert('환영합니다!');
		location.href = 'indexHome.jsp';
	</script>


<%}else if(resultCnt == 2){ %>  
	<script>
		alert('비밀번호가 틀렸습니다.');
		location.href = 'loginForm.jsp';
	</script>

<%}else if(resultCnt == 3){ %>
	<script>
		alert('아이디가 틀렸습니다.');
		location.href = 'loginForm.jsp';
	</script>
<%}else if(resultCnt == 0){%>
	<script>
		alert('아이디를 정확하게 입력해주세요.');
		location.href = 'loginForm.jsp';
	</script>

<%} %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>
</style>
</head>
<body>
</body>
</html>