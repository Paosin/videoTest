$(function(){
	$(document.body).append("<a href=\"#\" id=\"scroll_to_top\"></a>");
	$.getScript("js/jq.float.js",function(){
		$("#scroll_to_top").jqFloat({
			position:"right",
			bottom:50,
			right:20,
			allowClose:false
		})
		$('#scroll_to_top').hide();
	})
	
	$(window).scroll(function(){
		if ($(this).scrollTop()>250) {
			$('#scroll_to_top').fadeIn()
		} else {
			$('#scroll_to_top').hide()
		}
	})

});