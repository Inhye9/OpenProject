<%@page import="LoginTask.model.Joiner"%>
<%@page import="java.util.List"%>
<%@page import="LoginTask.service.MemberListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<?xml version="1.0" encoding="UTF-8"?>

<% 
	MemberListService memberListService = MemberListService.getInstance();
	List<Joiner> viewMem = memberListService.getMemberList2();
%>

	<%for (Joiner joiner : viewMem) {%>
	
	<members>
	<member>
	<id><%=joiner.getId()%></id>
	<pwd><%=joiner.getPwd()%></pwd>
	<name><%=joiner.getName()%></name>
	<birth><%=joiner.getBirth_year()%>/<%=joiner.getBirth_mon()%>/<%=joiner.getBirth_day()%></birth>
	<gender><%=joiner.getGender()%></gender>
	<email><%=joiner.getEmail()%></email>
	<phone><%=joiner.getPhone()%></phone>
	<photo><%=joiner.getPhoto()%></photo>
	</member>
	</members>
	
	<%}%>