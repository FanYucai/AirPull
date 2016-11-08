/**
 * 
 */
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
/**
 * @User lanxuan
 *
 */
public class userService {
    public static Connection getConn() {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/users";
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
    public static User findUser(String userName) {
        Connection conn = userService.getConn();
        String sql = "select * from user";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            
            User tmp = null;
            while(rs.next()){
                if(rs.getString("name").equals(userName))
                {
                	tmp = new User();
                	tmp.setName(rs.getString("name"));
                	tmp.setPassword(rs.getString("password"));
                	//ServletActionContext.getRequest().setAttribute("display", User);
                }
            }
            return tmp;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static boolean checkPasswordValid(String Password){//检验内容为长度为8位到20位的非纯数字可通过
    	
    	if (Password.length()<8 || Password.length()>20) 
    		return false;
    	
    	boolean checkNum ;
    	checkNum = Password.matches("[0-9]+");
    	System.out.println(checkNum);
    	if (checkNum==true ) 
    		return false;
    	
    	return true;
    }

    public static boolean checkUsernameValid(String userName){//检验内容为用户名须为纯英文字母构成，且长度不大于20
    	
    	if (userName.length()>20) 
    		return false;
    	boolean checkName ;
    	checkName = userName.matches("[a-zA-Z0-9]+");
    	if (checkName == false ) return false;
    	return true;
    }
    
    public static int newUser(String userName , String Password){
    	if (findUser(userName)!=null) 
    		return 110;//错误代码110 ， 账户名已存在
    	if (checkPasswordValid(Password)==false)
    		return 109;//密码不符合规范
    	if (checkUsernameValid(userName)==false)
    		return 108;//用户名不符合规范
    	
    	String MD5PW= MD5.convertMD5(Password);
    	
    	Connection conn = userService.getConn();
        String sql = "insert into user values(?,?)";
        PreparedStatement pstmt;
        try {
        	
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1, userName);
            pstmt.setString(2, MD5PW);
            if (pstmt.executeUpdate()!= 0 )
            	return 1;//成功新建用户
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        System.out.println(userName);
//        System.out.println(MD5PW);
    	return 0;//未知错误
    }
    
    public static boolean checkPassword(String userName, String Password){//检查登录名密码是否正确
    	User tmp = findUser(userName);
    	String ps = MD5.convertMD5(Password);
    	if (ps == tmp.getPassword())
    		return true;
    	return false;
    }
}
