$(function(){
	var isAudit = $("#isAudit").val();
	if(isAudit == "1"){
		$("#isPublish").show();
		$("#menuParentText").text("审核管理");
	}else if(isAudit == "1"){
		$("#isPublish").hide();
		$("#menuParentText").text("评审管理");
	}else{
		$("#isPublish").hide();
		$("#menuParentText").text("文章管理");
	}
	
	var isAssign = $("#isAssign").val();
	if(isAssign == "1"){
		var auditor = $("#auditor").val();
		if(auditor){
			$("#assign").show();		
		}else{
			$("#unAssign").show();	
			$.ajax({
				url: path + "/manager/getAuditors.htm",
				type: "POST",
				dataType: "json",
				success: function(data){
					if(data != null){
						$("#auditors option:gt(0)").remove();
						for(var i in data){		
							console.info(data[i].id + data[i].realName)
							var html = '<option value="'+data[i].id+'">'+data[i].realName+'</option>';				
							$("#auditors").append(html);
						}
					}
				}	
			});	
		}
	}
	
	$(document).on('click','#publish',function(){
		var articleId = $("#articleId").val();
		$.ajax({
			url : path + '/manager/publish.htm',
			type : "post",
			dataType : "json",
			data: {"isPublish":"1","articleId":articleId},
			success : function(result) {
				console.info(result);
				if(result=='success') {
					$("#isPublish").hide();
					var url = path + "/manager/publishArticle.htm";
					loadPage(url);
				} else {
					alert("发表失败，联系管理员！");
				}
			}
		});
	});
	
	$(document).on('click','#rejected',function(){
		var articleId = $("#articleId").val();
		$.ajax({
			url : path + '/manager/publish.htm',
			type : "post",
			dataType : "json",
			data: {"isPublish":"0","articleId":articleId},
			success : function(result) {
				console.info(result);
				if(result=='success') {
					$("#isPublish").hide();
					alert("发表成功！");
				} else {
					alert("发表失败，联系管理员！");
				}
			}
		});
	});
	
	$(document).on('click','#assignActicle',function(){
		var articleId = $("#articleId").val();
		var auditorId = $("#auditors option:selected").val();
		$.ajax({
			url : path + '/manager/assignArticle.htm',
			type : "post",
			dataType : "json",
			data: {"auditorId":auditorId,"articleId":articleId},
			success : function(result) {
				console.info(result);
				if(result=='success') {
					window.location.href = path + "/manager/auditingArticle.htm";
				} else {
					alert("分配失败，联系管理员！");
				}
			}
		});
	});
});
