package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import java.util.*;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.ActionSupport;

public class UploadActionJiaowuchu2 extends ActionSupport {
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
    private FileUploadToolsJiaowuchu2 FileUploadToolsJiaowuchu2 = new FileUploadToolsJiaowuchu2();
    String qwqresult =  UploadActionJiaowuchu2.class.getResource("UploadActionJiaowuchu2.class").toString();
    
    public FileUploadToolsJiaowuchu2 getFileUploadToolsJiaowuchu2() {
        return FileUploadToolsJiaowuchu2;
    }
    public void setFileUploadToolsJiaowuchu2(FileUploadToolsJiaowuchu2 FileUploadToolsJiaowuchu2) {
        this.FileUploadToolsJiaowuchu2 = FileUploadToolsJiaowuchu2;
    }

    @Override
    public String execute() throws IOException {
    	System.out.println(qwqresult);
    	FileUploadToolsJiaowuchu2.beginUpload();
    	
    	userService us = new userService();
    	user = us.findNickname(name);
        return SUCCESS;
    }
}
