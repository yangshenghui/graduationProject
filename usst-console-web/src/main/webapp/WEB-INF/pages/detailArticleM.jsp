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
			<input type="hidden" id="isAudit" value="${isAudit}"> <input
				type="hidden" id="isAssign" value="${isAssign}"> <input
				type="hidden" id="auditor" value="${auditor}">
			<nav class="breadcrumb">
				<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
				<span id="menuParentText">文章管理</span> <span class="c-gray en">&gt;</span>
				文章详情 <a class="btn btn-success radius r"
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
						<c:if test="${article.articleStatus == 'PUBLISH' }">
							<span>发表时间：${article.lstUpdateOn }</span>
						</c:if>
						<c:if test="${article.articleStatus != 'PUBLISH' }">
							<span>提交时间：${article.createOn }</span>
						</c:if>
					</div>
					<c:if
						test='${article.articleDigest != null && article.articleDigest !=""}'>
						<p style="font-size: 18px; color: #9C7825;">摘要</p>
						<div>${article.articleDigest}</div>
					</c:if>
					<div style="margin-top: 40px;">${article.articleContent}</div>
				</div>
			</article>
			<c:if test="${article.auditorOpinion != null}">
				<article style="width: 76%; margin: auto; margin-bottom: 60px;"
					id="auditorOpinion">
					<p style="font-size: 20px; color: #091F06;">审核员的评价与建议：</p>
					<p style="font-size: 16px; border-bottom: 1px dotted;">${auditor}
						审核于 ${article.lstUpdateOn}</p>
					<div>${article.auditorOpinion}</div>
				</article>
			</c:if>
			<c:if test="${role != 'auditor' }">
				<div style="margin-bottom: 100px;">
					<div class="hide"
						style="margin-left: 12%; font-size: 18px; color: #9C7825;"
						id="assign">
						<span>审核员 ： </span>
						<c:if test="${auditor != 'undefined'}">
							<span>${auditor}</span>
						</c:if>
					</div>
					<div class="hide" style="margin-left: 10%;" id="unAssign">
						<div class="formControls col-xs-8 col-sm-4">
							<span class="select-box"> <select name="auditors"
								id="auditors" class="select">
									<option value="">请选择审核员</option>
							</select>
							</span>
						</div>
						<button class="btn btn-primary radius" id="assignActicle">
							<i class="Hui-iconfont">&#xe6e1;</i> 分配
						</button>
					</div>
				</div>
			</c:if>

			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-4 hide"
				style="margin-bottom: 40px;" id="isPublish">
				<%-- <c:if test="${preArticleId != 'undefined'}">
				<a class="btn btn-secondary radius" _href="${ctx}/manager/detailArticle.htm?articleId=${preArticleId}&isAudit=1" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i>上一篇</a>
			</c:if> --%>
				<button class="btn btn-primary radius" id="publish">
					<i class="Hui-iconfont">&#xe6e1;</i> 发表
				</button>
				<button class="btn btn-primary radius" id="rejected">
					<i class="Hui-iconfont">&#xe6dd;</i> 拒绝
				</button>
				<%-- <c:if test="${nextArticleId != 'undefined'}">			
				<a class="btn btn-secondary radius" _href="${ctx}/manager/detailArticle.htm?articleId=${nextArticleId}&isAudit=1" href="javascript:;">下一篇  <i class="Hui-iconfont">&#xe6d7;</i></a>
			</c:if> --%>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	var serviceScriptArr = ["/js/detailArticleM.js"];
	for(var i in serviceScriptArr){
		var script=document.createElement("script");  
		script.type="text/javascript";  
		script.src="${ctx}/resources" + serviceScriptArr[i];  
		$('body').append(script);  
	}		
</script>
</body>
</html>
