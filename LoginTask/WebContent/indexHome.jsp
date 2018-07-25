<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="joiner" scope="session" class="LoginTask.model.Joiner"/>
<jsp:include page="index.jsp" flush="false" />


<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>홈</title>
    <style>
        body{
            margin: 0px;
            background: #f5f6f7;
        }
        
        #main{
           width: 1000px;
           margin: 0 auto;
        }
        
 
    </style>
</head>
 
<body>
   
    <div id="main">
      <img src="img/cat.jpg" width="1000px;"/>
    </div>
    
</body>
</html>
 
<jsp:include page="footer.jsp" flush="false" />
    