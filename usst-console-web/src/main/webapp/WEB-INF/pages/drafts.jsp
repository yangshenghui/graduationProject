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
<title>已发表文章</title>
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
				文章管理 <span class="c-gray en">&gt;</span> 草稿 <a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新"><i
					class="Hui-iconfont">&#xe68f;</i></a>
			</nav>
			<div class="page-container">
				<div class="mt-20">
					<table
						class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">
								<th width="50">序号</th>
								<th width="80">标题</th>
								<th width="100">关键词</th>
								<th width="90">类别</th>
								<th width="100">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${articles}" var="article">
								<tr class="text-c">
									<td>1</td>
									<td>${article.articleTitle }</td>
									<td>${article.articleKey }</td>
									<td>${article.typeName }</td>
									<td class="td-manage"><a style="text-decoration: none"
										href="javascript:;"
										_href="${ctx}/author/editArticle.htm?articleId=${article.id}"
										class="ml-5" title="编辑"> <i class="Hui-iconfont">&#xe6df;</i>
									</a> <a style="text-decoration: none" href="javascript:;"
										_href="${ctx}/author/delete.htm?articleId=${article.id}"
										class="ml-5" title="删除"> <i class="Hui-iconfont">&#xe609;</i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	var serviceScriptArr = ["${ctx}/resources/js/drafts.js"];
	for(var i in serviceScriptArr){
		var script=document.createElement("script");  
		script.type="text/javascript";  
		script.src=serviceScriptArr[i];  
		$('body').append(script);  
	}		
</script>
</body>
</html>





