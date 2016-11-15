package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
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
		userService us = new userService();
		user = us.findUser(name);
		
		boolean flag = user.getPassword().equals(oldpassword);		
		if (flag == false)
			return "wrongPassword";//密码错误
		
		flag = us.checkPasswordValid(newpassword);
		if (flag == false)
			return "illegalPassword";//密码不合法

		flag = newpassword.equals(verifypassword);
		if (flag == false)
			return "notSame";//两次密码不相同
		
		flag = us.updatePassword(user.getName(), newpassword);
		if (flag == false)
			return ERROR;
		return SUCCESS;
	}

}
