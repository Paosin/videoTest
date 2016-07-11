<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../style/newsDispaly.css" rel="stylesheet" type="text/css" media="all" />

  </head>
  
  <body>
   <div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="#">惠家新闻</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li class="active"><a href="#" accesskey="1" title="">社会新闻</a></li>
				<li><a href="#" accesskey="2" title="">国际新闻</a></li>
				<li><a href="#" accesskey="3" title="">体育新闻</a></li>
				<li><a href="#" accesskey="4" title="">娱乐新闻</a></li>
				<li><a href="homepage.jsp" accesskey="4" title="">返回首页</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="banner-wrapper">
	<div id="banner" class="container">
		<p> <b>惠家新闻</b>是中国领先的国际资讯门户,拥有独立采编权的中央重点新闻网站。<b>惠家新闻</b>秉承环球时报的国际视野,力求及时、客观、权威、独立地报道新闻,致力于应用前沿的互联网...</p>
	</div>
</div>
<div id="page-wrapper">
	<div id="page" class="container">
		<div id="content">
			<header>新闻资讯</header>
			<div id="two-column">
			
				<div id="tbox1">
				
					<div class="box-style"> <a href="#"><img src="../images/screenshot01.jpg" width="140" height="105" alt="" /></a>
						<h3>社会新闻</h3>
						<p>新闻中心社会频道,全面展现社会万象、人生百态的栏目,显示新闻、评论与图片等社会资讯。</p>
						<a href="#"></a></div>
					<div class="box-style"> <a href="#"><img src="../images/screenshot02.jpg" width="140" height="105" alt="" /></a>
						
						<h3>国际新闻</h3>
						<p>惠家新闻王牌频道,专门显示国际时事、综述评论及图片的栏目,主要包括环球时报和环球网的最新独家新闻、国际博览、新闻人物、评论分析、媒体聚焦等。</p>
						<a href="#"></a></div>
				</div>
				<div id="tbox2">
					<div class="box-style"> <a href="#"><img src="../images/screenshot03.jpg" width="140" height="105" alt="" /></a>
						<h3>体育新闻</h3>
						<p>惠家体育提供最快速最全面最专业的体育新闻和赛事报道,主要有以下栏目:中国足球、国际足球、篮球、NBA、综合体育、奥运、F1、网球、高尔夫、棋牌、彩票、视频、图片、...</p>
						<a href="#"></a></div>
					<div class="box-style"> <a href="#"><img src="../images/screenshot04.jpg" width="140" height="105" alt="" /></a>
						<h3>娱乐新闻</h3>
						<p>惠家娱乐提供最新娱乐新闻,让您了解一手娱乐新闻、电影、电视、音乐等娱乐资讯,大陆港台明星八卦、明星绯闻、明星写真和明星资料。花边新闻是权威专业娱乐新闻资讯网站。</p>
						<a href="#"></a></div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="copyright" class="container">
	<p>Copyright (c) 2016  All rights reserved. </p>
</div>
  </body>
</html>
