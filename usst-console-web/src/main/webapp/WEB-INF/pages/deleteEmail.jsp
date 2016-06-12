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
<title>已删除</title>
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
				邮件管理 <span class="c-gray en">&gt;</span> 已删除 <a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新"><i
					class="Hui-iconfont">&#xe68f;</i></a>
			</nav>
			<div class="page-container">
				<div class="cl pd-5 mt-20">
					<span class="l"> <a _href="${ctx}/clearAll.htm"
						href="javascript:;" class="btn btn-success radius"> <i
							class="Hui-iconfont">&#xe609;</i> 清空全部
					</a>
					</span>
				</div>
				<div class="mt-20">
					<table
						class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">
								<th width="50">序号</th>
								<th width="80">收件人</th>
								<th width="80">发送人人</th>
								<th width="100">标题</th>
								<th width="90">正文</th>
								<th width="150">发送时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${emails}" var="email">
								<tr class="text-c">
									<td>1</td>
									<td>${email.senderName}<${email.senderEmail}></td>
									<td>${email.receiverName}<${email.receiverEmail}></td>
									<td>${email.title }</td>
									<td>${email.content }</td>
									<td>${email.createOn }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	$(document).ready(function(){
		var serviceScriptArr = ["${ctx}/resources/js/commonDataTable.js"];
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





