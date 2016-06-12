<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico">
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<title>首页</title>
<meta name="keywords" content="">
<meta name="description" content="">
<%@include file="./baseCss.jsp"%>
<script type="text/javascript" src="${ctx}/resources/js/app.js"></script>
</head>
<body>
	<div class="load" id="load">
		<img alt="/resources/images/load.gif" src="">
	</div>
	<input type="hidden" id="roleId" value="${user.roleId}" name="roleId">
	<input type="hidden" id="userId" value="${user.id}" name="userId">
	<section class="Hui-article-box">
		<div id="iframe_box" class="Hui-article">
			<nav class="breadcrumb">
				<i class="Hui-iconfont">&#xe67f;</i> 首页
			</nav>
			<input type="hidden" id="userId" name="userId"
				value="<%=(String) session.getAttribute("userId")%>">
			<div class="wellcome">${user.realName},您好！欢迎您的使用！</div>
		</div>
	</section>
</body>
</html>