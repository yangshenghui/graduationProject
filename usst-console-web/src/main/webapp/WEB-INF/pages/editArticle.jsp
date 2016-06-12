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
<title>编辑文章</title>
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
				文章管理 <span class="c-gray en">&gt;</span> 编辑文章 <a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新">
					<i class="Hui-iconfont">&#xe68f;</i>
				</a>
			</nav>
			<article class="page-container">
				<form class="form form-horizontal" id="form-article-add">
					<input type="hidden" id="id" name="id" value="${article.id }">
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>文章标题：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text"
								value="${article.articleTitle }" placeholder=""
								id="articleTitle" name="articleTitle">
						</div>
					</div>
					<div class="row cl">
						<input type="hidden" id="type" name="type"
							value="${article.typeName }"> <label
							class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章类型：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<span class="select-box"> <select name="articleType"
								id="articleType" class="select">
									<option value="">请选择文章类型</option>
							</select>
							</span>
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>关键词：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text"
								value="${article.articleKey }" id="articleKey" name="articleKey">
						</div>
					</div>
					<div class="row cl">
						<input type="hidden" id="digest" name="digest"
							value="${article.articleDigest }"> <label
							class="form-label col-xs-4 col-sm-2">文章摘要：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<textarea name="articleDigest" id="articleDigest" cols="" rows=""
								class="textarea" datatype="*20-100" dragonfly="true"
								onKeyUp="textarealength(this,200)"></textarea>
							<p class="textarea-numberbar">
								<em class="textarea-length">0</em>/200
							</p>
						</div>
					</div>
					<%-- <div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章作者：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${article.articleAuthor }" id="articleAuthor" name="articleAuthor">
					</div>
				</div> --%>
					<div class="row cl">
						<div class="hide" id="content">${article.articleContent}</div>
						<%-- <input type="hidden" id="content" name="content" value="${article.articleContent}"> --%>
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>文章内容：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<script id="editor" type="text/plain" name="articleContent"
								style="width: 100%; height: 400px;"></script>
						</div>
					</div>
					<div class="row cl">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
							<button class="btn btn-primary radius" type="submit" id="article">
								<i class="Hui-iconfont">&#xe632;</i> 保存并提交审核
							</button>
							<button class="btn btn-secondary radius" type="submit"
								id="drafts">
								<i class="Hui-iconfont">&#xe632;</i> 保存草稿
							</button>
						</div>
					</div>
				</form>
			</article>
		</div>
	</section>
	<script type="text/javascript">
	var serviceScriptArr = ["/lib/ueditor/1.4.3/ueditor.config.js","/lib/ueditor/1.4.3/ueditor.all.min.js",
	                        "/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js","/js/editArticle.js"];
	for(var i in serviceScriptArr){
		var script=document.createElement("script");  
		script.type="text/javascript";  
		script.src="${ctx}/resources" + serviceScriptArr[i];  
		$('body').append(script);  
	}		
</script>
</body>
</html>
