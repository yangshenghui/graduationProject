$(function(){
	$("#form-login").validate({
		success:"valid",
		submitHandler:function(form){
			console.info("...")
			var param = $("#form-login").serialize();
			$.ajax({
				url : path + "/userLogin.htm",
				type : "post",
				dataType : "json",
				data: param,
				success : function(result) {
					console.info(result);
					if(result==true) {
						window.location.href = path +"/index.htm";
					} else {
						$("#erro").show();
					}
				}
			});
        } 
	});
});



