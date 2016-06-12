$(function(){
	$("tr:gt(0)").each(function(){
		var id = $(this).attr("id");
		var td_a = $(this).find("td:eq(6)").find("a");
		var url = td_a.attr("_href");
		var nextArticle = $(this).next();
		var nextArticleId = nextArticle.attr("id");
		var preArticle = $(this).prev();
		var preArticleId = preArticle.attr("id");
        var newUrl = url + "&nextArticleId=" + nextArticleId + "&preArticleId=" + preArticleId;
        td_a.attr("_href",newUrl);            
	});
});