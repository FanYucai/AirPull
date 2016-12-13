package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.Action;
import org.apache.commons.codec.binary.Base64; 

public class goProfile implements Action {
	private String name;
	private User user;
	private String str1,str2,str3,str4,str5,str6,str7,str8;

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

	public String getStr1() {
		return str1;
	}


	public void setStr1(String str1) {
		this.str1 = str1;
	}


	@Override
	public String execute() throws Exception {
		userService us = new userService();
		str1 = "5qiK{1,1}@5qiK{1,1}$5qiK{1,1}@5qiK{1,1}$";
		str2 = str3 = str4 = str5 = str6= str7 =str8 =str1;
		user = us.findNickname(name);
		System.out.print(str1);
		return SUCCESS;
	}


	public String getStr2() {
		return str2;
	}


	public void setStr2(String str2) {
		this.str2 = str2;
	}


	public String getStr3() {
		return str3;
	}


	public void setStr3(String str3) {
		this.str3 = str3;
	}


	public String getStr4() {
		return str4;
	}


	public void setStr4(String str4) {
		this.str4 = str4;
	}


	public String getStr5() {
		return str5;
	}


	public void setStr5(String str5) {
		this.str5 = str5;
	}


	public String getStr6() {
		return str6;
	}


	public void setStr6(String str6) {
		this.str6 = str6;
	}


	public String getStr7() {
		return str7;
	}


	public void setStr7(String str7) {
		this.str7 = str7;
	}


	public String getStr8() {
		return str8;
	}


	public void setStr8(String str8) {
		this.str8 = str8;
	}
}
