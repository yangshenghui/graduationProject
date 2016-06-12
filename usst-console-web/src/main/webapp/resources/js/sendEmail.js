$(function(){
	$("#form-sendEmail").validate({
		rules:{
			sender:{
				required:true				
			},
			receiver:{
				required:true,
				remote: {
				    url: path +"/checkUserEmail.htm",     //后台处理程序
				    type: "post",               //数据发送方式
				    dataType: "json",           //接受数据格式   
				    data: {                     //要传递的数据
				        email: function() {
				        	var str = $("#receiver").val()
				        	console.info(str.substring(str.indexOf("<")+1,str.indexOf(">")))
				            return str.substring(str.indexOf("<")+1,str.indexOf(">"));
				        }
				    }
				}
			},
			title:{
				required:true
			},
			content:{
				required:true
			}
			
		},
		messages: { 
            'receiver': {
                remote:"该邮箱不存在！"
            }
        },
		success:"valid",
		submitHandler:function(form){
			var param = $("#form-sendEmail").serialize();
			$.ajax({
				url : path + "/sendEmail.htm",
				type : "post",
				dataType : "json",
				data: param,
				success : function(result) {
					console.info(result);
					if(result==true) {
						console.info("...")
						loadPage(path+"/toSentEmail.htm");
					}else {
						alert("发送失败，联系管理员！")
					}
				}
			});
        } 
	});
	/*var datas = new Array();
	$("#receiver").change(function(){
		var str = $("#receiver").val();
		$.ajax({
			url : path + "/getUsersByFuzzySearch.htm",
			type : "post",
			dataType : "json",
			data: {"str":str},
			success : function(result) {
				console.info(result);
				for(var i in result){
					var item = result[i].email;
					datas.push(item);
				}
				console.info(datas)
				$("#receiver").autocomplete(datas,{
					width: 512,
					max: 4,
					highlight: false,
					multiple: true,
					multipleSeparator: " ",
					scroll: true,
					scrollHeight: 300
				});
			}
		});
	})*/
	$.ajax({
        type: "POST",
        contentType: "application/json",
        url: path + "/getUsersByFuzzySearch.htm",
        data: {"str":""},
        dataType: "json",
        success: function (result) {
        	console.info(result)
        	var datas = new Array();
        	for(var i in result){
				var item = result[i].realName + "<" + result[i].email + ">";
				datas.push(item);
			}
            $("#receiver").autocomplete(datas, {
            	width: 512,
				max: 4,
				highlight: false,
				multiple: true,
				multipleSeparator: " ",
				scroll: true,
				scrollHeight: 300
            });
        }
    });
    /*$("#receiver").autocomplete({
    	source: function( request, response ) {
    		console.info(".."+request.term)
            $.ajax({
            	url : path + "/getUsersByFuzzySearch.htm",
    			type : "post",
    			dataType : "json",
    			data: {"str":request.term},
                success: function( data ) {
                    response( $.map( $.parseJSON(data), function( item ) { // 此处是将返回数据转换为 JSON对象，并给每个下拉项补充对应参数
                        return {
                             // 设置item信息
                             label: item.email,
                             value: item.email,   // 下拉项对应数值
                             code:item.email, // 其他参数， 可以自定义
                             object_id : item.email // 其他参数， 可以自定义</span>
                                                             
                        }
                    }));
                }
            });
        },
        minLength: 2,  // 输入框字符个等于2时开始查询
        select: function( event, ui ) { // 选中某项时执行的操作
            // 存放选中选项的信息
            $("#g_code").val(ui.item.code);
            $("#g_object_id").val(ui.item.object_id);
             
        }
		width: 512,
		max: 4,
		highlight: false,
		multiple: true,
		multipleSeparator: " ",
		scroll: true,
		scrollHeight: 300
	});*/
});
