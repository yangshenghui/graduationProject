$(document).ready(function(){
	initPage();
});

function initPage(){
	$.ajax({
		url: path + '/header.htm',
		cache: false,
		async:false, 
		success: function (header) {
			$('body').prepend(header);
		}
	});
	
	$.ajax({
		url: path + "/menu.htm",
		cache: false,
		async:false, 
		success: function(menu){
			$('#header').after(menu);
		}
	})	
		
	$.ajax({
		url: path + '/baseScript.htm',
        cache: true,
        async:false,
        success: function (baseScript) {
        	console.info("baseScript.htm---1")
            $('head').append(baseScript);
        }
	});
	
	$(document).on('click','a',function(){
		var status = document.cookie.split(";")[0].split("=")[1];
		console.info(status)
		var url = $(this).attr('_href');
		$.ajax({
			url: path + '/getSession.htm',
	        cache: true,
	        async:false,
	        success: function (result) {		        	
	        	console.info(url)
	        	if(result == "true"){
	    			if(url){
	    				loadPage(url);
	    				var stateObject = {"url":url};
	    				var title = "";
	    				var newUrl = url;
	    				history.pushState(stateObject,title,newUrl);
	    			}
	    		}else{
	    			window.location.href = url;
	    		}	
	        }
		});			
	});
	
	window.addEventListener('popstate', function(event) {
		readState(event.state);
	});

	function readState(data){
		if(data.url){			
			loadPage(data.url);
		}
	}
}

function loadPage(url){
	$.get(url,function(data){  
		data=data.slice(data.indexOf('<body>')+6,data.indexOf('</body>'));  
		$("section").remove();  
		$("body script").remove();  
		$("#menu").after(data);
	});	
}


