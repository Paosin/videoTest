<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员登录</title>
<!-- Custom Theme files -->
<link href="../style/adminLoginstyle.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--Google Fonts-->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<!--Google Fonts-->
</head>

<body>
	<h1>管理员登录</h1>
	<div class="login">
		<div class="rib"></div>
		<form action="<%=request.getContextPath()%>/servlet/manageUser" method="post">
			<input type="hidden" name="oprate" value="adminLogin">
			<input type="text" name="account" value="Account" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Account';}">
			<input type="password" name="password" value="password" onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'password';}"> <input
				type="submit" value="登录">
		</form>
	</div>
	<div class="copyright">
		<p>
		    <a href="../pages/homepage.jsp" >
				返回首页</a>
		</p>
	</div>
</body>
</html>
