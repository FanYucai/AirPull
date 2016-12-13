package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.stringService;
import com.opensymphony.xwork2.Action;

public class saveTable implements Action {
	private User user;
	private String string;
	private String type;
	
	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}

	public String getString() {
		return string;
	}


	public void setString(String string) {
		this.string = string;
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
		
		int flag = ss.insertString(user.getName(), type, string);
		if (flag == 110) {
			
			return "exist";
		} else if (flag == 1) {
			return SUCCESS;
		} else {
			return ERROR;
		}
		
	}

}
