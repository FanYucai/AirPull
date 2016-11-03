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
		
		int verify = us.newUser(user.getName(), user.getPassword());
		if (verify == 1) {
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
		else {
			ret = ERROR;
		}
		return ret;
	}

}
