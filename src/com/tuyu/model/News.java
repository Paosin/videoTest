package com.tuyu.model;

/**
 * @方法描述 新闻实体
 * @author tuyu
 *
 */
public class News {
	private Integer newsID;
	private String newstitle;
	private String newscontent;
	private String newsType;
	private String  creatTime;
	
	
	public News() {
	}
	public News(Integer newsID, String newstitle, String newscontent,
			 String newsType, String creatTime) {
		this.newsID = newsID;
		this.newstitle = newstitle;
		this.newscontent = newscontent;
		this.newsType = newsType;
		this.creatTime = creatTime;
	}
	public Integer getNewsID() {
		return newsID;
	}
	public void setNewsID(Integer newsID) {
		this.newsID = newsID;
	}
	public String getNewstitle() {
		return newstitle;
	}
	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}
	public String getNewscontent() {
		return newscontent;
	}
	public void setNewscontent(String newscontent) {
		this.newscontent = newscontent;
	}
	public String getNewsType() {
		return newsType;
	}
	public void setNewsType(String newsType) {
		this.newsType = newsType;
	}
	public String getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
	}
}
