$(function(){
	$("#form-changPsw").validate({
		rules:{
			oldUserPsw:{
				required:true,	
				remote: {
				    url: path +"/isRightPsw.htm",     //后台处理程序
				    type: "post",               //数据发送方式
				    dataType: "json",           //接受数据格式   
				    data: {                     //要传递的数据
				    	oldUserPsw: function() {
				            return $("#oldUserPsw").val();
				        }
				    }
				}
			},
			userPsw:{
				required:true,
				minlength:6
			},
			cofirmPassword:{
				required:true,
				minlength:6,
				equalTo:"#userPsw"
			},
			
		},
		success:"valid",
		submitHandler:function(form){
			var newPsw = $("#userPsw").val();
			$.ajax({
				url : path + "/changePsw.htm",
				type : "post",
				dataType : "json",
				data: {"newPsw":newPsw},
				success : function(result) {
					console.info(result);
					if(result==true) {
						alert("修改成功！")
					} else {
						alert("修改失败，联系管理员！")
					}
				}
			});
        } 
	});
});



