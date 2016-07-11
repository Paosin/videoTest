<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新用户注册</title>
        <link href="/videoTest/style/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
		function hideURLbar(){ window.scrollTo(0,1); }
		 </script>
  </head>
  
  <!-- Jquery -->
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>


  <script type="text/javascript">
	function validateUser() {
		//javascript
		var uName = document.getElementById("account").value;
		if (uName=="") {
			alert("请输入用户帐号！");
			return false;
		}

		//jquery
		var password =document.getElementById("password").value;
		if (password=="") {
			alert("请输入密码！");
			return false;
		}

		var email = document.getElementById("email").value;
		if (email == "your@email.com"||email=="") {
			alert("eamil不能为空！请输入.....");
			return false;
		} 

		return true;
	}
</script>
  
  <body>
    <div class="main">
				 <!-----start-main---->
				 <h1>用户注册</h1>
				 <form onsubmit="return validateUser();" action="<%=request.getContextPath()%>/servlet/manageUser" method="post">
							<input type="hidden" name="oprate" value="register">							<div class="lable">
		                     <h4>帐号</h4>	<input type="text" class="text" id="account" name="account" value="Account"   onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" >
		                    </div>
		                    <div class="clear"> </div>
		                    <div class="lable-2">
		                     <h4>密码</h4><input type="password" class="text" id="password" name="password" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
							</div>
							
							<div class="lable-2">
				             <input type="text" class="text" id="email" name="email" value="your@email.com"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'your@email.com';}">
							</div>
							<div class="clear"> </div>
							 <h3>已有帐号？点击此处进行 <span><a href="userLogin.jsp">登录</a> </span></h3>
								 <div class="submit">
									<input type="submit" value="Create account" >
								</div>
				</form>
		<!-----//end-main---->
		</div>
		 <!-----start-copyright---->
   					<div class="copy-right">
						<p> <a href="homepage.jsp" >返回首页</a></p> 
					</div>
				<!-----//end-copyright---->
  </body>
</html>
