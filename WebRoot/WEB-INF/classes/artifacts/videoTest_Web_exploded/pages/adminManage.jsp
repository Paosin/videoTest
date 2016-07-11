<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>金惠家后台管理</title>
<script language="javascript" src="/videoTest/js/jquery.js"></script>

<style type="text/css">
<style type="text/css">
<!--
* { 
	margin:0px; 
	padding:0px;
}
html, body{	
	height:100%;
	overflow: hidden;

}
html>body{		/*-- for !IE6.0 --*/
	width: auto;
	height: auto;
	position: absolute;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	
}
body {
	border:8px solid #ffffff;
	background-color: #ffffff;min-width:230px;
}
#mainDiv {
	width: 100%;
	height: 100%;
    padding:60px 0px 25px 0px;;
	
	
}
#centerDiv{
	width: 100%;
	height: 100%;
	background-color:#00CCFF;
	padding-left:158px;
}
#mainDiv>#centerDiv{		/*-- for !IE6.0 --*/	
	width: auto;
	height: auto;
	position: absolute;
	top: 56px;
	left: 0px;
	right: 0px;
	bottom: 20px;
	
}
#left{
width:158px;
height:100%;
background:url(../images/back/slide.jpg) repeat-y;
position:absolute;
left:0px;
}
#lhead{
background:url(../images/back/left-head.jpg) left top no-repeat;
height:25px;
	font-size:14px;
	color:#FF9933;
    text-align:center;
	line-height:25px;
}
#right{
width:100%;
height:100%;
background:#ffffff;
position:absolute;
overflow-y:auto;
border:1px #003366 solid;
padding:20px 0 0 10px;
font-size:12px;
font-family:"宋体";
}
#centerDiv>#right{
width:auto;
height:auto;
position:absolute;
top:0px;
right:0px;
left:158px;
bottom:0px;
}
#topDiv{
	width:100%;
	height:56px;
	background:url(../images/back/head-bg.jpg) repeat-x;
	position:absolute;
	top:0px;
	overflow:hidden;
	
}
#topDiv ul{
list-style:none;
font-size:12px;

width:100%;
margin:0;
padding:0;
}
#topDiv ul li{
float:left;
width:15%
}
#topDiv ul li a {
display:block;
width:100%;
height:25px;
line-height:25px;
background:url(../images/back/menu-bg.jpg) repeat-x;
color:#FFFFFF;
direction:none;
text-align:center;
border-bottom:1px #000066 solid;
border:1px #06597D solid;
}
#tmenu{
width:100%;
position:absolute;
left:12%;
bottom:0;
padding-left:15%;
margin-left:-15%;
}
#current{
background:#ccc;
height:25px;
line-height:25px;
margin:-20px 0 0 -10;
overflow:hidden;
}
#bottomDiv{
	width:100%;
	height:20px;
	background:url(../images/back/bottom.jpg) repeat-x;
	position:absolute;
	bottom:0px;
	bottom:-1px;		 /*-- for IE6.0 --*/
}
#left ul{
list-style:none;
font-size:12px;
margin:50px 0 0 8px;
}
#left ul li a{
display:block;
width:140px;
height:25px;
line-height:25px;
background:url(../images/back/menu-bg.jpg) repeat-x;
color:#FFFFFF;
direction:none;
text-align:center;
border-bottom:1px #000066 solid;
border:1px #06597D solid;
}
#left ul li a:hover{

background:url(../images/back/menu-bg.jpg) 0px 25px;
color:#99FFCC;
direction:none;
text-align:center;
border-bottom:1px #000066 solid;
}
#form{
width:80%;
height:99%;
margin:0 auto;
_margin-left:20%;

}
fieldset{
width:100%;
height:50%;
margin:auto auto;
line-height:35px;
padding-left:20PX;
}
fieldset legend {  
    color:#302A2A;  
    font: bold 16px/2 Verdana, Geneva, sans-serif;  
    font-weight: bold;  
    text-align: left;  
    text-shadow: 2px 2px 2px rgb(88, 126, 156);  
}  
.addnews{
cursor: pointer;

}
-->
</style>
  </head>
  
  <body>
   <div id="mainDiv">
	<div id="topDiv">
	<div id="tmenu"><ul>
	<li ><a href="/videoTest/pages/homepage.jsp">首页</a></li>
	<li ><a href="">惠家新闻</a></li>
	<li ><a href="#">用户管理</a></li>
	<li ><a class="newslist">新闻管理</a></li>
	<li ><a href="#">系统管理</a></li>
	</ul></div></div>
	<div id="centerDiv">
	
	<div id="left">
	<div id="lhead">管理菜单</div>
	<ul>
	<li ><a class="addnews" >发布新闻</a></li>
	<li ><a href="#">添加用户</a></li>
	<li ><a class="viewuser">查看用户</a></li>
	</ul>
	</div>
	<div id="right"> 
	<div id="current">&nbsp;&nbsp;&nbsp;&nbsp;当前位置:</div>
<div id="form">
     <fieldset style="width:100%;height: 150%">
    
        <iframe id ="addnews" src="../NewsServlet" width="100%" height="90%"></iframe>
      
		<legend>内容展示:</legend>
     </fieldset>
</div>
</div></div>
	<div id="bottomDiv"></div>
</div>
<script language="javascript">
$("#test1").toggle(function(){$("#test").slideDown()},function(){$("#test").slideUp()})
</script>
<script>
$(function(){

$(".addnews").click(function(){

$("#addnews").attr( "src", "../pages/addNews.jsp");
});
$(".viewuser").click(function(){
$("#addnews").attr( "src", "../pages/userList.jsp#viewuser");

});

$(".newslist").click(function(){

$("#addnews").attr( "src", "../NewsServlet");
});
});



</script>
  </body>
</html>
