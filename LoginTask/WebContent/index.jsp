<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="joiner" scope="session" class="LoginTask.model.Joiner"/>
 
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>홈</title>
    <style>
        body{
            margin: 0px;
        }
        
        #topnav{
            background: #08a600;
            width:100%;
            height: 51px;
        }
        
        #topnav a{
            float: left;
            background: #08a600;
            color: #fff;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
            
            cursor:pointer;
        }
        
        #topnav a:hover{
            opacity: 0.8;
        }
        
        #topnav a:active{
            background: white;
            color: #08a600;
        }
 
    </style>
</head>
 
<body>
    <div id="topnav">
        <a href="indexHome.jsp">홈</a>
      <%
      	if(joiner.getId()!=null && joiner.getPwd()!=null){
      %>
        <a href="MyPageForm.jsp">MyPage</a>
        <a href="MemberAllPage.jsp">MemberList</a>
        <a href="MessageListForm.jsp">방명록</a>
        <a href="logoutAct.jsp">로그아웃</a>
        
        
      <%}else{%>
        <a href="MessageListForm.jsp">방명록</a>
        <a href="RegisterFirst.jsp">회원가입</a>
        <a href="loginForm.jsp">로그인</a>
        
     <%}%>
    </div>
</body>
</html>
 