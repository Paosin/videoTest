package com.tuyu.dao;

import com.tuyu.model.News;
import com.tuyu.util.JDBCutil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



 public class NewsDao {
	private PreparedStatement pst;
	private ResultSet resultSet;
	private Statement stmt;
	private Connection conn;

	public PreparedStatement getPst() {
		return pst;
	}

	public void setPst(PreparedStatement pst) {
		this.pst = pst;
	}

	public ResultSet getResultSet() {
		return resultSet;
	}

	public void setResultSet(ResultSet resultSet) {
		this.resultSet = resultSet;
	}

	public Statement getStmt() {
		return stmt;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	
	/**
	 * @方法描述  根据参数 更改新闻信息
	 * @param id 新闻主键
	 * @param newsTitle 新闻标题
	 * @paran newsType 新闻类型
	 * @param newsContent 新闻内容
	 * @return 返回数据库受影响的行数
	 */
	
	public int updateNews(Integer id, String newsTitle,String newsType,String newsContent){
		int row=0;
		JDBCutil db=new JDBCutil();
		try {
			conn = db.getConntion(); // 连接数据库
			String updateNewsSQL="update tbl_news set news_title=?,news_type=?,news_content=? where news_id=?";
			pst=conn.prepareStatement(updateNewsSQL);
			//给各个参数进行赋值
			pst.setObject(1, newsTitle);
			pst.setString(2, newsType);
			pst.setString(3, newsContent);
			pst.setInt(4, id);
			row = pst.executeUpdate();   //执行sql语句，将受影响的行数赋值给row
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("更新新闻出现异常！！");
			e.printStackTrace();
		}finally{
			
			if (resultSet != null) {
				try {
					resultSet.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		
		return row;  //返回数据库受影响的行数
	}
	
	/**
	 * @方法描述 根据新闻ID查询新闻
	 * @prama id 新闻主键
	 * @return 新闻对象
	 */
	public News selectNews(Integer id) {
		
		News news=new News();
		JDBCutil db = new JDBCutil();
		try {
			conn = db.getConntion(); // 连接数据库
			
			String UpdateSQL="select *	from tbl_news where news_id=?";
			pst = conn.prepareStatement(UpdateSQL); //获取statment，执行sql
			pst.setInt(1, id);
			resultSet=pst.executeQuery();
			
			if (resultSet.next()) {
				int newsID = resultSet.getInt("news_id");
				String newstitle = resultSet.getString("news_title");
				String newscontent = resultSet.getString("news_content");
				String newsType = resultSet.getString("news_type");
				String creatTime = resultSet.getString("news_date");
			    news = new News(newsID, newstitle, newscontent, newsType, creatTime);
				
			}
		} catch (Exception ex) {

			System.out.println("新闻展示异常！");
			ex.printStackTrace();
		} finally {//关闭数据库连接
			if (resultSet != null) {
				try {
					resultSet.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return news;
	}
	
	

	/**
	 * @方法描述 删除新闻
	 * @prama id 新闻主键ID
	 * @return 数据库受影响的行数
	 */
	public int deleteNewsByID(Integer id){
		int row=0;
		JDBCutil db=new JDBCutil();
		try {
			conn = db.getConntion(); // 连接数据库
			String deleteNewsSQL="delete from tbl_news where news_id=?";
			pst=conn.prepareStatement(deleteNewsSQL);
			pst.setInt(1, id);  //给参数赋值
			row = pst.executeUpdate();   //执行sql语句
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			if (resultSet != null) {
				try {
					resultSet.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		 return row;
		
	}
	
	/**
	 * @方法描述  获取数据库里的新闻
	 * @param pageNumber 新闻页数
	 * @prama pageSize  每页显示的新闻条数
	 * @return 新闻集合
	 */
	public List<News> getNewsList(Integer pageNumber,Integer pageSize) {
		List<News> newslist = new ArrayList<News>();
		JDBCutil db = new JDBCutil();
		try {
			conn = db.getConntion(); // 连接数据库
			stmt = conn.createStatement(); //获取statment，执行sql
			int startSize =(pageNumber-1)*pageSize;   
			System.out.println("startSize:"+startSize+",  pagesize:"+pageSize);
			resultSet = stmt.executeQuery("select news_id,news_title,news_content,news_type,news_date "
					+ "from tbl_news limit "+startSize+","+pageSize); // 执行sql语句返回结果集并解析
			
			while (resultSet.next()) {
				int newsID = resultSet.getInt("news_id");
				String newstitle = resultSet.getString("news_title");
				String newscontent = resultSet.getString("news_content");
				String newsType = resultSet.getString("news_type");
				String creatTime = resultSet.getString("news_date");
				
				News news = new News(newsID, newstitle, newscontent, newsType, creatTime);
				newslist.add(news);
			}
		} catch (Exception ex) {

			System.out.println("新闻展示异常！");
			ex.printStackTrace();
		} finally {//关闭数据库连接
			if (resultSet != null) {
				try {
					resultSet.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return newslist;
	}

	/**
	 * @方法描述 根据新闻类型查询新闻
	 * @param newsType 新闻类型
	 * @return 新闻集合
	 */
	public List<News> getNewsListByType(String newsType) {
		List<News> newslistByType = new ArrayList<News>();
		JDBCutil db = new JDBCutil();
		try {
			conn = db.getConntion(); // 连接数据库
			stmt = conn.createStatement(); //获取statment，执行sql
			resultSet = stmt.executeQuery("select news_id,news_title,news_content,news_type,news_date "
					+ "from tbl_news limit where news_type="+newsType); // 执行sql语句返回结果集并解析
			
			while (resultSet.next()) {
				int newsID = resultSet.getInt("news_id");
				String newstitle = resultSet.getString("news_title");
				String newscontent = resultSet.getString("news_content");
				String newstype = resultSet.getString("news_type");
				String creatTime = resultSet.getString("news_date");
				
				News news = new News(newsID, newstitle, newscontent, newsType, creatTime);
				newslistByType.add(news);
			}
		} catch (Exception ex) {

			System.out.println("新闻展示异常！");
			ex.printStackTrace();
		} finally {//关闭数据库连接
			if (resultSet != null) {
				try {
					resultSet.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return newslistByType;
	}
	
	/**
	 * @方法描述 获取新闻总条数
	 * @return 最大页数
	 */
	public int getMaxsNewsCount(){
		JDBCutil db=new JDBCutil();
		int count=0;
		try {
			conn =db.getConntion();
			stmt=conn.createStatement();
			resultSet=stmt.executeQuery("select count(news_id) from tbl_news");
			if(resultSet.next()){
				
				count=resultSet.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return count; 
	}
	/**
	 * @方法描述 添加新闻
	 * @param newstitle 新闻标题
	 * @param newscontent 新闻内容
	 * @praam newstype  新闻类型
	 * @return 数据库受影响的行数
	 */
	@SuppressWarnings("deprecation")
	public int addNews(String newstitle,String newscontent,String newstype){
		
		int row=0;  //返回数据库受影响的行数
		JDBCutil db=new JDBCutil();
		try {
			conn = db.getConntion(); // 连接数据库
			String addNewsSQL="insert into tbl_news(news_title,news_content,news_type,news_date) values(?,?,?,?)";
			pst=conn.prepareStatement(addNewsSQL);
			pst.setObject(1, newstitle);
			pst.setString(2, newscontent);
			pst.setString(3, newstype);
			pst.setString(4, "2016-6-26");
			row = pst.executeUpdate();   //执行sql语句
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			if (resultSet != null) {
				try {
					resultSet.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		 return row;
		
	}
}
	
