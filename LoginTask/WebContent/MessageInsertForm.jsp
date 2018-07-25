<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="joiner" scope="session" class="LoginTask.model.Joiner" />
<jsp:setProperty name="joiner" property="*" />

<jsp:include page="index.jsp" flush="false" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MessageInsertForm.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 쓰기</title>
<style>
</style>
</head>
<body>

<h1 id="header">방명록 글쓰기</h1>
	<div id="containAll">

<%if(joiner.getId()!=null){ %>

	    <form action="MessageInsertAct.jsp" method="post">
		ID : ${joiner.id} <br>
		<input type="hidden" name="id" value="${joiner.id}" />
		<input type="hidden" name="password" value="${joiner.pwd}" />
		
		메시지 :<br><br>
		 <textarea name="message" cols="30" row="3"></textarea><br>
		<input type="submit" id="submitBtn" value="입력" />

	</form>
    </div>
</body>
</html>

<%}else{%>
	<script>
		alert('로그인 해주세요.');
		location.href = 'loginForm.jsp';
	</script>
<%}%>

<jsp:include page="footer.jsp" flush="false" />