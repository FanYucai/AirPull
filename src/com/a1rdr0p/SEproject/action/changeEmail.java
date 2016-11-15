package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.security.MD5;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.Action;

public class changeEmail implements Action {
	private String name;
	private String oldemail;
	private String newemail;
	private String password;
	private User user;
	

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getOldemail() {
		return oldemail;
	}


	public void setOldemail(String oldemail) {
		this.oldemail = oldemail;
	}


	public String getNewemail() {
		return newemail;
	}


	public void setNewemail(String newemail) {
		this.newemail = newemail;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String execute() throws Exception {
		userService us = new userService();
		if (password.equals(""))
			return "nullPassword";
		else if (oldemail.equals(""))
			return "nullOld";
		else if (newemail.equals(""))
			return "nullNew";
		
		boolean flag;
		user = us.findUser(name);
		String MD5PW = MD5.convertMD5(password);
		if (user.getPassword().equals(MD5PW)) {
			if (user.getEmail().equals(oldemail)) {
				flag = us.updateEmail(user.getName(), newemail);
				if (flag == false)
					return ERROR;
			} else {
				return "wrongEmail";
			}
			
		} else {
			return "wrongPassword";
		}
		
		sendEmail mail = new sendEmail();
		mail.sendChangeEmailEmail(user.getName(), user.getPassword(), user.getNickname(), newemail);
		
		return SUCCESS;
	}

}
