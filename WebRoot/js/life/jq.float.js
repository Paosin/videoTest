(function($) { 
    $.fn.jqFloat = function(o) {
        o = $.extend({
			top:0,
			bottom:0,
            left:0,
            right:0,
            minScreenW:0,//出现浮动窗口的最小屏幕宽度，当屏幕分辨率小于此，将不出现
            position:"left",
            allowClose:true, //是否允许关闭 
			autoHideCloseBtn:true
        }, o || {});
		var showAd=true;
		var fDiv=$(this);
		if(o.minScreenW>=$(window).width()){
			fDiv.hide();
			showAd=false;
		}
		else{
			fDiv.css("display","block")
			var closeHtml='<span style="width:13px; height:12px; display:none; overflow:hidden; text-align:center; padding:1px 0 0; position:absolute; right:5px; top:5px; border:1px solid #000; color:#000; cursor:pointer; font-size:14px; line-height:14px;" class="closeFloat">X</span>';
			
			if(o.position=="left"){
                fDiv.css("left",o.left);
			}else{
				fDiv.css("right",o.right);
            };
			if(o.allowClose){
			   fDiv.prepend(closeHtml)
			   $(".closeFloat",fDiv).click(function(){$(this).hide();fDiv.hide();showAd=false;})
			   if(o.autoHideCloseBtn){
				   fDiv.hover(function(){
						$(this)	.children(".closeFloat").show();
					},
					function(){
						$(this)	.children(".closeFloat").hide();
					})
				}else{
					$(this)	.children(".closeFloat").css("display","block");
				}
			}
			fDiv.css({position:"fixed",overflow:"hidden"});
			if(o.top!=0){
				fDiv.css("top",o.top);
			}else{
				if(o.bottom!=0){
					fDiv.css("bottom",o.bottom);
				}else{
				fDiv.css("top","60px");
				}
			}
        };
        function lrjFloat(){
			fDiv.stop();
            if(!showAd){return}
            var windowTop=$(window).scrollTop();
            if(fDiv.css("display")!="none"){
				fDiv.animate({top : o.top+windowTop});
			}
        };
		
		if(document.all){
			if(navigator.userAgent.toLowerCase().match(/msie ([\d.]+)/)[1]=='6.0'||o.float){ 
				fDiv.css("position","absolute");
				lrjFloat();
     			$(window).scroll(lrjFloat);
			}
		}
    }; 
})(jQuery);

