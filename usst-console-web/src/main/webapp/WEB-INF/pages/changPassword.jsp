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
<title>修改密码</title>
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
				个人中心 <span class="c-gray en">&gt;</span> 修改密码<a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px" _href=""
					href="javascript:;" title="刷新" id="fresh"><i
					class="Hui-iconfont">&#xe68f;</i></a>
			</nav>
			<div class="page-container">
				<article class="page-container">
					<form class="form form-horizontal page-register-form"
						id="form-changPsw">
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3"><span
								class="c-red">*</span>旧密码：</label>
							<div class="formControls col-xs-8 col-sm-6">
								<input type="password" class="input-text" value=""
									placeholder="" id="oldUserPsw" name="oldUserPsw">
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3"><span
								class="c-red">*</span>密码：</label>
							<div class="formControls col-xs-8 col-sm-6">
								<input type="password" class="input-text" value=""
									placeholder="" id="userPsw" name="userPsw">
							</div>
						</div>
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3"><span
								class="c-red">*</span>确认密码：</label>
							<div class="formControls col-xs-8 col-sm-6">
								<input type="password" class="input-text" value=""
									placeholder="" id="cofirmPassword" name="cofirmPassword">
							</div>
						</div>
						<div class="row cl">
							<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
								<input class="btn btn-primary radius" type="submit"
									value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
							</div>
						</div>
					</form>
				</article>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	$(document).ready(function(){
		var serviceScriptArr = ["${ctx}/resources/js/changPassword.js"];
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





