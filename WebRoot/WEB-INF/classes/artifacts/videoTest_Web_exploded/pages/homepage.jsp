<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8" />
	<title>金惠家</title>
	<link rel="shortcut icon" type="image/x-icon" href="/videoTest/images/homepage/favicon.ico" />
	<link rel="stylesheet" href="/videoTest/style/homepage/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="/videoTest/style/homepage/flexslider.css" type="text/css" media="all" />
	
	<script src="/videoTest/js/homepage/jquery-1.7.2.min.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
		<script src="/videoTest/js/homepage/modernizr.custom.js"></script>
	<![endif]-->
	<script src="/videoTest/js/homepage/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="/videoTest/js/homepage/functions.js" type="text/javascript"></script>
  </head>
  
  
  <script type="text/javascript">
  $(function(){
  $(".shimin").click(function(){
  var status = document.cookie.split("=")[1];
  if(status!="true" && confirm("您还未进行登录，点击确定进行登录")){
   window.location="userLogin.jsp";
  }
  else if(status=="true"){
  window.location="../servlet/pageChange";
  
  }
  });
  
 
  });
  </script>
  <body>
 
  
  <p>Welcome <%=session.getAttribute("useraccount")%> </p><br>
    <!-- wrapper -->
	<div id="wrapper">
		<!-- shell -->
		<div class="shell">
			<!-- container -->
			<div class="container">
							
				<!-- header -->
				<header class="header">
					<h1 id="logo"><a href="#">Proper</a></h1>
					<nav id="navigation">
						<ul>
							<li>
							   <a href="#">我的金惠家<span></span></a>
							     <ul>
									<li><a href="../pages/adduser.jsp">用户注册</a></li>
									<li><a href="../pages/userLogin.jsp">用户登录</a></li>
									<li><a href="../pages/AdminLogin.jsp">管理员登录</a></li>
									<li><a class="shimin">用户实名认证</a></li>
									<li><a href="#">我的账户信息</a></li>
								</ul>
							</li>
							
							<li>
								<a href="../pages/newsDispaly.jsp">惠家新闻</a>
								
							</li>
							<li>
								<a href="finance.html">惠家金融<span></span></a>
								
							</li>	
                            <li>
								<a href="#">惠家健康<span></span></a>
								<ul>
									<li><a href="health/healthnote.html">健康知识</a></li>
									<li><a href="health/seekHealth.html">健康咨询</a></li>
									<li><a href="health/healthSports.html">健康活动</a></li>
								</ul>
							</li>				
							<li>
								<a href="#">惠家生活<span></span></a>
								<ul>
									<li><a href="life/service.html">家电服务</a></li>
									<li><a href="life/life.html">生活服务</a></li>
								</ul>
							</li>
                            <li><a href="../pages/contact.html">联系客服</a></li>
                            <li>
								<a href="">关于金惠家<span></span></a>
								<ul>
									<li><a href="../pages/introduce.html">入网介绍</a></li>
									<li><a href="../pages/about.html">关于惠家E站</a></li>
								</ul>
							</li>
						</ul>
					</nav>
					<div class="cl">&nbsp;</div>
				</header>
				<!-- end of header -->
				<div class="main">
					<!-- slider -->
					<div class="flexslider">
						<ul class="slides">
							<li>
								<img src="/videoTest/images/homepage/slide-img1.jpg" alt="" />	
							</li>
							<li>
								<img src="/videoTest/images/homepage/slide-img2.jpg" alt="" />
							</li>
							<li>
								<img src="/videoTest/images/homepage/slide-img3.jpg" alt="" />
							</li>
						</ul>
					</div>
					<!-- end of slider -->
					<!-- cols -->
					<section class="cols">
						<div class="col">
							<h3><a href="newsDispaly.jsp">惠家新闻</a></h3>
							<p>金惠家随时随地为您展示您身边社区的大小时事，无论何时何地只要能上网即可方便的浏览，让您足不出户即可掌握最新动态。							</p>
						</div>

						<div class="col">
							<h3><a href="health/healthSports.html">健康活动</a></h3>
							<p>金惠家会定期举行各种与健康有关的活动，帮助居民提高健康意识，加强对健康的认识。</p>
						</div>

						<div class="col">
							<h3><a href="health/seekHealth.html" >健康咨询</a></h3>
							<p>金惠家长期对社区居民提供免费的远程医疗咨询、免费的现场义诊、养生讲座等综合性健康服务，让你感受不一样的健康关怀。						    </p>
						</div>
						<div class="col">
							<h3><a href="health/healthnote.html">健康知识</a></h3>
							<p>金惠家配备医疗级的健康检测设备，为您提供多种身体指标检测。为会员建立个人健康档案，帮您关注健康。</p>
						</div>
						<div class="cl">&nbsp;</div>
					</section>
					<!-- end of cols  -->

					<!-- box -->
					<section class="box">
						<span class="shadow-t"></span>
						<h3>产品展示</h3>
						<div class="cl">&nbsp;</div>
						<!-- entries -->
						<div class="entries">
							<div class="entry">
								<a href="health/order.html"><img src="/videoTest/images/homepage/entry1.png" alt="" /></a>
								<span class="shadow"></span>
							</div>
							<div class="entry">
								<a href="#"><img src="/videoTest/images/homepage/entry2.png" alt="" /></a>
								<span class="shadow"></span>
							</div>
							<div class="entry">
								<a href="#"><img src="/videoTest/images/homepage/entry3.png" alt="" /></a>
								<span class="shadow"></span>
							</div>
							<div class="entry">
								<a href="#"><img src="/videoTest/images/homepage/entry4.png" alt="" /></a>
								<span class="shadow"></span>
							</div>
							<div class="cl">&nbsp;</div>
							<span class="shadow-b"></span>
						</div>	
					<!-- end of entries -->
					<!-- end of services -->

				</div>
				<!-- end of main -->
			</div>
			<!-- end of container -->	
			<div class="footer">
				<nav class="footer-nav">
					<ul>
						<li><a href="homepage.jsp">首页</a></li>
						<li><a href="newsDispaly.jsp">惠家新闻</a></li>
						<li><a href="health/healthnote.html">惠家健康</a></li>
						<li><a href="life/life.html">惠家生活</a></li>
						<li><a href="contact.html">联系客服</a></li>
						<li><a href="about.html">关于金惠家</a></li>
					</ul>
				</nav>
				<p class="copy">Copyright &copy; 2016.FSPC All rights reserved.</p>
			</div>
		</div>
		<!-- end of shell -->
	</div>
	<!-- end of wrappert -->
  </body>
</html>
