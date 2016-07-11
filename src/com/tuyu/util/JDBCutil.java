package com.tuyu.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 数据库操作
 * @author tuyu
 *
 */
public class JDBCutil {
	private static String url = "jdbc:mysql://localhost:3306/huijia_db";
	private static String userName = "root";
	private static String password = "tuyu";
	
	Connection conn=null;

	// 
	public JDBCutil() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception ex) {
			System.out.println("数据库驱动加载异常！！！");
			ex.printStackTrace();
		}
	}
	

/**
 * 连接数据库
 */
	// 连接数据库
	public Connection getConntion() {
		try {
		    conn = DriverManager.getConnection(url, userName, password);
		  
		} catch (SQLException e) {
			System.out.println("数据库连接异常！！！");
			e.printStackTrace();
		}
		  return conn;
	}
	
	
}
