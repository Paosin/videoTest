<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>用户登录</title>
<!-- Custom Theme files -->
<link href="/videoTest/style/loginStyle.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Shade Login Form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script src="style/jquery.min.js"></script>
  </head>
  
  
  <script>var __links = document.querySelectorAll('a');function __linkClick(e) { parent.window.postMessage(this.href, '*');} ;for (var i = 0, l = __links.length; i < l; i++) {if ( __links[i].getAttribute('data-t') == '_blank' ) { __links[i].addEventListener('click', __linkClick, false);}}</script>
<script src="/ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>$(document).ready(function(c) {
	$('.whit-close').on('click', function(c){
		$('.login').fadeOut('slow', function(c){
	  		$('.login').remove();
		});
	});	  
});
</script>
<script src="style/jquery.min.js"></script>


  <body>
  
  <h1>Sign In</h1>
<div class="login">
	<div class="login-top">
		<div class="whit-close"><img src="images/close.png" alt=""></div>
		<h2>FCPC</h2>
	</div>
	<div class="login-bottom">
		<h3>Welcome to FCPC</h3>
	  <form action="<%=request.getContextPath()%>/servlet/manageUser" method="post">
	    <input type="hidden" name="oprate" value="login">
		<input type="text" name="account"  value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}">
		<input type="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
		<h4><a href="#">Forgot Password?</a></h4>
	    <input type="submit" value="Login Now!" />
	  </form>
	</div>
	 <p>还没有帐号吗? 点击此处进行<a href="adduser.jsp">注册 </a></p>
</div>	
<div class="copyright">
	<p> <a href="homepage.jsp" > 返回首页 </a></p>
</div>	

		
  </body>
</html>
