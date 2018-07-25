<%@page import="javax.crypto.Cipher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="index.jsp" flush="false" />

<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="css/loginForm.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>로그인</title>
</head>
 
<%
 
  request.setCharacterEncoding("UTF-8");
 
  String id = "";
  Cookie[] c = request.getCookies();
  
  if(c!=null && c.length>0){
      for(int i=0; i<c.length; i++){
          if(c[i].getName().equals("id"))
              id=c[i].getValue();
      }
  }
%>
 
<body>
    <div id="containAll">
        <div id="header">
            <select>
                <option selected="">한국어</option>
                <option>English</option>
                <option>中文(简体)</option>
                <option>中文(台灣)</option>
            </select>
            <img src="img/naver.JPG">
        </div>
        
        <div id="container">
            <form action="loginAct.jsp">
             <div class="box">
              <input type="text" id="id" name="id" class="input" placeholder="아이디" value=<%=id%>>
             </div>
             <div class="box">
              <input type="password" id="password" name="pwd" class="input" placeholder="비밀번호">
             </div>
                
              <input type="submit" value="로그인">
              <input type="checkbox" id="remember" name="remember" value="remember"> 
              <label for="remember">아이디 저장</label>
            </form>
        </div>
    </div>
</body>
 
</html>

<jsp:include page="footer.jsp" flush="false" />
