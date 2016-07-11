package com.tuyu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tuyu.dao.NewsDao;
import com.tuyu.model.*;

/**
 * @方法描述 新闻管理
 * @author tuyu
 * @param
 */
public class NewsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private NewsDao newsDao;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		newsDao = new NewsDao();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 设置字符集，以防止传入中文乱码

		String oprate = request.getParameter("oprate"); // 传入判断请求操作

		// 如果该次请求是addnews，则是添加新闻请求
		if ("addnews".equals(oprate)) {
			String newstitle = request.getParameter("newstitle");
			String newscontent = request.getParameter("newscontent");
			String newstype = request.getParameter("newstype");
			/**
			 * 得到值过后则调用添加新闻的方法addNews-dao层
			 */
			int row = newsDao.addNews(newstitle, newscontent, newstype);
			response.sendRedirect("NewsServlet");

		} else if ("deletenews".equals(oprate)) {

			Integer id = Integer.valueOf(request.getParameter("id")); // 得到要删除新闻的ID并强制类型转化
			// 调用deleteNews方法-dao层 进行删除
			int row = newsDao.deleteNewsByID(id);
			response.sendRedirect("NewsServlet");

		} else if ("deleteAll".equals(oprate)) {

			String[] deleteID = request.getParameterValues("deleteID");
			for (String string : deleteID) {
				Integer did = Integer.valueOf(string);
				newsDao.deleteNewsByID(did);
			}
			response.sendRedirect("NewsServlet");

		} else if ("updatenews".equals(oprate)) {

			Integer id = Integer.valueOf(request.getParameter("id"));// 从作用域里获得id
			News news = newsDao.selectNews(id); // 通过id 来查询新闻
			request.setAttribute("news", news); // 将查询到的news对象存到作用域里面
			request.getRequestDispatcher("pages/newsUpdate.jsp").forward(
					request, response); // 将news对象转发到newsUpdate.jsp 进行调用

		} else if ("updateNews".equals(oprate)) {
			Integer id = Integer.valueOf(request.getParameter("id"));
			String newsTitle = request.getParameter("newstitle");
			String newsContent = request.getParameter("newscontent");
			String newsType = request.getParameter("newstype");
			int row = newsDao.updateNews(id, newsTitle, newsType, newsContent);
			response.sendRedirect("NewsServlet");

		} 
		else {// 查询新闻，并显示

			Integer pageNumber = 1;
			Integer pageSize = 5;
			String pn = request.getParameter("pageNumber"); // 得到当前页码
			if (pn != null) {
				pageNumber = Integer.valueOf(pn);
			}
			if (pageNumber <= 1) {
				pageNumber = 1;
			}
			int newsMaxCount = newsDao.getMaxsNewsCount(); // 得到新闻总条数
			int pageCount = newsMaxCount % pageSize == 0 ? newsMaxCount
					/ pageSize : newsMaxCount / pageSize + 1; // 获取新闻最大页数
			System.out.println("pageCount:" + pageCount + "      newsMaxCount:"
					+ newsMaxCount);
			if (pageNumber >= pageCount) {
				pageNumber = pageCount;
			}
			String type = request.getParameter("type");
			// 调用查询新闻集合的方法
			List<News> newsList = newsDao.getNewsList(pageNumber, pageSize);
			List<News> newsListOfWorld=newsDao.getNewsListByType("国际新闻");
			List<News> newsListOfSociety=newsDao.getNewsListByType("社会新闻");
			List<News> newsListOfSports=newsDao.getNewsListByType("体育新闻");
			List<News> newsListOfEntertainment=newsDao.getNewsListByType("娱乐新闻");
			
			// 添加到reque作用域
			request.setAttribute("newsList", newsList);
			request.setAttribute("newsListOfWorld", newsListOfWorld);
			request.setAttribute("newsListOfSociety", newsListOfSociety);
			request.setAttribute("newsListOfSports", newsListOfSports);
			request.setAttribute("newsListOfEntertainment", newsListOfEntertainment);
			
			request.setAttribute("pageNumber", pageNumber);// 把当前显示的页码传过去，方便调用
			request.setAttribute("pageCount", pageCount); // 把新闻最大页数传过去,调用
			// 转发到newslist.jsp页面
			RequestDispatcher req = request
					.getRequestDispatcher("/pages/newsList.jsp");
			req.forward(request, response);
			 req = request.getRequestDispatcher("/pages/newsDiapaly.jsp");
			req.forward(request, response);
			
		}

	}

}
