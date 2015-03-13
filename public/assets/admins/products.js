$(function(){
	$(".single").on("click",function(){
		var $elem = $(this);
		var is_single = $elem.attr("data-is-single");
		var id = $elem.attr("data-id");
		var sub_single = is_single == "0" ? 1 : 0;
		$.ajax({
			method: "put",
			data: {"is_single": sub_single},
			url: "/admins/products/"+id+"/show_state",
			success: function(rest){
				stateFunction(sub_single,$elem,"data-is-single")
			},
			error:function(rest){}
		})
	});

	$(".recommend").on("click",function(){
		var $elem = $(this);
		var is_single = $elem.attr("data-is-recommend");
		var id = $elem.attr("data-id");
		var sub_single = is_single == "0" ? 1 : 0;
		$.ajax({
			method: "put",
			data: {"is_recommend": sub_single},
			url: "/admins/products/"+id+"/show_state",
			success: function(rest){
				stateFunction(sub_single,$elem,"data-is-recommend")
			},
			error: function(rest){}
		})
	});

	$(".show-left").on("click",function(){
		var $elem = $(this);
		var is_show_left = $elem.attr("data-is-show-left");
		var id = $elem.attr("data-id");
		var sub_single = is_show_left == "0" ? 1 : 0;
		$.ajax({
			method: "put",
			data: {"is_show_left": sub_single},
			url: "/admins/products/"+id+"/show_state",
			success: function(rest){
				stateFunction(sub_single,$elem,"data-is-show-left")
			},
			error: function(rest){}
		})
	});

	$(".status").on("click",function(){
		var $elem = $(this);
		var status = $elem.attr("data-status");
		var id = $elem.attr("data-id");
		var sub_single = status == "0" ? 1 : 0;
		var text = status == "0" ? "上架" : "下架";
		var td_text = status == "0" ? "否": "是"
		$.ajax({
			method: "put",
			data: {"status": sub_single},
			url: "/admins/products/"+id+"/show_state",
			success: function(rest){
				$elem.text(text);
				$elem.attr("data-status", sub_single);
				$elem.parents("td").siblings()[3].innerText=td_text;
			},
			error: function(rest){}
		})
	});

	var stateFunction = function(status,$elem,attr){
		var text = status == "0" ? "显示" : "隐藏"
		var klass = status == "0" ? "btn-default" : "btn-danger"
		$elem.attr(attr,status);
		$elem.html(text);
		$elem.removeClass("btn-default btn-danger");
		$elem.addClass(klass);
	}
});