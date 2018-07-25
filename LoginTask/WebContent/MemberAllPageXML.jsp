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

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MemberAllPage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberList Page</title>
<style>

</style>
</head>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(document).ready(function(){
		
		$.ajax({
			url: 'JoinerXml.jsp',
			success : function(data){
				var html = '';
				$(data).find('member').each(function(){
					var id = $(this).find('id').text()
					var pwd = $(this).find('pwd').text()
					var name = $(this).find('name').text()
					var birth = $(this).find('birth').text()
					var gender = $(this).find('gender').text()
					var email = $(this).find('email').text()
					var phone = $(this).find('phone').text()
					var photo = $(this).find('photo').text()
					
					/* $('<p></p>').text(id+" / "+pwd+" / "+name+" / "+birth+" / "+gender+" / "+email+" / "+phone+" / "+photo).appendTo('#table'); */
					
					html += '<tr>';
					html += '<td>'+ id +'</td>';
					html += '<td>'+ pwd +'</td>';
					html += '<td>'+ name +'</td>';
					html += '<td>'+ birth +'</td>';
					html += '<td>'+ gender +'</td>';
					html += '<td>'+ email +'</td>';
					html += '<td>'+ phone +'</td>';
					html += '<td>'+ photo +'</td>';
					html += '</tr>';
				});
				$('#table').html(html);
			}
		});
		
	});
	
</script>

<body>

	<div id="containAll">

		<div id="container">
			<h1>모든 회원정보 보기</h1>

	
			<table id="table">
		
				<tr id="tr">
				</tr>
			</table>
				<input type="button" value="홈으로 가기"
						onclick="location.href='indexHome.jsp'" />
		</div>
	</div>

</body>
</html>

<jsp:include page="footer.jsp" flush="false" />