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

<script type="text/javascript"
	src="${ctx}/resources/lib/jquery/1.9.1/jquery.min.js"></script>