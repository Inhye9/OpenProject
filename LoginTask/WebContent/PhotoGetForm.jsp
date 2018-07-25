<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String imgName = request.getParameter("imgName");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 사진 업로드</title>
<style>

body {
            margin: 0px;
            background: #f5f6f7;
        }
        
         #containAll {
            width: 768px;
            margin: 0 auto;
            margin-top: 10px;
        }
 
        
        #container {
            width: 460px;
            margin: 0 auto;
            background: white;
            border: 1px solid gray;
            text-align: center;
            padding: 20px;
        }
        
           #container>h1{
           text-align:center; 
           color: #08a600;
           font-size: 40px;
           font-weight: bold;
           margin-bottom: 20px;
        
        }
        
         input[type=button], input[type=submit]{
            width: 100%;
            height: 55px;
            border: none;
 
            font-size: 20px;
            color: #fff;
            background: rgb(31, 188, 2);
 
            margin-top: 15px;
            margin-bottom: 15px;
            
            cursor:pointer;
        }
</style>
</head>
<body>
<div id="containAll">
	<div id="container">
	<h1>프로필 사진 업로드</h1>
	
	
	<%if(imgName==null){ %>
	
	<form action="PhotoGetAct.jsp" method="post" enctype="multipart/form-data">
	<input type="file" name="photo" value=""><br>
	<input type="submit" value="사진 등록">
	</form>

	<%}else{ %>
		
	<img id="img" alt="사진" src="file/photo/<%=imgName%>" style="width:400px">
	<input type="button" value="회원가입으로 돌아가기" onclick="selfClose()">

	<%} %>
	
	</div>
	</div>
</body>
</html>

<script>
	function selfClose(){
			alert("사진이 정상적으로 등록되었습니다.");
			opener.document.Regi.photo.value="file/photo/<%=imgName%>";
			self.close();

	}
</script>
