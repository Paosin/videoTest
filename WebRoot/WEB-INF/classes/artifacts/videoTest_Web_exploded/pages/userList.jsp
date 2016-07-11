<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>userList</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background-image: url('/videoTest/images/addnews.gif');">
  <form action="<%=request.getContextPath()%>/servlet/manageUser" method="post">
		<input type="hidden" value="showUserIdentify" name="oprate">
		<table border="1">
			<tr>
				<th>用户帐号</th>
				<th>帐号类型</th>
				<th>用户姓名</th>
				<th>身份证号</th>
				<th>电话号码</th>
				<th>eamil</th>
				<th>出生日期</th>
				<th>身高</th>
				<th>体重</th>
				<th>爱好</th>
				<th>联系地址</th>
				<th>备注</th>
			</tr>
			<c:forEach items="${userList }" var="users">
				<tr>
					<td>${users.account }</td>
					<td></td>
					<td>${users.name }</td>
					<td>${users.IDcard }</td>
					<td>${users.telNumber }</td>
					<td>${users.email }</td>
					<td>${users.brith }</td>
					<td>${users.height }</td>
					<td>${users.weight }</td>
					<td>${users.hobby }</td>
					<td>${users.address }</td>
					<td>${users.remarks }</td>
				/tr>
			</c:forEach>
	
		</table>
		<input type="submit" value="查看">
	</form>
  </body>
</html>
