
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="index.jsp" flush="false" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MemberAllPage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberList Page</title>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(document).ready(function(){
		
		
	/* 	$.getJSON('JoinerJson.jsp', function(data){	
				alert('hey');
			$.each(data, function(key, value){
				var str = '<h1>' + value.name  + '</h1>';
				$('body').append(str);
			});
		}); */
	
		//0.
		 $.getJSON('JoinerJson.jsp', function(data){
		var html = '';
			$.each(data, function(key,value){
				html += '<tr>';
				html += '<td>'+ value.id +'</td>';
				html += '<td>'+ value.pwd +'</td>';
				html += '<td>'+ value.name +'</td>';
				html += '<td>'+ value.birth +'</td>';
				html += '<td>'+ value.gender +'</td>';
				html += '<td>'+ value.email +'</td>';
				html += '<td>'+ value.phone +'</td>';
				html += '<td>'+ value.photo +'</td>';
				html += '</tr>';
			});
			$('#table').html(html);
		}); 
		
		
	});
	
</script>
</head>


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