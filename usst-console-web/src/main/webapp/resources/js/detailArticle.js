//加载文章类型
function loadArticleTypes(){
	$.ajax({
		url: path + "/author/getDocumentTypes.htm",
		type: "POST",
		dataType: "json",
		success: function(result){
			var data = result.data;
			if(data != null){
				for(var i in data){		
					console.info(data[i].id + data[i].typeName)
					var html = '<option value="'+data[i].id+'">'+data[i].typeName+'</option>';
					$("#articleType").append(html);
				}
			}
		}	
	});
}

function formValidation(){
	$("#form-article-detail").validate({
		rules:{
			articleTitle:{
				required:true,
				minlength:6,
				maxlength:16
			},
			articleType:{
				required:true
			},
			articleKey:{
				required:true,
				maxlength:6
			},
			articleDigest:{
				required:true,
				maxlength:20
			},
			articleAuthor:{
				required:true,
			},
			articleContent:{
				required:true
			}
			
		},
		success:"valid",
		submitHandler:function(form){
			console.info(UE.getEditor('editor').getContentTxt())
			if(UE.getEditor('editor').getContentTxt() == ""){
				alert("文章内容不能为空！");
				return false;
			}else{
				form.submit();
			}
        } 
	});
}

function uediteInit1(){
	var articleContent = $("#articleContent").val();
	//实例化编辑器
	var opts1={
	        //定制工具按钮
	        toolbars:[["fullscreen","source","undo","redo","bold","Italic","Underline","|",
	        "StrikeThrough","Horizontal","Date","FontFamily","FontSize","LineHeight","CustomStyle",
	        "JustifyLeft", "JustifyRight", "JustifyCenter","RemoveFormat"]],
	        //获取光标是，是否自动清空初始化数据
	        autoClearinitialContent:false,
	        //是否展示元素路径
	        elementPathEnabled : false,
	        //是否计数
	        wordCount:false,
	        //高度是否自动增长
	        autoHeightEnabled:false
	        //后台接受UEditor的数据的参数名称
	        //textarea:articleContent
	    };
	var editor2 = UE.getEditor("editor",opts1);
	editor2.addListener("ready",function(){
		UE.getEditor("editor").setContent(articleContent);
    });
}

function uediteInit2(){
	var articleContent = $("#articleContent").val();
	//实例化编辑器
	var opts2={
	        //定制工具按钮
	        toolbars:[],
	        //获取光标是，是否自动清空初始化数据
	        autoClearinitialContent:false,
	        //是否展示元素路径
	        elementPathEnabled : false,
	        //是否计数
	        wordCount:false,
	        //高度是否自动增长
	        autoHeightEnabled:false,
	        //后台接受UEditor的数据的参数名称
	        //textarea:articleContent,
	        //不可编辑状态
//	        /readonly:true
	    };
	var editor1 = UE.getEditor("editor",opts2);
	editor1.addListener("ready",function(){
		UE.getEditor("editor").setContent(articleContent);
    });
}


$(function(){
	$('body a').click(function(){
		if($(this).attr('_href')){
			var url = $(this).attr('_href');
			$.ajax({
				url: url,
				cache: false,
				success: function(content){
					$('section').remove();
					$('aside').after(content.substring
							(content.indexOf("<section class=\"Hui-article-box\">"),content.indexOf("</section>")+10));

				}
			})
		}
	})
	var status = $("#articleStatus").val();
	if(status == "PUBLISH" ||status == "AUDITING"){
		uediteInit2();
		$("#operate").hide();
		$("#form-article-detail input").attr("disabled",true);
		$("select").attr("disabled",true);
		$("textarea").attr("disabled",true);
	}else if(status == "REJECTED"){
		loadArticleTypes();
		formValidation();
		uediteInit1();
	}	
});

