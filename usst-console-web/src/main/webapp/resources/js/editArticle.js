//加载文章类型
function loadArticleTypes(){
	$.ajax({
		url: path + "/author/getDocumentTypes.htm",
		type: "POST",
		dataType: "json",
		success: function(result){
			var data = result.data;
			if(data != null){
				$("#articleType option:gt(0)").remove();
				for(var i in data){		
					var html = '<option value="'+data[i].id+'">'+data[i].typeName+'</option>';				
					$("#articleType").append(html);
					var type = $("#type").val();
					$("#articleType option").each(function(){
						if($(this).text() == type){
							$(this).attr("selected",true);
						}
					})
				}
			}
		}	
	});
}

function formValidation(){
	$("#form-article-add").validate({
		rules:{
			articleTitle:{
				required:true,
				maxlength:30
			},
			articleType:{
				required:true
			},
			articleKey:{
				required:true,
			},
			articleDigest:{
				maxlength:200
			},
			/*articleAuthor:{
				required:true,
			},*/
			articleContent:{
				required:true
			}
			
		},
		success:"valid",
		submitHandler:function(form){
			var id = this.submitButton.id
			console.info(UE.getEditor('editor').getContentTxt())
			if(UE.getEditor('editor').getContentTxt() == ""){
				alert("文章内容不能为空！");
				return false;
			}else{
				var url,afterUrl,				
					param = $("#form-article-add").serialize();
				if(id == "drafts"){
					url = path + "/author/saveDrafts.htm";
					afterUrl = path + "/author/drafts.htm";
				}else{
					url = path + "/author/saveArticle.htm";
					afterUrl = path + "/author/auditingArticles.htm";
				}
			    
			     $.ajax({
					url : url,
					type : "post",
					dataType : "json",
					data: param,
					success : function(result) {
						console.info(result);
						if(result=='success') {
							loadPage(afterUrl);
						} else {
							alert("保存失败，联系管理员！")
						}
					}
				});
			}
        } 
	});
}


$(function(){
	//加载文章类型
	loadArticleTypes();
	var digest = $("#digest").val();
	console.info(digest)
	$("#articleDigest").val(digest);
	//表单验证
	formValidation();
	var content = $("#content").html();
	console.info(content);
	//实例化编辑器
	var opts={
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
	        autoHeightEnabled:false,
	        //后台接受UEditor的数据的参数名称
	        //textarea:"contact_content"
	        //不可编辑状态
	        //readonly:true
	    };
	var ueditor = UE.getEditor("editor",opts);
	ueditor.addListener("ready", function () {
        // editor准备好之后才可以使用
        ueditor.setContent(content);

	});
	
});

