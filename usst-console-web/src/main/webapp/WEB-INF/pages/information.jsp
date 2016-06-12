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
<title>个人信息</title>
<meta name="keywords" content="">
<meta name="description" content="">
<%@include file="./baseCss.jsp"%>
<script type="text/javascript" src="${ctx}/resources/js/app.js"></script>
</head>
<body>
	<section class="Hui-article-box">
		<div id="iframe_box" class="Hui-article">
			<nav class="breadcrumb">
				<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
				个人中心 <span class="c-gray en">&gt;</span> 个人信息 <a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新">
					<i class="Hui-iconfont">&#xe68f;</i>
				</a>
			</nav>
			<div class="page-container">
				<table class="table table-border table-bordered table-bg mt-20">
					<thead>
						<tr>
							<th colspan="2" scope="col">个人信息</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th width="30%">用户名</th>
							<td><span id="lbServerName">${user.userName }</span></td>
						</tr>
						<tr>
							<td>性别</td>
							<td><c:if test="${user.sex == '1'}">
						 		男
						 	</c:if> <c:if test="${user.sex == '0'}">
						 		女
						 	</c:if></td>
						</tr>
						<tr>
							<td>真实姓名</td>
							<td>${user.realName }</td>
						</tr>
						<tr>
							<td>手机号码</td>
							<td>${user.mobile }</td>
						</tr>
						<tr>
							<td>邮箱</td>
							<td>${user.email }</td>
						</tr>
						<tr>
							<td>地址</td>
							<td>${user.address }</td>
						</tr>
						<tr>
							<td>研究方向</td>
							<td>${user.resDirection }</td>
						</tr>
						<tr>
							<td>单位</td>
							<td>${user.company }</td>
						</tr>
					</tbody>
				</table>
				<div style="margin-top: 25px">
					<a _href="${ctx}/editInformation.htm"
						class="btn btn-primary radius" type="submit"><i
						class="Hui-iconfont">&#xe6df;</i>修改</a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
