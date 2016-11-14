package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.opensymphony.xwork2.Action;

public class backHomeLogged implements Action {
	private String name;
	private User user;

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}

}
