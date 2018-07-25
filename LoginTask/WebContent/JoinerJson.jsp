<%@page import="LoginTask.model.Joiner"%>
<%@page import="java.util.List"%>
<%@page import="LoginTask.service.MemberListService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>﻿[
<% 
	MemberListService memberListService = MemberListService.getInstance();
	List<Joiner> viewMem = memberListService.getMemberList2();
	int resultCnt = 0; 
%>

	<%
	for (Joiner joiner : viewMem) {
		String birth = joiner.getBirth_year() +"/"+ joiner.getBirth_mon() +"/"+ joiner.getBirth_day(); 
	%>
	{
		"id" : "<%=joiner.getId()%>",
		"pwd" : "<%=joiner.getPwd()%>",
		"name" : "<%=joiner.getName()%>",
		"birth" : "<%=birth%>",
		"gender" : "<%=joiner.getGender()%>",
		"email" : "<%=joiner.getEmail()%>",
		"phone" : <%=joiner.getPhone()%>,
		"photo" : "<%=joiner.getPhoto()%>"
	}<% 
		resultCnt++;
		if(resultCnt!=viewMem.size()){%>,<%}
	}%>
	
]

<%-- "<%=joiner.getBirth_year()%>/<%=joiner.getBirth_mon()%>/<%=joiner.getBirth_day()%>" --%>