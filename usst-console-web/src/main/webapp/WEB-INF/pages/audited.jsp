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
<title>审核文章</title>
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
				<span id="menuParentText">文章管理</span> <span class="c-gray en">&gt;</span>
				审核文章 <a class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新">
					<i class="Hui-iconfont">&#xe68f;</i>
				</a>
			</nav>
			<article class="page-container">
				<div style="width: 80%; margin: auto; border-bottom: 1px solid #ddd">
					<input type="hidden" id="articleId" value="${article.id}">
					<p style="text-align: center; font-size: 30px;">
						${article.articleTitle }</p>
					<div
						style="text-align: center; font-size: 16px; color: #9C7825; margin-bottom: 15px; margin-top: 17px;">
						<c:choose>
							<c:when test="${article.articleStatus == 'PUBLISH' }">
								<td><span class="label label-success radius">已发表</span></td>
							</c:when>
							<c:when test="${article.articleStatus == 'AUDITING' }">
								<td><span class="label label-success radius">审核中</span></td>
							</c:when>
							<c:otherwise>
								<td><span class="label label-defaunt radius">已拒绝</span></td>
							</c:otherwise>
						</c:choose>
						<span>&nbsp;&nbsp;&nbsp;关键词：${article.typeName }&nbsp;&nbsp;&nbsp;</span>
						<span>类型：${article.articleKey }&nbsp;&nbsp;&nbsp;</span> <span>作者：${article.articleAuthor }&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<span>提交时间：${article.createOn }</span>
					</div>
					<c:if
						test='${article.articleDigest != null && article.articleDigest !=""}'>
						<p style="font-size: 18px; color: #9C7825;">摘要</p>
						<div>${article.articleDigest}</div>
					</c:if>
					<div style="margin-top: 40px;">${article.articleContent}</div>
				</div>
			</article>
			<article style="width: 76%; margin: auto; margin-bottom: 60px;">
				<p style="font-size: 20px; color: #091F06;">评价与建议：</p>
				<div class="row cl">
					<div class="formControls col-xs-8 col-sm-9">
						<textarea name="opinion" id="opinion" cols="" rows=""
							class="textarea" placeholder="说点什么...最少输入10个字符"
							onKeyUp="textarealength(this,200)"></textarea>
						<p class="textarea-numberbar">
							<em class="textarea-length">0</em>/200
						</p>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-sm-9"
						style="margin-top: 20px;">
						<button class="btn btn-primary radius" id="audited">
							<i class="Hui-iconfont">&#xe6e1;</i> 提交
						</button>
					</div>
				</div>
			</article>

		</div>
	</section>
	<script type="text/javascript">
	var serviceScriptArr = ["/js/audited.js"];
	for(var i in serviceScriptArr){
		var script=document.createElement("script");  
		script.type="text/javascript";  
		script.src="${ctx}/resources" + serviceScriptArr[i];  
		$('body').append(script);  
	}		
</script>
</body>
</html>
