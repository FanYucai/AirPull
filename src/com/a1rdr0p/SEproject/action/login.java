package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.Action;

/**
 * @author Loj
 *
 */
public class login implements Action {
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
		
		
		return SUCCESS;
	}

}
