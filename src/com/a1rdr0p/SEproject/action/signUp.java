package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
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
		// TODO Auto-generated method stub
		
		return SUCCESS;
	}

}
