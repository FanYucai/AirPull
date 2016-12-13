package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import java.util.*;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.ActionSupport;

public class UploadActionTaobao extends ActionSupport {
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

    // 声明封装了File上传的FileUploadToolsTaobao类的实例
    // FileUploadToolsTaobao类也封装了上传的属性及get和set方法
    private FileUploadToolsTaobao FileUploadToolsTaobao = new FileUploadToolsTaobao();
    String qwqresult =  UploadActionTaobao.class.getResource("UploadActionTaobao.class").toString();
    
    public FileUploadToolsTaobao getFileUploadToolsTaobao() {
        return FileUploadToolsTaobao;
    }
    public void setFileUploadToolsTaobao(FileUploadToolsTaobao FileUploadToolsTaobao) {
        this.FileUploadToolsTaobao = FileUploadToolsTaobao;
    }

    @Override
    public String execute() throws IOException {
    	System.out.println(qwqresult);
    	FileUploadToolsTaobao.beginUpload();
    	
    	userService us = new userService();
    	user = us.findNickname(name);
    	
        return SUCCESS;
    }
}
