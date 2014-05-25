<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bt.service.Service" %>    
<html>
<head>
<meta charset="utf-8">
<link href="css/xistyle.css" rel="stylesheet" type="text/css" media="all" />
<title>ok</title>
</head>

<body>
<%
String category = request.getParameter("category");
String uid = request.getParameter("uid");
String email = request.getParameter("email");
String feedback = request.getParameter("feedback");
String game = request.getParameter("game");

Service service = new Service();
service.saveFeedback(category, uid, email, new String(feedback.getBytes("ISO-8859-1"), "UTF-8"), game);

//String msg = new String(feedback.getBytes("ISO-8859-1"), "UTF-8");
//out.print(msg);
%>
    <div class="xi_ok">
         提交成功！
    </div>


</body>
</html>
