package com.a1rdr0p.SEproject.service;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.security.MD5;

public class stringService {
	public static Connection getConn() {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/users?useUnicode=true&characterEncoding=utf-8&useSSL=false";
        String username = "root";
        String password = "louyujing127";
        Connection conn = null;
        try {
            Class.forName(driver);
            conn = (Connection) DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
	
	public static String findString(String name, String type) {
        Connection conn = userService.getConn();
        String sql = "select * from tb";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            
            String tmp = "";
            while(rs.next()){
                if(rs.getString("name").equals(name) && rs.getString("type").equals(type))
                {
                	tmp = rs.getString("string");
                	return tmp;
                }
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
	
	public static int insertString(String name , String type, String string){
//		System.out.println(string);
//		System.out.println("我进来了");
    	if (findString(name, type) != null) {
//    		System.out.println("qwq");
    		return 110;//错误代码110，相应字符串已存在
    	}
//    	System.out.println(type);
//    	System.out.println("hello");
    	Connection conn = userService.getConn();
        String sql = "insert into tb values(?,?,?)";
        PreparedStatement pstmt;
        try {
        	
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1, name);
            System.out.println(type);
            pstmt.setString(2, type);
            pstmt.setString(3, string);
            if (pstmt.executeUpdate()!= 0 ) {
            	pstmt.close();
            	conn.close();
            	return 1;//成功加入字符串
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	return 0;//未知错误
    }
	
	public static boolean updateString(String name, String type, String string) {
    	Connection conn = userService.getConn();
    	
    	String sql = "update tb set string='" + string + "' where name='" + name + "' and type='" + type + "'";
    	PreparedStatement pstmt;
    	try {
	        pstmt = (PreparedStatement) conn.prepareStatement(sql);
	        int i = pstmt.executeUpdate();
//	        System.out.println("resutl:" + i);
	        pstmt.close();
	        conn.close();
	        return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
    	return false;
    }
}
