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
<title>回复邮件</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/css/jquery.autocomplete.css" />
<%@include file="./baseCss.jsp"%>
<script type="text/javascript" src="${ctx}/resources/js/app.js"></script>
</head>
<body>
	<section class="Hui-article-box">
		<div id="iframe_box" class="Hui-article">
			<nav class="breadcrumb">
				<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
				邮件管理 <span class="c-gray en">&gt;</span> 发送邮件<a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新"><i
					class="Hui-iconfont">&#xe68f;</i></a>
			</nav>
			<div class="page-container">
				<article class="page-container">
					<form class="form form-horizontal page-register-form"
						id="form-sendEmail">
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">发送人：</label>
							<div class="formControls col-xs-8 col-sm-6">
								<input type="text" class="input-text" readonly="readonly"
									value="${sender.realName}<${sender.email}>" placeholder=""
									id="sender" name="sender">
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3" for="receiver"><span
								class="c-red">*</span>收件人：</label>
							<div class="formControls col-xs-8 col-sm-6">
								<input id="receiver" readonly="readonly" name="receiver"
									value="${receiver.realName}<${receiver.email}>"
									style="position: relative;" class="input-text">
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3"><span
								class="c-red">*</span>标题：</label>
							<div class="formControls col-xs-8 col-sm-6">
								<input type="text" class="input-text" value="" placeholder=""
									id="title" name="title">
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3"><span
								class="c-red">*</span>正文：</label>
							<div class="formControls col-xs-8 col-sm-6">
								<textarea name="content" id="content" cols="" rows=""
									class="textarea" placeholder="最多输入100个字符" datatype="*20-100"
									dragonfly="true" onKeyUp="textarealength(this,100)"></textarea>
								<p class="textarea-numberbar">
									<em class="textarea-length">0</em>/100
								</p>
							</div>
						</div>
						<div class="row cl">
							<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
								<input class="btn btn-primary radius" type="submit"
									value="&nbsp;&nbsp;发送&nbsp;&nbsp;">
							</div>
						</div>
					</form>
				</article>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	$(document).ready(function(){
		var serviceScriptArr = ["${ctx}/resources/js/sendEmail.js",
		                        "${ctx}/resources/js/jquery.autocomplete.js"];
		for(var i in serviceScriptArr){
			var script=document.createElement("script");  
			script.type="text/javascript";  
			script.src=serviceScriptArr[i];  
			$('body').append(script);  
		}		
	});
</script>
</body>
</html>





