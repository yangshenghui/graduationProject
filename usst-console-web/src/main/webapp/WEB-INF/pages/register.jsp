<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
  String path = request.getContextPath(); 
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; 
%>
<c:set var="ctx" value="<%=basePath %>"></c:set>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico">
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx}/resources/lib/html5.js"></script>
<script type="text/javascript" src="${ctx}/resources/lib/respond.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/static/h-ui/css/H-ui.login.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>注册</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>
<body>
	<div class="header">
		<span class="register">在线期刊文章投稿管理系统</span>
	</div>
	<article class="page-container page-register">
		<form action="${ctx}/userRegister.htm" method="post"
			class="form form-horizontal page-register-form"
			id="form-user-reginster">
			<div class="page-register-title">
				<span>作者注册</span>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>用户名：</label>
				<div class="formControls col-xs-8 col-sm-6">
					<input type="text" class="input-text" value="" placeholder=""
						id="userName" name="userName">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>密码：</label>
				<div class="formControls col-xs-8 col-sm-6">
					<input type="password" class="input-text" value="" placeholder=""
						id="userPsw" name="userPsw">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>确认密码：</label>
				<div class="formControls col-xs-8 col-sm-6">
					<input type="password" class="input-text" value="" placeholder=""
						id="cofirmPassword" name="cofirmPassword">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>性别：</label>
				<div class="formControls col-xs-8 col-sm-6 skin-minimal">
					<div class="radio-box">
						<input name="sex" type="radio" value="1" id="sex-1" checked>
						<label for="sex-1">男</label>
					</div>
					<div class="radio-box">
						<input type="radio" id="sex-2" value="0" name="sex"> <label
							for="sex-2">女</label>
					</div>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>真实姓名：</label>
				<div class="formControls col-xs-8 col-sm-6">
					<input type="text" class="input-text" value="" placeholder=""
						id="realName" name="realName">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>手机：</label>
				<div class="formControls col-xs-8 col-sm-6">
					<input type="text" class="input-text" value="" placeholder=""
						id="mobile" name="mobile">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3"><span
					class="c-red">*</span>邮箱：</label>
				<div class="formControls col-xs-8 col-sm-6">
					<input type="text" class="input-text" placeholder="@" name="email"
						id="email">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">通讯地址：</label>
				<div class="formControls col-xs-8 col-sm-6">
					<input type="text" class="input-text" value="" placeholder=""
						id=address name="address">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">研究方向：</label>
				<div class="formControls col-xs-8 col-sm-6">
					<input type="text" class="input-text" value="" placeholder=""
						id="resDirection" name="resDirection">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">单位名称：</label>
				<div class="formControls col-xs-8 col-sm-6">
					<input type="text" class="input-text" value="" placeholder=""
						id="company" name="company">
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;"> <a href="login.htm">已注册？登录</a>
				</div>
			</div>
		</form>
	</article>
	<script type="text/javascript">
    var path="<%=path %>";
    </script>
	<script type="text/javascript"
		src="${ctx}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/resources/lib/icheck/jquery.icheck.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/resources/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="${ctx}/resources/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/resources/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="${ctx}/resources/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
	<script type="text/javascript"
		src="${ctx}/resources/lib/jquery.form/3.50/jquery.form.js"></script>
    <script type="text/javascript"
        src="${ctx}/resources/js/register.js"></script>
	
    

</body>
</html>