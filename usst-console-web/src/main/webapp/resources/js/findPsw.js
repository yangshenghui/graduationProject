$(function(){
	$(".user-info ul li:gt(1)").hide();
	$(document).on('click','#form-next',function(){
		var userName = $("#userName").val();
		console.info(userName);
		$.ajax({
			url : path + "/forgetPsw.htm",
			type : "post",
			dataType : "json",
			data: {"userName":userName},
			success : function(result) {	
				console.info(result.isExist);
				console.info(result.userEmail);
				var isExist = result.isExist;
				if(isExist == true) {
					$("#userNameErro").show();
				} else {
					$(".pross:eq(0)").find(".pross-dir").addClass("pross-dir-bg");
					$(".pross:eq(1)").addClass("pross-ok");
					$("#userEmail").text(result.userEmail);
					$(".user-info ul li:lt(2)").hide();
					$(".user-info ul li:gt(1)").show();
				}
			}
		});		
	});
	$(document).on('click','#form-findPsw',function(){
		var userName = $("#userName").val();
		console.info(userName);
		$.ajax({
			url : path + "/forgetPswEmail.htm",
			type : "post",
			dataType : "json",
			data: {"userName":userName},		
		});	
		$(".pross:eq(1)").find(".pross-dir").addClass("pross-dir-bg");
		$(".pross:eq(2)").addClass("pross-ok");
		$(".user-info ul li:eq(2)").hide();
		$(".user-info ul li:eq(3)").text("您的申请已提交成功，请查看您的邮箱。");
	});
	
	$(document).on({
		change:function(){
			$("#userNameErro").hide();
		},
		focus:function(){
			$("#userNameErro").hide();
		},
		
	},'#userName');
});