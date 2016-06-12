
$(function(){

	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-user-reginster").validate({
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
            form.submit();
        } 
	});
});