<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
  String path = request.getContextPath(); 
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path; 
%>
<c:set var="ctx" value="<%=basePath %>"></c:set>
<aside class="Hui-aside" id="menu">
	<div class="menu_dropdown bk_2">
		<dl id="">
			<c:if test="${menus != null}">
				<c:forEach items="${menus}" var="firstMenu">
					<dt>
						<i class="Hui-iconfont">${firstMenu.menuIco} </i>${firstMenu.menuName }<i
							class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
					</dt>
					<c:if test="${firstMenu.children != null}">
						<dd>
							<ul>
								<c:forEach items="${firstMenu.children}" var="secondMenu">
									<li><a _href="${ctx}${secondMenu.menuUrl}"
										data-title="${secondMenu.menuName}" href="javascript:;">${secondMenu.menuName}</a></li>
								</c:forEach>
							</ul>
						</dd>
					</c:if>
				</c:forEach>
			</c:if>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs">
	<a class="pngfix" href="javascript:void(0);"
		onClick="displaynavbar(this)"></a>
</div>