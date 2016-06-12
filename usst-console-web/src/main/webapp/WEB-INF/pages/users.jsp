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
<title>作者信息</title>
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
				用户管理 <span class="c-gray en">&gt;</span> <span id="pageType">作者信息</span><a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新"><i
					class="Hui-iconfont">&#xe68f;</i></a>
			</nav>
			<div class="page-container">
				<input type="hidden" name="userType" id="userType"
					value="${userType }">
				<div class="cl pd-5 bg-1 bk-gray mt-20" id="addUser">
					<span class="l"> <a href="javascript:;"
						_href="${ctx}/manager/toAddUser.htm?userType=${userType }"
						class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i>
							添加用户</a>
					</span>
				</div>
				<div class="mt-20">
					<table
						class="table table-border table-bordered table-hover table-bg table-sort">
						<thead>
							<tr class="text-c">
								<th width="50">序号</th>
								<th width="80">账号</th>
								<th width="100">真实姓名</th>
								<th width="80">手机</th>
								<th width="90">邮箱</th>
								<th width="150">地址</th>
								<th width="100">研究方向</th>
								<th width="100">单位</th>
								<th width="100">状态</th>
								<th width="100">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${users}" var="user">
								<tr class="text-c">
									<td width="50">1</td>
									<td width="80">${user.userName}</td>
									<td width="100">${user.realName}</td>
									<td width="80">${user.mobile}</td>
									<td width="90">${user.email}</td>
									<td width="150">${user.address}</td>
									<td width="100">${user.resDirection}</td>
									<td width="100">${user.company}</td>
									<c:if test="${user.enabled == '1'}">
										<td class="td-status"><span
											class="label label-success radius" id="userStatus">已启用</span></td>
									</c:if>
									<c:if test="${user.enabled == '0'}">
										<td class="td-status"><span
											class="label label-defaunt radius" id="userStatus">已停用</span></td>
									</c:if>
									<td class="td-manage"><c:if test="${user.enabled == '1'}">
											<a style="text-decoration: none"
												onClick="changeUserStatus(this,'${user.id}')"
												href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
										</c:if> <c:if test="${user.enabled == '0'}">
											<a style="text-decoration: none"
												onClick="changeUserStatus(this,'${user.id}')"
												href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>
										</c:if> <a title="删除" href="javascript:;"
										onClick="deleteUser('${user.id}')" class="ml-5"
										style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a>
									</td>
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
		var serviceScriptArr = ["${ctx}/resources/js/commonDataTable.js","${ctx}/resources/js/users.js"];
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





