<%@page import="LoginTask.model.Joiner"%>
<%@page import="LoginTask.service.selectMypageService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="joiner" scope="session" class="LoginTask.model.Joiner" />

<jsp:include page="index.jsp" flush="false" />

<%

String id = joiner.getId();

selectMypageService service = selectMypageService.getInstance();
Joiner getJoiner = service.printMypage(id);
String photo = getJoiner.getPhoto();

%>	
	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MyPageForm.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<style>
</style>
</head>
<body>


	<div id="containAll">

	  <%if (getJoiner != null) {%>
		<div id="container">
			<h1>My Page</h1>
		   <% if(photo!=null){ %> 
			<img src="<%=getJoiner.getPhoto() %>" style="width:200px;">
			<%} %>
			<p>
			<table>
				<tr>
					<td>아이디</td>
					<td><%=getJoiner.getId()%></td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td><%=getJoiner.getPwd()%></td>
				</tr>

				<tr>
					<td>이름</td>
					<td><%=getJoiner.getName()%></td>
				</tr>

				<tr>
					<td>생년월일</td>
					<td><%=getJoiner.getBirth_year()%>/<%=getJoiner.getBirth_mon()%>/<%=getJoiner.getBirth_day()%></td>
				</tr>

				<tr>
					<td>성별</td>
					<td><%=getJoiner.getGender()%></td>
				</tr>

				<tr>
					<td>이메일</td>
					<td><%=getJoiner.getEmail()%></td>
				</tr>

				<tr>
					<td>핸드폰 번호</td>
					<td><%=getJoiner.getPhone()%></td>
				</tr>

				<tr>
					<td colspan="2"><input type="button" value="홈으로 가기"
						onclick="location.href='indexHome.jsp'" /></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>

	<%} else {%>
	<script>
	alert('로그인 해주세요.');
	location.href='loginForm.jsp';
	</script>
	<%}%>


<jsp:include page="footer.jsp" flush="false" />