//window.onerror=function(){return true}

var isNull=/^[\s'　']*$/;
var isNumber=/^\-?\d{1,}$/;
var isDate=/^[1-9]\d{3}[\-\/]\d{1,2}[\-\/]\d{1,2}(\s\d{1,2}:\d{1,2}:\d{1,2})?$/;
var isEmail=/^\w+(-\w+)*@\w+(-\w+)*(\.\w+(-\w+)*)+$/

function p(string){
	document.write(string);
}

function $e(str){
	if(str!=""){
		return escape(str)	;
	}
}

function getFla(e){
	var str;
	e=$.extend({
		obj:null,
		width:100,
		height:100,
		wmode:"transparent",
		bgcolor:"",
		allowFullScreen : true,
		autostart:true
	},e);
	str="<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0\" width=\""+e.width+"\" height=\""+e.height+"\">";
	str+="  <param name=\"movie\" value=\""+e.fla_src+"\" />";
	str+="  <param name=\"quality\" value=\"high\" />";
	str+="  <param name=\"wmode\" value=\""+e.wmode+"\" />";
	str+="  <param name=\"allowFullScreen\" value=\""+e.allowFullScreen+"\" />";
	str+="  <param name=\"bgcolor\" value=\""+e.bgcolor+"\" />";
	str+="	<param name=\"FlashVars\" value=\""+e.fla_vars+"\" />";
	str+="  <embed src=\""+e.fla_src+"\" bgcolor=\""+e.bgcolor+"\" allowFullScreen=\""+e.allowFullScreen+"\" autostart=\""+e.autostart+"\" quality=\"high\" wmode=\""+e.wmode+"\" FlashVars=\""+e.fla_vars+"\"  pluginspage=\"http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash\" type=\"application/x-shockwave-flash\" width=\""+e.width+"\" height=\""+e.height+"\"></embed>";
	str+="</object>";
	if(e.obj){
		$(e.obj).html(str);
	}else{
		document.write(str);
	}
}

//自动调整图片大小
function autoResize(obj,maxWidth,maxHeight){
	var oW=$(obj).width();
	var oH=$(obj).height();
	if(oW>maxWidth||oH>maxHeight){
		if((maxWidth/oW)<(maxHeight/oH)){
			$(obj).css({width:maxWidth , height:oH*maxWidth/oW});
		}else{
			$(obj).css({width:oW*maxHeight/oH , height:maxHeight});
		}
		oH=obj.offsetHeight;
	}
	$(obj).css({marginTop:(maxHeight-$(obj).outerHeight())/2 , visibility:"visible"});
}

function getTop(e){ 
	var offset=e.offsetTop; 
	if(e.offsetParent!=null) offset+=getTop(e.offsetParent); 
	return offset; 
} 

function getLeft(e){ 
	var offset=e.offsetLeft; 
	if(e.offsetParent!=null) offset+=getLeft(e.offsetParent); 
	return offset; 
}

//取得一个文件名的扩展名
function getFileExt(fname){
	
	if(!fname) return;
	fname=fname.toLowerCase();
	var temp=String(/\.[^\.]+$/.exec(fname));
	if(temp.indexOf(".")>=0){
		temp=temp.substr(1,temp.length);
	}else{
		temp=""	
	}
	return temp;
}


function request(ele){
	var pars=location.search;
	var pos=pars.indexOf('?');
	if(pos==-1){
		return "";
	}else{
		pars=pars.substring(pos+1);
	}
	var ps=pars.split("&");
	var args=new Object();
	var temp;
	var name,value,index;
	for(var i=0;i<ps.length;i++){
		temp=ps[i]; 
		index=temp.indexOf("=");
		if(index==-1) continue;
		name=temp.substring(0,index);
		value=temp.substring(index+1);
		args[name]=value;
	}
	
	if(args[ele]!=undefined){
		return args[ele];	
	}else{
		return "";
	}
}

var cookie={
	set : function(name,value,Exp){
		Exp=Exp||1;
		var expires  = new Date();
		expires.setTime(expires.getTime() + Exp*24*60*60*1000); //单位：天
		document.cookie=name+"="+$e(value)+";expires="+expires.toGMTString();
	},
	get : function(name){
		var arr=document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
		if(arr!=null){
			return unescape(arr[2]);
		}else{
			return "";
		}
	},
	del : function(name){
		var Exp = new Date();
		Exp.setTime(Exp.getTime() - 1);
		var cval=cookie.get(name);
		if(cval!=null){
			document.cookie=name+"="+cval+";expires="+Exp.toGMTString();
		}
	}
}

function show_time(param){
	param=param||new Object();
	param.obj=param.obj||"";
	param.fmt=param.fmt||"";
	function get_new_time(){
		var s,Y,M,M1,D,D1,hh,hh1,mm,mm1,ss,ss1,week;
		var weekdays=["日","一","二","三","四","五","六"]
		var time=new Date();
		Y=time.getFullYear();
		M=time.getMonth()+1;
		D=time.getDate();
		hh=time.getHours();
		mm=time.getMinutes();
		ss=time.getSeconds();
		week=time.getDay();
		M<10?M1="0"+M:M1=M;
		D<10?D1="0"+D:D1=D;
		hh<10?hh1="0"+hh:hh1=hh;
		mm<10?mm1="0"+mm:mm1=mm;
		ss<10?ss1="0"+ss:ss1=ss;
		if(param.fmt==""){
			s=Y+"年"+M1+"月"+D1+"日?"+hh1+":"+mm1+":"+ss1;
		}else{
			s=param.fmt;
			s=s.replace("YYYY",Y);
			s=s.replace("MM",M1);
			s=s.replace("M",M);
			s=s.replace("DD",D1);
			s=s.replace("D",D);
			s=s.replace("hh",hh1);
			s=s.replace("h",hh);
			s=s.replace("mm",mm1);
			s=s.replace("m",mm);
			s=s.replace("ss",ss1);
			s=s.replace("s",ss);
			s=s.replace("week",week);
			s=s.replace("WEEK",weekdays[week]);
		}
		$(param.obj).each(function(){$(this).html(s)})
	}
	get_new_time()
	setInterval(get_new_time,1000);
}

function showtab(e){
	var func=this;
	init_showtab()

	if(e.tabs.length>0){
		e.tabs.each(function(n){
			$(this)	.on(e.evt,function(){
				if($(this).hasClass(e.className))return;
				func.show_tab(n);
			});
		});
		if(e.show_default){
			this.show_tab(e._default);
		}
	}
	
	function init_showtab(){
		e=$.extend({
			evt:"mouseover",
			className:"hover",
			animate_show:'show()',
			show_default:true,
			_default:0,
			link_attr:"href",
			more_link:null,
			func:null
		},e)

		func.show_tab=function(i){
			var tab=e.tabs.eq(i)
			e.tabs.removeClass(e.className);
			if(e.tab_conts){
				e.tab_conts.stop(true,true).hide();
				eval("e.tab_conts.eq(i)."+e.animate_show);
			}
			tab.addClass(e.className);
			if(e.more_link){
				e.more_link.attr("href",tab.attr(e.link_attr));
			}
			if(typeof e.func=="function"){
				e.func.call(tab,i)	
			}
		}
	}

}


function set_area(e){
	e=$.extend({
		province:"lrj_province",
		city:"lrj_city",
		country:"lrj_country",
		len:3,
		values:["","",""]
	},e);
	city_setup({province:e.province,city:e.city,country:e.country,len:e.len});
	if(e.values[0]!=""&&e.len>0){
		$("#"+e.province).val(e.values[0]);
		e.len>1?change(1):true;
		if(e.values[1]!=""&&e.len>1){
			$("#"+e.city).val(e.values[1]);
			e.len>2?change(2):true;
			if(e.values[2]!=""){
				$("#"+e.country).val(e.values[2]);
			}
		}
	}
}

function set_document_top(){
		if(window.location!=top.location){
		top.location=window.location;	
	}
}

function show_more(e){
	e=$.extend({
		obj:null,
		title:".title",
		content:".content",
		max_height:100
	},e);
	if(!e.obj)return;
	e.obj.each(function(){
		var t=$(e.title,$(this));
		var c=$(e.content,$(this));
		if(c.height()>e.max_height){
			c.css("height",e.max_height)
		}
		t.click(function(){
			c.show();
			remove_body_event(c);
		});
		
		c.hover(function(){
			remove_body_event(c)
			c.show();
		},function(){
			add_body_event(c)	
		});
		$(this).hover(function(){
			remove_body_event(c);
		},function(){
			add_body_event(c);
		});
	});
	function add_body_event(obj){
		$(document.body).one("click",function(){hide_it(obj)})
	}
	function remove_body_event(obj){
		$(document.body).off("click",function(){hide_it(obj)})
	}
	function hide_it(obj){
		obj.hide();
	}
}

function ajax_show_page(page,opt){
	opt=$.extend({
		objID:null,
		url:"?",
		param:"",
		func:null	
	},opt);
	if(!opt.objID)return;
	$.ajax({
		type:"post",
		url:opt.url,
		data:"pindex="+page+"&objID="+escape(opt.objID)+"&url="+escape(opt.url)+"&func="+escape(opt.func)+"&"+opt.param,
		success:function(html){
			$("#"+opt.objID).html(html);
			if(typeof(opt.func)=="function"){
				opt.func.call()
			}
		}	
	})
	
}

function get_verifycode(opt){
	opt=$.extend({
		input_obj:null,
		code_src:"inc/code.asp",
		code_obj:$("#verifycode_image"),
		auto_hide_code:false //失去焦点时隐藏验证码
	},opt);
	if(!opt.input_obj)return;
	
	opt.input_obj.focus(function(){
		if(!opt.code_obj.attr("src")){
			if(opt.input_obj.val()=="点击获取"){
				opt.input_obj.val("");
			}
			show_verifycode();
		}
		if(opt.code_obj.is(":hidden")){
			show_verifycode();	
		}
	});
	if(opt.auto_hide_code){
		opt.input_obj.bind("blur",show=function(){opt.code_obj.hide();});
	}
	
	opt.code_obj.click(show_verifycode)
	
	function show_verifycode(){
		opt.code_obj.attr("src",opt.code_src+"?"+Math.random()).show();
	}
}