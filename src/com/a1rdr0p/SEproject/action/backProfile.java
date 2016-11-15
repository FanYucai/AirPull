package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.Action;

public class backProfile implements Action {
	private User user;
	private String name;

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

	@Override
	public String execute() throws Exception {
		userService us = new userService();
		
		user = us.findNickname(name);
		return SUCCESS;
	}

}
