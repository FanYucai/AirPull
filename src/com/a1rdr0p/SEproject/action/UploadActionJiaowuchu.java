package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import java.util.*;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.ActionSupport;

public class UploadActionJiaowuchu extends ActionSupport {
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	private User user;
	
    public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
    public static final long serialVersionUID = 1;

    // 声明封装了File上传的FileUploadToolsJiaowuchu类的实例
    // FileUploadToolsJiaowuchu类也封装了上传的属性及get和set方法
    private FileUploadToolsJiaowuchu FileUploadToolsJiaowuchu = new FileUploadToolsJiaowuchu();
    String qwqresult =  UploadActionJiaowuchu.class.getResource("UploadActionJiaowuchu.class").toString();
    
    public FileUploadToolsJiaowuchu getFileUploadToolsJiaowuchu() {
        return FileUploadToolsJiaowuchu;
    }
    public void setFileUploadToolsJiaowuchu(FileUploadToolsJiaowuchu FileUploadToolsJiaowuchu) {
        this.FileUploadToolsJiaowuchu = FileUploadToolsJiaowuchu;
    }

    @Override
    public String execute() throws IOException {
    	System.out.println(qwqresult);
    	FileUploadToolsJiaowuchu.beginUpload();
    	
    	userService us = new userService();
    	user = us.findNickname(name);
        return SUCCESS;
    }
}
