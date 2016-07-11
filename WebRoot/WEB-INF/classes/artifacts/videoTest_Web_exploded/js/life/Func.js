var Fav={
	AddFavorite : function(){
		var sURL=location.href;
		var sTitle=document.title;
		try{
			window.external.addFavorite(sURL, sTitle);
		}catch (e){
			try{
				window.sidebar.addPanel(sTitle, sURL, "");
			}catch (e){
				alert("加入收藏失败，请使用Ctrl+D进行添加");
			}
		}
	},
	SetHome : function(obj){
		var URL=location.href
		try{
			obj.style.behavior='url(#default#homepage)';obj.setHomePage(URL);
		}
		catch(e){
			if(window.netscape){
				try{
					netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");  
				}catch (e){ 
					alert("此操作被浏览器拒绝！");  
				}
				var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
				prefs.setCharPref('browser.startup.homepage',URL);
			}
		}
	}
}


function flash_cycle(opt){
	opt=$.extend({
		flash_button:"<a href=\"javascript:void(0)\">{@num}</a>",
		action:"fade",
		speed:400,
		flash_title:"",
		flash_image:"",
		flash_url:"",
		flash_thumb:"",
		format:"<a href=\"{@url}\" {@target} title=\"{@title}\" num=\"{@num}\"><img src=\"{@photo}\" /></a>",
		prev:null,
		next:null,
		after:null
	},opt);
	try{
		var flash_image=opt.flash_image
		var flash_url=opt.flash_url
		var flash_title=opt.flash_title
		var flash_thumb=opt.flash_thumb
		if(flash_image=="")return;
		var flash_str="";
		flash_title=flash_title.split("|");
		flash_url=flash_url.split("|");
		flash_image=flash_image.split("|");
		if(flash_thumb){flash_thumb=flash_thumb.split("|");}
		for(var i=0;i<flash_image.length;i++){
			var url,target,temp_str;
			if(flash_url[i]==""||flash_url[i]=="http://"){
				url="javascript:;";
				target=""	
			}else{
				url=flash_url[i];
				target="target='_blank'"	
			}
			temp_str=opt.format;
			temp_str=temp_str.replace(/\{@url\}/g,url).replace(/\{@target\}/g,target).replace(/\{@num\}/g,i);
			temp_str=temp_str.replace(/\{@title\}/g,flash_title[i]).replace(/\{@photo\}/g,flash_image[i]);
			flash_str+=temp_str;
		}
		$(opt.flash_image_container).html(flash_str);
		$.getScript("/js/jquery.cycle.js",function(){
			$(opt.flash_image_container).cycle({
				fx:opt.action,
				ease: 'easeInOutQuint',
				pager: $(opt.flash_switch_container),
				speed:opt.speed,
				pagerEvent:opt.pagerEvent,
				pagerAnchorBuilder: function(i, el) {
					var button=opt.flash_button.replace(/\{@num\}/g,i+1).replace(/\{@url\}/g,el);
					if(flash_thumb){button=button.replace(/\{@thumb\}/g,flash_thumb[i])}
					return button;
				},
				timeout:3000,
				prev:opt.prev,
				next:opt.next,
				after:opt.after
			});
		})
	}catch(e){}	
}

function init_slide_data(opt){
	opt=$.extend({
		obj:$(".content_slide"),
		page_size:4
	},opt);

	opt.obj.each(function(){
		$this=$(this);
		if($this.attr("nodata")!="true"){
			_chongzu($this);
		}
		
		if($("li",$this).length>0){
			if($(".dlist",$this).length>opt.page_size){
				$('.slide',$this).jcarousel({scroll:1});
			}else{
				$('.slide',$this).css("padding-top","25px");
			}
			_add_event($this);
		}

		$(".dlist a").fancybox({
			openEffect	: 'elastic',
			closeEffect	: 'elastic'
		});
	});
	
	function _chongzu(e){
		var classid=e.attr("classid");
		var html="<ul>",str="";
		if(slide_images[classid].length>0){
			for(var i=0;i<slide_images[classid].length;i++){
				if(i%opt.page_size==0&&i!=0){
					html+="<div class=\"clear\"></div></li>";
				}
				if(i%opt.page_size==0){
					html+="<li>";
				}
				var _data=slide_images[classid][i];
				if(_data.indexOf("|")>=0){
					_data=_data.split("|");
					html+="<div class=\"dlist\"><a href=\"\"></a><img src=\""+_data[0]+"\" />"+_data[1]+"</div>";
				}else{
					html+="<div class=\"dlist\"><a href=\"\"></a><img src=\""+_data+"\" /></div>";
				}
				
			}
			html+="<div class=\"clear\"></div></li>";
		}
		html+="</ul>";
		
		$(".slide",e).html(html+"<div class=\"clear\"></div>")
	}
	
	function _add_event(e){
		$(".dlist",e).each(function(){
			var $this=$(this)
			var $a=$("a",$this);
			$a.attr("href",$("img",$this).attr("src"));
			$this.hover(function(){
				$a.show();	
			},function(){
				$a.hide();	
			});
		});
	}
}
