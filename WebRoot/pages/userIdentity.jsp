<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>实名认证</title>
<!-- Custom Theme files -->
<link href="../style/userIdentity.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 日期控件 -->
<script type="text/javascript" src="../js/WebCalendar.js"></script>
</head>

<script type="text/javascript">
	function validateUser() {
		//javascript
		var uName = document.getElementById("name").value;
		if (uName==""||uName=="姓名") {
			alert("请输入姓名！");
			return false;
		}
		var IDcard =document.getElementById("IDcard").value;
		if (IDcard==""||IDcard=="身份证号") {
			alert("请输入身份证号码！");
			return false;
		}

		var birth = document.getElementById("birth").value;
		if (birth == "出生日期"||birth=="") {
			alert("出生日期不能为空！请输入.....");
			return false;
		} 
		var height=document.getElementById("height").value;
		if(height==""||height=="身高"){
			alert("请输入您的身高！")
		}
		var weight=document.getElementById("weight").value;
		if(weight==""||height=="体重"){
			alert("请输入您的体重！")
		}
		var address=document.getElementById("address").value;
		if(address==""||address=="联系地址"){
			alert("请输入联系地址！");
			return false;
		}
		var tel=document.getElementById("tel").value;
		if(tel==""||tel=="电话号码"){
			alert("请输入电话号码！");
			return false;
		}
		return true;
	}
</script>

<body>
	<!--contact form start here-->
	<h1>实名认证</h1>
	<div class="contact">
		<div class="contact-top">
			<h2>Welcome :  <%=session.getAttribute("useraccount") %></h2>
			
		</div>
		<form onsubmit="return validateUser();" action="<%=request.getContextPath()%>/servlet/manageUser" method="post">
		
		  <input type="hidden" name="oprate" value="userIdentify">
		<div class="fiel">
	        	<input type="text" class="user" name="name" id="name" value="姓名"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '姓名';}" /> 
				<input type="text" class="user" name="IDcard" id="IDcard" value="身份证号"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '身份证号';}" /> 
				<input class="user" id="birthDay" name="birthDay" id="birth" value="出生日期"
					type="text" onclick="return SelectDate(this,'yyyy-MM-dd')"
					readonly="readonly" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '出生日期';}" />
					
				<input type="text" class="user" name="height" id="height" value="身高"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '身高';}" /> 
				<input type="text" class="user" name="weight" id="weight" value="体重"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '体重';}" /> 
				<input type="text" class="user" name="hobby" id="hobby" value="爱好(Hobby)"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '爱好';}" /> 
					<input	type="text" class="email Address" name="address" id="address" value="联系地址"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '联系地址';}" /> 
					<input	type="text" class="phone" name="telNumber" id="tel" value="电话号码"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '电话号码';}" />
				<textarea class="text" name="remarks" id="remarks" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '备注';}"> 备注(Remarks) </textarea>
		</div>
		<div class="send">
				<input type="submit" value="Submit" />
		</div>
		</form>
	</div>
	
	<div class="copyright">
		<p>
			点此返回 <a href="homepage.jsp">首页 </a>
		</p>
	</div>
	<!--contact form end here-->
</body>
</html>
