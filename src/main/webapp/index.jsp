<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bt.service.Service" %>
<%@ page import="java.util.Locale" %>
<html>
<head>
<meta charset="utf-8">
<link href="css/xistyle.css" rel="stylesheet" type="text/css" media="all" />
<title>用户反馈</title>
<script type="text/javascript">
function validate(){
	var uid = document.getElementById("uid");
	if(uid.value.length == 0){
		alert('请输入用户ID');
		return false;
	}
	
	return true;
}
</script>
</head>

<body onsubmit="return validate();">
<%
//String game = request.getParameter("game");
String game = "english";
Service service = new Service(game, Locale.CHINA);
%>
<form action="ok.jsp" method="post">
    <!-- <div class="xibox"> -->
         <div class="xiluruk">
              <dl>
                  <dt><%=service.getMessage("title.game")%>问题建议提交</dt>
                  <dd>
                      <span>&nbsp;</span>
                      <select name="category" class="xiwenbenk">
                        <option value="suggest"><%=service.getMessage("select.suggest")%></option>
                        <option value="payment"><%=service.getMessage("select.payment")%></option>
                        <option value="account"><%=service.getMessage("select.account")%></option>
                        <option value="other"><%=service.getMessage("select.other")%></option>
                      </select>
                  </dd>
                  <dd>
                      <span>用户ID</span>
                      <input id="uid" name="uid" type="text" class="xiwenbenk" maxlength="10" placeholder="请输入您的ID（在设置页面可以确认您的ID）">
                  </dd>
                  <dd>
                      <span>联系邮箱</span>
                      <input name="email" type="email" class="xiwenbenk" maxlength="20" placeholder="sample@email.com">
                  </dd>
                  <dd>
                      <span>详细描述</span>
                      <textarea name="feedback" cols="" rows="" class="xiwenbenqy" maxlength="1000" placeholder="请输入详细描述。（１０００字以内）"></textarea>
                  </dd>
                  <dd>
                      <input type="submit" value="提交"  class="querenk">
                      <%-- <input type="hidden" name="game" value='<%=request.getParameter("game")%>'/> --%>
                      <input type="hidden" name="game" value='<%=game%>'/>
                  </dd>
              </dl>
         </div>
    <!-- </div> -->
</form>

</body>
</html>
