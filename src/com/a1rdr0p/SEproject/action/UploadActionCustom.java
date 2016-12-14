package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import java.util.*;

import com.a1rdr0p.SEproject.model.User;
import com.a1rdr0p.SEproject.service.userService;
import com.opensymphony.xwork2.ActionSupport;

public class UploadActionCustom extends ActionSupport {
	private String name;
	private String tableClass;
	private String trClass;
	private String tdClass;
	private String tableCustom;
	private String tableId;
	private String trId;
	private String tdId;
	
	public String getTableClass() {
		return tableClass;
	}
	public void setTableClass(String tableClass) {
		this.tableClass = tableClass;
	}
	public String getTrClass() {
		return trClass;
	}
	public void setTrClass(String trClass) {
		this.trClass = trClass;
	}
	public String getTdClass() {
		return tdClass;
	}
	public void setTdClass(String tdClass) {
		this.tdClass = tdClass;
	}
	public String getTableCustom() {
		return tableCustom;
	}
	public void setTableCustom(String tableCustom) {
		this.tableCustom = tableCustom;
	}
	public String getTableId() {
		return tableId;
	}
	public void setTableId(String tableId) {
		this.tableId = tableId;
	}
	public String getTrId() {
		return trId;
	}
	public void setTrId(String trId) {
		this.trId = trId;
	}
	public String getTdId() {
		return tdId;
	}
	public void setTdId(String tdId) {
		this.tdId = tdId;
	}
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

    // 声明封装了File上传的FileUploadToolsCustom类的实例
    // FileUploadToolsCustom类也封装了上传的属性及get和set方法
    private FileUploadToolsCustom FileUploadToolsCustom = new FileUploadToolsCustom();
    String qwqresult =  UploadActionCustom.class.getResource("UploadActionCustom.class").toString();
    
    public FileUploadToolsCustom getFileUploadToolsCustom() {
        return FileUploadToolsCustom;
    }
    public void setFileUploadToolsCustom(FileUploadToolsCustom FileUploadToolsCustom) {
        this.FileUploadToolsCustom = FileUploadToolsCustom;
    }

    @Override
    public String execute() throws IOException {
    	System.out.println(qwqresult);
    	FileUploadToolsCustom.beginUpload();
    	
    	userService us = new userService();
    	user = us.findNickname(name);
    	
    	System.out.println("class:"+tableClass);
    	
        return SUCCESS;
    }
}
