$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": []} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[]}// 制定列不参与排序
		]
	});
});