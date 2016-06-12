<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
	String path = request.getContextPath();
%>
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

<title>忘记密码</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>
<body>
	<div class="header">
		<span class="register">在线期刊文章投稿管理系统</span>
	</div>
	<div class="container container-custom">
		<div class="register-progress clearfix hidden-xs hidden-sm">
			<div class="pross pross-ok">
				<span class="index">1</span>输入登录帐号
				<div class="pross-dir">
					<span class="outside"></span><span class="inside"></span>
				</div>
			</div>
			<div class="pross">
				<span class="index">2</span>找回密码
				<div class="pross-dir">
					<span class="outside"></span><span class="inside"></span>
				</div>
			</div>
			<div class="pross">
				<span class="index">3</span>成功找回
			</div>
		</div>
		<div class="register-info">
			<div class="user-info">
				<div>
					<ul>
						<li>
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-2 col-sm-offset-1"
									style="font-size: 18px; text-align: right;">账号</label>
								<div class="formControls col-xs-8 col-sm-6">
									<input type="text" class="input-text" value="" placeholder=""
										id="userName" name="userName">
								</div>
							</div>
							<div class="prompt-answer" id="userNameErro">
								<span class="alert alert-danger alert-answer"><strong></strong>账号不存在</span>
							</div>
						</li>
						<li>
							<div class="row cl">
								<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-1">
									<input class="btn btn-primary radius" id="form-next"
										type="button" value="&nbsp;&nbsp;下一步&nbsp;&nbsp;">
								</div>
							</div>
						</li>
						<li>
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3 col-sm-offset-1"
									style="font-size: 18px; text-align: right;">你注册的邮箱为</label>
								<div class="formControls col-xs-8 col-sm-4">
									<span id="userEmail" style="color: red"></span>
								</div>
							</div>
						</li>
						<li>
							<div class="row cl">
								<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-1">
									<input class="btn btn-primary radius" id="form-findPsw"
										type="button" value="&nbsp;&nbsp;找回密码&nbsp;&nbsp;">
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
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
	<script type="text/javascript" src="${ctx}/resources/js/findPsw.js"></script>

	<script type="text/javascript">
	var path="<%=path %>";
</script>

</body>
</html>