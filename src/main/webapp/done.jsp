<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bt.service.Service" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Submit Done</title>
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
Done!!
</body>
</html>