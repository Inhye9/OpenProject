<%@page import="LoginTask.model.Message"%>
<%@page import="LoginTask.model.MessageListView"%>
<%@page import="LoginTask.messageService.MessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="index.jsp" flush="false" />

<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;

	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	MessageListService messageListService = MessageListService.getInstance();
	MessageListView viewData = messageListService.getMessageList(pageNumber);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MessageListForm.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 목록</title>
<style>
</style>
</head>
<body>
	<h1 id="header">방명록</h1>
	<div id="containAll">

		<%
			if (viewData.isEmpty()) {
		%>

		<h1>등록된 메시지가 없습니다.</h1>
		<input type="button" onclick="location.href='MessageInsertForm.jsp'" value="[글쓰기]">

		<%
			} else {
		%>

		<input type="button" id="writeBtn" onclick="location.href='MessageInsertForm.jsp'" value="글쓰기">

		<%
			for (Message message : viewData.getMessageList()) {
		%>
		<div id="table">
		<table>
			<tr>
				<td>메세지 번호 :<%=message.getMessage_id()%></td>
			</tr>
			<tr>	
				<td>ID : <%=message.getId()%></td>
			</tr>
			<tr>
				<td>내용 : <%=message.getMessage()%></td>
			</tr>
			<p>
			<tr>
				<td><input type="button" id="deleteBtn" onclick="location.href='MessageDeleteAct.jsp?messageId=<%=message.getMessage_id()%>'" value="삭제하기"></td>
			</tr>
		<%}%>
		</table>
		</div>
		<div id="index">
		<%for (int i = 1; i <= viewData.getPageTotalCount(); i++) {%>
			<a href="MessageListForm.jsp?page=<%=i%>">[<%=i%>]</a>
		<%
		}
			}
		%>
		</div>
	</div>
</body>
</html>

<jsp:include page="footer.jsp" flush="false" />