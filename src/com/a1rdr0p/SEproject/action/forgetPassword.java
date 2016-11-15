package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.security.MD5;
import com.a1rdr0p.SEproject.service.generateRandomPassword;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.Action;

/**
 * @author Loj
 *
 */
public class forgetPassword implements Action {
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String execute() throws Exception {
		if (user.getName().equals(""))
			return "nullName";
		if (user.getEmail().equals(""))
			return "nullEmail";
		
		userService us = new userService();
		
		User tmp = us.findUser(user.getName());
		if (tmp == null)
			return "notExist";
		
		boolean flag = tmp.getEmail().equals(user.getEmail());
		if (flag == false)
			return "wrongEmail";
		
		generateRandomPassword gen = new generateRandomPassword();
		String ranPassword = gen.genRandomNum(8);
		if (flag == true) {
			us.updatePassword(tmp.getName(), ranPassword);
			sendEmail mail = new sendEmail();
			mail.sendRandomPassword(tmp.getName(), ranPassword, tmp.getNickname(), tmp.getEmail());
			return SUCCESS;
		}
		
		return ERROR;
	}

}
