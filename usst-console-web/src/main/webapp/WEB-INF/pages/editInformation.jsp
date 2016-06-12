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
<title>编辑信息</title>
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
				个人中心 <span class="c-gray en">&gt;</span> 编辑信息 <a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新">
					<i class="Hui-iconfont">&#xe68f;</i>
				</a>
			</nav>
			<div class="page-container">
				<form class="form form-horizontal" id="form-update-information">
					<input type="hidden" value="${user.id }" id="id" name="id">
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-1"><span
							class="c-red">*</span>用户名：</label>
						<div class="formControls col-xs-8 col-sm-6">
							<input type="text" class="input-text" value="${user.userName }"
								id="userName" name="userName">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-1"><span
							class="c-red">*</span>性别：</label>
						<div class="formControls col-xs-8 col-sm-6 skin-minimal">
							<div class="radio-box">
								<input name="sex" type="radio" value="1" id="sex-1"
									<c:if test="${user.sex == '1'}">
							checked
							</c:if>>
								<label for="sex-1">男</label>
							</div>
							<div class="radio-box">
								<input type="radio" id="sex-2" value="0" name="sex"
									<c:if test="${user.sex == '0'}">
							checked
							</c:if>>
								<label for="sex-2">女</label>
							</div>
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-1"><span
							class="c-red">*</span>真实姓名：</label>
						<div class="formControls col-xs-8 col-sm-6">
							<input type="text" class="input-text" value="${user.realName }"
								id="realName" name="realName">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-1"><span
							class="c-red">*</span>手机：</label>
						<div class="formControls col-xs-8 col-sm-6">
							<input type="text" class="input-text" value="${user.mobile }"
								id="mobile" name="mobile">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-1"><span
							class="c-red">*</span>邮箱：</label>
						<div class="formControls col-xs-8 col-sm-6">
							<input type="text" class="input-text" value="${user.email }"
								name="email" id="email">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-1">通讯地址：</label>
						<div class="formControls col-xs-8 col-sm-6">
							<input type="text" class="input-text" value="${user.address }"
								id=address name="address">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-1">研究方向：</label>
						<div class="formControls col-xs-8 col-sm-6">
							<input type="text" class="input-text"
								value="${user.resDirection }" id="resDirection"
								name="resDirection">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-1">单位名称：</label>
						<div class="formControls col-xs-8 col-sm-6">
							<input type="text" class="input-text" value="${user.company }"
								id="company" name="company">
						</div>
					</div>
					<div class="row cl" style="margin-left: 10px; margin-top: 30px;">
						<button class="btn btn-primary radius" type="submit">
							<i class="Hui-iconfont">&#xe632;</i> 保存
						</button>
					</div>
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	var serviceScriptArr = ["${ctx}/resources/js/editInformation.js","${ctx}/resources/lib/jquery.form/3.50/jquery.form.js"];
	for(var i in serviceScriptArr){
		var script=document.createElement("script");  
		script.type="text/javascript";  
		script.src=serviceScriptArr[i];  
		$('body').append(script);  
	}		
</script>
</body>
</html>
