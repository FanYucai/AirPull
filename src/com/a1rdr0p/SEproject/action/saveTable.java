package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.stringService;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.Action;

public class saveTable implements Action {
	private User user;
	private String name;
	private String fan3dog;
	private String type;
	
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

	public String getFan3dog() {
		return fan3dog;
	}


	public void setFan3dog(String fan3dog) {
		this.fan3dog = fan3dog;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	@Override
	public String execute() throws Exception {
		stringService ss = new stringService();
		userService us = new userService();
		
		user = us.findNickname(name);
		
		int flag = ss.insertString(user.getName(), type, fan3dog);
		if (flag == 110) {
			boolean bool = ss.updateString(user.getName(), type, fan3dog);
			if (bool == true)
				return SUCCESS;
			else 
				return ERROR;
		} else if (flag == 1) {
			return SUCCESS;
		} else {
			return ERROR;
		}
		
	}

}
