
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>新闻发布</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="ueditor/editor_config.js"></script>
<script type="text/javascript" src="ueditor/editor_all.js"></script>
</head>

<body style="background-image: url('/videoTest/images/addnews.gif');">
	<form action="<%=request.getContextPath()%>/NewsServlet" method="post">

		<!--用value=addnews 传给servlet  便于让servlet判断做什么请求操作 -->
		<input type="hidden" name="oprate" value="addnews" />

		<p align="justify" ><b><font size=4>新闻标题</font></b></p>
		<input type="text" name="newstitle" placeholder="请输入标题" style="width: 50%" /><br />
		<h3>新闻类型</h3>
		<select name="newstype">
			<option value="娱乐新闻">娱乐新闻</option>
			<option value="社会新闻">社会新闻</option>
			<option value="体育新闻">体育新闻</option>
			<option value="经济新闻">经济新闻</option>
			<option value="国际新闻">国际新闻</option>
			<option value="军事新闻">军事新闻</option>
		</select> <br />
		<p align="center"><b><big>新闻内容</big></b></p>
		<br>
		<FCK:editor instanceName="newscontent" height="300pt" width="100%" 
			basePath="/fckeditor">
		</FCK:editor>

		<input type="submit" value="发布">
	</form>
</body>
</html>
