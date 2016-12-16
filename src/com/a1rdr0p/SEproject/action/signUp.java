package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.Mail;
import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

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
		if (flag == false) {
			return "notMatch";
		}
		
		int verify = us.newUser(user.getName(), user.getPassword(), user.getNickname(), user.getEmail());
//		System.out.println(user.getName());
//		System.out.println(user.getPassword());
//		System.out.println(verify);
		
		if (verify == 1) {
			ret = SUCCESS;
			sendEmail mail = new sendEmail();
			mail.sendSignUpEmail(user.getName(), user.getPassword(), user.getNickname(), user.getEmail());
			ActionContext.getContext().getSession().put("USERNAME", user.getName());
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
		else if (verify == 106) {
			ret = "nicknameExist";
		}
		else {
			ret = ERROR;
		}
		return ret;
	}

}