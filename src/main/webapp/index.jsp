<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="utf-8">
<link href="css/xistyle.css" rel="stylesheet" type="text/css" media="all" />
<title>lee_login_html</title>
</head>
<body>
<fmt:setLocale value="zh_CN"/>
<fmt:requestEncoding value="UTF-8"/>
<fmt:bundle basename="message">
    <div class="xibox">
         <div class="xiluruk">
              <dl>
                  <dt><fmt:message key="title.appname"/><fmt:message key="title.text"/></dt>
                  <dd>
                      <select name="" class="xialak">
                        <option value="moren">请选择类型</option>
                        <option value="jianyi">建议</option>
                        <option value="chongzhi">充值问题</option>
                        <option value="zhanghao">帐号问题</option>
                        <option value="qita">其他问题</option>
                      </select>
                  </dd>
                  <dd>
                      <span>用户ID</span>
                      <input name="" type="text" class="xiwenbenk" placeholder="请输入您的ID（在设置页面可以确认您的ID）">
                  </dd>
                  <dd>
                      <span>联系邮箱</span>
                      <input name="" type="text" class="xiwenbenk" placeholder="sample@email.com">
                  </dd>
                  <dd>
                      <span>详细描述</span>
                      <textarea name="" cols="" rows="" class="xiwenbenqy">请输入详细描述。（１０００字以内）</textarea>
                  </dd>
                  <dd>
                      <input name="tijiao" type="button" value="提交"  class="querenk">
                  </dd>
              </dl>
         </div>
    </div>
</fmt:bundle>    
</body>
</html>