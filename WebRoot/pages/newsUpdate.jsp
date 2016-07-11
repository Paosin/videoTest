<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'newsUpdate.jsp' starting page</title>
    <script type="text/javascript" src="ueditor/editor_config.js"></script>
<script type="text/javascript" src="ueditor/editor_all.js"></script>
  </head>
  
  <body style="background-image: url('/videoTest/images/addnews.gif');">
		<form action="<%=request.getContextPath()%>/NewsServlet" method="post">
				<input type="hidden" value="updateNews" name="oprate"> 
				<input type="hidden" value="${news.newsID }" name="id">
			<!--用value=updatenews 传给servlet  便于让servlet判断做什么请求操作 -->
		<input type="hidden" name="oprate" value="updatenews" />

		<p align="justify">新闻标题</p>
		<input type="text" name="newstitle" value="${news.newstitle }" style="width:50%" /><br />
		<p align="justify">新闻栏目</p>
		<select name="newstype">
			<option <c:if test="${news.newsType==\"娱乐新闻\" }">selected</c:if> value="娱乐新闻">娱乐新闻</option>
			<option <c:if test="${news.newsType==\"社会新闻\" }">selected</c:if> value="社会新闻">社会新闻</option>
			<option <c:if test="${news.newsType==\"体育新闻\" }">selected</c:if> value="体育新闻">体育新闻</option>
			<option <c:if test="${news.newsType==\"经济新闻\" }">selected</c:if> value="经济新闻">经济新闻</option>
			<option <c:if test="${news.newsType==\"国际新闻\" }">selected</c:if> value="国际新闻">国际新闻</option>
			<option <c:if test="${news.newsType==\"军事新闻\" }">selected</c:if> value="军事新闻">军事新闻</option>
		</select> <br />
		<p align="center">新闻内容</p>
		<br>
		<FCK:editor instanceName="newscontent" height="300pt" basePath="/fckeditor" value="${news.newscontent }"></FCK:editor>

		<input type="submit" value="确定修改">
		
		
		
		
		</form>

  </body>
</html>
