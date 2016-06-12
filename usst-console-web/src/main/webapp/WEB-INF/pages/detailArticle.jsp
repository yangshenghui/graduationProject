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
<title>文章详情</title>
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
				文章管理 <span class="c-gray en">&gt;</span> 文章详情 <a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新">
					<i class="Hui-iconfont">&#xe68f;</i>
				</a>
			</nav>
			<article class="page-container">
				<div style="width: 80%; margin: auto; border-bottom: 1px solid #ddd">
					<p style="text-align: center; font-size: 30px;">
						${article.articleTitle }</p>
					<div
						style="text-align: center; font-size: 16px; color: #9C7825; margin-bottom: 15px; margin-top: 17px;">
						<c:choose>
							<c:when test="${article.articleStatus == 'PUBLISH' }">
								<td><span class="label label-success radius">发表</span></td>
							</c:when>
							<c:when test="${article.articleStatus == 'AUDITING' }">
								<td><span class="label label-success radius">审核中</span></td>
							</c:when>
							<c:otherwise>
								<td><span class="label label-defaunt radius">拒绝</span></td>
							</c:otherwise>
						</c:choose>
						<span>&nbsp;&nbsp;&nbsp;关键词：${article.typeName }&nbsp;&nbsp;&nbsp;</span>
						<span>类型：${article.articleKey }&nbsp;&nbsp;&nbsp;</span> <span>作者：${article.articleAuthor }&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<span>发表时间：${article.createOn }</span>
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
				<c:if test="${article.auditorOpinion != null}">
					<p style="font-size: 20px; color: #091F06;">审核员的评价与建议：</p>
					<p style="font-size: 16px; border-bottom: 1px dotted;">${article.auditorId}
						审核于 ${article.lstUpdateOn}</p>
					<div>${article.auditorOpinion}</div>
				</c:if>
			</article>
		</div>
	</section>
	<script type="text/javascript">
	var serviceScriptArr = ["/lib/ueditor/1.4.3/ueditor.config.js","/lib/ueditor/1.4.3/ueditor.all.min.js",
	                        "/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js","/lib/jquery.validation/1.14.0/jquery.validate.min.js",
	                        "/lib/jquery.validation/1.14.0/validate-methods.js","/lib/jquery.validation/1.14.0/messages_zh.min.js",
	                        "/js/detailArticle.js"];
	for(var i in serviceScriptArr){
		var script=document.createElement("script");  
		script.type="text/javascript";  
		script.src="${ctx}/resources" + serviceScriptArr[i];  
		$('body').append(script);  
	}		
</script>
</body>
</html>
