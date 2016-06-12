$(function(){
	var userType = $("#userType").val();
	if(userType == "000002"){
		$("title").text("审核员信息");
		$("#pageType").text("审核员信息");
		$("#addUser").show();
	}else{
		$("#title").text("作者信息");
		$("#pageType").text("作者信息");
		$("#addUser").hide();
	}
})
function changeUserStatus(obj,userId){
	console.info("..."+userId);
	var tdStatus = $(obj).parents("tr").find(".td-status").find("span");
	console.info(tdStatus)
	var flag =tdStatus.hasClass("label-success");
	var staus;
	if(flag){
		status = "0";
	}else{
		status = "1";
	}
	$.ajax({
		url : path + "/manager/changeUserStatus.htm",
		type : "post",
		dataType : "json",
		data: {"id":userId,"status":status},
		success : function(result) {
			
			if(result==true) {
				if(flag){
					tdStatus.removeClass("label-success");
					tdStatus.addClass("label-defaunt");
					tdStatus.text("已停用");
					$(obj).parents("tr").find(".td-manage").find("a:first-child").attr("title","启用").html("<i class=\"Hui-iconfont\">&#xe6e1;</i>");
					layer.msg('已停用!',{icon: 5,time:1000});
				}else{
					tdStatus.addClass("label-success");
					tdStatus.removeClass("label-defaunt");
					tdStatus.text("已启用");
					$(obj).parents("tr").find(".td-manage").find("a:first-child").attr("title","停用").html("<i class=\"Hui-iconfont\">&#xe631;</i>");			
					layer.msg('已启用!',{icon: 5,time:1000});
				}
			} else {
				layer.msg('修改失败!',{icon: 5,time:1000});
			}
		}
	});
}

function deleteUser(userId){	
	console.info(userId)
	layer.confirm('确认要删除吗？',function(index){
		loadPage(path + "/manager/deleteUser.htm?id="+userId);
		layer.msg('删除成功!',{icon: 5,time:1000});		
	});	
}