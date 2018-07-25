<%@page import="LoginTask.model.Joiner"%>
<%@page import="LoginTask.model.MemberListView"%>
<%@page import="LoginTask.service.MemberListService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="index.jsp" flush="false" />

<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;

	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	MemberListService memberListService = MemberListService.getInstance();
	MemberListView viewMem = memberListService.getMemberList(pageNumber);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MemberAllPage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberList Page</title>
<style>
</style>
</head>
<body>

	<div id="containAll">

		<div id="container">
			<h1>모든 회원정보 보기</h1>

			<%
				if (viewMem.isEmpty()) {
			%>

			<h3>등록된 회원정보가 없습니다.</h3>
			<a href="indexHome.jsp">[홈으로 가기]</a>

			<%
				} else {
			%>

			<table>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>이메일</th>
					<th>핸드폰 번호</th>
				</tr>

				<%
					for (Joiner joiner : viewMem.getMemberList()) {
				%>
				<tr>
					<td><%=joiner.getId()%></td>
					<td><%=joiner.getPwd()%></td>
					<td><%=joiner.getName()%></td>
					<td><%=joiner.getBirth_year()%>/<%=joiner.getBirth_mon()%>/<%=joiner.getBirth_day()%></td>
					<td><%=joiner.getGender()%></td>
					<td><%=joiner.getEmail()%></td>
					<td><%=joiner.getPhone()%></td>
					<td>
				</tr>
				<%
					}
				%>
				
				<tr>
					<td colspan="7">
				<%
					for (int i = 1; i <= viewMem.getPageTotalCount(); i++) {
				%>
					<a href="MemberAllPage.jsp?page=<%=i%>">[<%=i%>]</a>
				<%
					}
				}
				%>
					</td>
				</tr>

				<tr>
					<td colspan="7"><input type="button" value="홈으로 가기"
						onclick="location.href='indexHome.jsp'" /></td>
				</tr>

			</table>
		</div>
	</div>

</body>
</html>

<jsp:include page="footer.jsp" flush="false" />