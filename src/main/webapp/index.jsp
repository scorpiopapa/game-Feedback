<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<link href="css/xistyle.css" rel="stylesheet" type="text/css" media="all" />
<title>Feedback</title>
</head>
<body>
    <div class="xibox">
         <div class="xiluruk">
              <dl>
                  <dt>神圣之链问题建议提交</dt>
                  <dd>
                      <select name="category" class="xialak">
                        <option value="title">请选择类型</option>
                        <option value="suggest">建议</option>
                        <option value="payment">充值问题</option>
                        <option value="account">帐号问题</option>
                        <option value="other">其他问题</option>
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
                      <textarea name="" cols="" rows="" class="xiwenbenqy" placeholder="请输入详细描述。（１０００字以内）"></textarea>
                  </dd>
                  <dd>
                      <input name="tijiao" type="button" value="提交"  class="querenk">
                  </dd>
              </dl>
         </div>
    </div>
</body>
</html>