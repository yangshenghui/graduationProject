<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
  String path = request.getContextPath(); 
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; 
%>
<c:set var="ctx" value="<%=basePath %>"></c:set>

<script type="text/javascript"
	src="${ctx}/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/static/h-ui/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/baseScript.js"></script>
