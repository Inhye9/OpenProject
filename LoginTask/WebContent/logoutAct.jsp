<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>
</style>
</head>
<body>
<%  
   session.invalidate();

	out.println("<script>");
	out.println("alert('로그아웃 되었습니다.')");
	out.println("location.href='loginForm.jsp'");
	out.println("</script>");
	
   /* response.sendRedirect("indexHome.jsp"); */
%>
</body>
</html>