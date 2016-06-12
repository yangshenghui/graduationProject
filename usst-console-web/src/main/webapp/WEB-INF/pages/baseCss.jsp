<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
  String path = request.getContextPath(); 
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; 
%>
<c:set var="ctx" value="<%=basePath %>"></c:set>
<script type="text/javascript">
	var path="<%=basePath %>";
</script>

<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx}/resources/lib/html5.js"></script>
<script type="text/javascript" src="${ctx}/resources/lib/respond.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/static/h-ui/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/static/h-ui/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<script type="text/javascript"
	src="${ctx}/resources/lib/jquery/1.9.1/jquery.min.js"></script>