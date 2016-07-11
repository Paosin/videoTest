<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>newsManage</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!-- 实现全选功能 -->

<script type="text/javascript">
	function selectAll(qx) {
		var deleteID = document.getElementsByName("deleteID");

		for (var i = 0; i < deleteID.length; i++) {
			deleteID[i].checked = qx.checked;

		}

	}
</script>

</head>

<body style="background-image: url('/videoTest/images/newslist.jpg');" >
	<form action="<%=request.getContextPath()%>/NewsServlet" method="post">
		<input type="submit" value="批量删除"> 
		<input type="hidden" value="deleteAll" name="oprate">
		<table border="1">
			<tr>
				<th><input type="checkbox" name="qx" onclick="selectAll(this)" /></th>

				<th>文章ID</th>
				<th>文章标题</th>
				<th>文章内容</th>
				<th>所属栏目</th>
				<th>发布时间</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${newsList}" var="news">
				<tr>
					<td><input type="checkbox" name="deleteID"
						value="${news.newsID }" /></td>
					<td>${news.newsID }</td>
					<td>${news.newstitle }</td>
					<td>${news.newscontent }</td>
					<td>${news.newsType }</td>
					<td>${news.creatTime }</td>
					<td><a
						href="<%= request.getContextPath()%>/NewsServlet?oprate=updatenews&id=${news.newsID } ">编辑</a>|
						<a
						href="<%= request.getContextPath()%>/NewsServlet?oprate=deletenews&id=${news.newsID }">删除</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6"><a href="NewsServlet?pageNumber=1">首页</a> <c:if
						test="${pageNumber>1}">
						<a href="NewsServlet?pageNumber=${pageNumber-1}">上一页</a>
					</c:if> <c:if test="${pageNumber<pageCount}">
						<a href="NewsServlet?pageNumber=${pageNumber+1 }">下一页</a>
					</c:if> <a href="NewsServlet?pageNumber=${pageCount }">尾页</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
