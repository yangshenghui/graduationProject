$(function(){
	$(document).on('click','#audited',function(){
		var articleId = $("#articleId").val();
		var opinion = $("#opinion").val();
		console.info(opinion)
		if(opinion.trim() == ""){
			alert("请输入对该文章的评价与建议！");
		}else{
			$.ajax({
				url : path + '/auditor/audie.htm',
				type : "post",
				dataType : "json",
				data: {"opinion":opinion,"articleId":articleId},
				success : function(result) {
					console.info(result);
					if(result=='success') {
						$("#isPublish").hide();
						var url = path + "/auditor/audited.htm";
						loadPage(url);
					} else {
						alert("发表失败，联系管理员！");
					}
				}
			});
		}		
	});
});