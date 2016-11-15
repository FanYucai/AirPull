package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.security.MD5;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.Action;

/**
 * @author Loj
 *
 */
public class changePassword implements Action {
	private String name;
	private String oldpassword;
	private String newpassword;
	private String verifypassword;
	private User user;
	
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getOldpassword() {
		return oldpassword;
	}


	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}


	public String getNewpassword() {
		return newpassword;
	}


	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}


	public String getVerifypassword() {
		return verifypassword;
	}


	public void setVerifypassword(String verifypassword) {
		this.verifypassword = verifypassword;
	}


	@Override
	public String execute() throws Exception {
		if (oldpassword.equals("")) {
			return "nullOld";
		} else if (newpassword.equals("")) {
			return "nullNew";
		} else if (verifypassword.equals("")) {
			return "nullVerify";
		}
		
		userService us = new userService();
		user = us.findUser(name);
		String MD5PW = MD5.convertMD5(oldpassword);		
		boolean flag = user.getPassword().equals(MD5PW);		
		if (flag == false) {
			System.out.println("wrong");
			return "wrongPassword";//密码错误
		}
		
		flag = us.checkPasswordValid(newpassword);
		if (flag == false) {
			System.out.println("illegal");
			return "illegalPassword";//密码不合法
		}

		flag = newpassword.equals(verifypassword);
		if (flag == false) {
			System.out.println("notsame");
			return "notSame";//两次密码不相同
		}
		
		flag = us.updatePassword(user.getName(), newpassword);
		if (flag == false)
			return ERROR;
		else {
			sendEmail mail = new sendEmail();
			mail.sendChangePasswordEmail(user.getName(), user.getPassword(), user.getNickname(), user.getEmail());
		}
		return SUCCESS;
	}

}
