$(function(){
	$("#form-addUser").validate({
		rules:{
			userName:{
				required:true,
				minlength:2,
				maxlength:16,
				remote: {
				    url: path +"/checkUserName.htm",     //后台处理程序
				    type: "post",               //数据发送方式
				    dataType: "json",           //接受数据格式   
				    data: {                     //要传递的数据
				        userName: function() {
				            return $("#userName").val();
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
			realName:{
				required:true
			},
			mobile:{
				required:true,
				isMobile:true,
			},
			email:{
				required:true,
				email:true,
			}
			
		},
		messages: { 
            'userName': {
                remote:"该账号已存在！"
            }
        },
		success:"valid",
		submitHandler:function(form){
			var param = $("#form-addUser").serialize();
			var userType = $("#userType").val();
			var url = path + "/manager/addUser.htm?userType=" + userType;
			$.ajax({
				url : url,
				type : "post",
				dataType : "json",
				data: param,
				success : function(result) {					
					if(result==true) {
						loadPage(path + "/manager/getUsers?userType=" + userType);
					} else {
						alert("添加失败！")
					}
				}
			});
        } 
	});
});