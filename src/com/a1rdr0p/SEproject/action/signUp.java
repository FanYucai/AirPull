package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.Action;

/**
 * @author Loj
 *
 */
public class signUp implements Action {
	private User user;
	private String verifyPassword;
	
	public String getVerifyPassword() {
		return verifyPassword;
	}


	public void setVerifyPassword(String verifyPassword) {
		this.verifyPassword = verifyPassword;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String execute() throws Exception {
		userService us = new userService();
		String ret = "";
		
		if (user.getName().equals("")) {
			return "nullName";
		} else if (user.getPassword().equals("")) {
			return "nullPassword";
		} else if (verifyPassword.equals("")) {
			return "nullVerify";
		} else if (user.getEmail().equals("")) {
			return "nullEmail";
		} else if (user.getNickname().equals("")) {
			return "nullNickname";
		}
		
		boolean flag = user.getPassword().equals(verifyPassword);
		
		int verify = us.newUser(user.getName(), user.getPassword(), user.getNickname(), user.getEmail());
//		System.out.println(user.getName());
//		System.out.println(user.getPassword());
//		System.out.println(verify);
		if (flag == false) {
			ret = "notMatch";
		}
		else if (verify == 1) {
			ret = SUCCESS;
		}
		else if (verify == 110) {
			ret = "exist";//用户已存在
		}
		else if (verify == 109) {
			ret = "passwordIllegal";
		}
		else if (verify == 108) {
			ret = "nameIllegal";
		}
		else if (verify == 107) {
			ret = "emailExist";
		}
		else {
			ret = ERROR;
		}
		return ret;
	}

}
