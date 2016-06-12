<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 
  String path = request.getContextPath(); 
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="resources/lib/html5.js"></script>
<script type="text/javascript" src="resources/lib/respond.min.js"></script>
<script type="text/javascript" src="resources/lib/PIE_IE678.js"></script>
<![endif]-->
<script type="text/javascript">
	var path="<%=basePath %>";
</script>
<link href="resources/static/h-ui/css/H-ui.min.css" rel="stylesheet"
	type="text/css" />
<link href="resources/static/h-ui/css/H-ui.login.css" rel="stylesheet"
	type="text/css" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="resources/lib/Hui-iconfont/1.0.7/iconfont.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>在线期刊文章投稿管理系统</title>
<meta name="keywords" content="">
<meta name="description" content="">
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="header"></div>
	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<form class="form form-horizontal" id="form-login">
				<div class="row cl">
					<label class="form-label col-xs-2"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input id="userName" name="userName" type="text" placeholder="账户"
							class="input-text radius size-L">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-2"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input id="userPsw" name="userPsw" type="password"
							placeholder="密码" class="input-text radius size-L">
					</div>
				</div>
				<!--  <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img src="images/VerifyCode.aspx.png"> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>
      </div> -->
				<!-- <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
        </div>
      </div> -->
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-2">
						<input name="login" type="submit"
							class="btn btn-success radius size-XXL"
							value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
						<!--  <input name="register" type="button" class="btn btn-success radius size-L" value="&nbsp;注&nbsp;&nbsp;&nbsp;&nbsp;册&nbsp;"> -->
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<label style="padding-left: 87px"><a href="toFindPsw.htm">忘记密码</a></label>
						<label style="padding-right: 20px; padding-left: 30px"><a
							href="register.htm">免费注册</a></label>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-5">
						<span id="erro" class="hide" style="color: red;">账号或密码错误</span>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">Copyright USST</div>
	<script type="text/javascript"
		src="resources/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="resources/static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="resources/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="resources/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="resources/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
	<script type="text/javascript" src="resources/js/login.js"></script>
</body>
</html>