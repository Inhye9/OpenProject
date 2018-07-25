<%@page import="LoginTask.messageService.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="joiner" scope="session" class="LoginTask.model.Joiner" />
<jsp:useBean id="message" class="LoginTask.model.Message" />


<%
	request.setCharacterEncoding("utf-8");
	String id = joiner.getId();
	String pwd = joiner.getPwd();
	boolean vaildPwd = false;

	if (id != null && pwd != null) {
		int messageid = Integer.parseInt(request.getParameter("messageId"));


		DeleteMessageService deleteService = DeleteMessageService.getInstance();

		if (deleteService.deleteMessage(id, messageid)) {
			vaildPwd = true;
		} else {
			vaildPwd = false;
		}
		
	} else {
%>
	<script>
		alert("로그인 해주세요.");
		location.href = 'loginForm.jsp';
	</script>
<%
	}
%>

<% if(vaildPwd){%>
	<script>
		alert("방명록을 성공적으로 삭제했습니다.");
		location.href = 'MessageListForm.jsp';
	</script>
	
<%}else{%>
	<script>
		alert("방명록을 삭제를 실패했습니다.");
		location.href = 'MessageListForm.jsp';
	</script>

<%}%>



