package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.Action;

public class goEdit implements Action {
	private String fan4dog;
	private String name;
	private String type;
	private User user;
	
	
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getFan4dog() {
		return fan4dog;
	}


	public void setFan4dog(String fan4dog) {
		this.fan4dog = fan4dog;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	@Override
	public String execute() throws Exception {
		userService us = new userService();
		user = us.findNickname(name);
//		System.out.println("hahah:"+ fan4dog);
		
		return SUCCESS;
	}

}
