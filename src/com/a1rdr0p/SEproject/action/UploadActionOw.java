package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import java.util.*;
import com.opensymphony.xwork2.ActionSupport;

public class UploadActionOw extends ActionSupport {
    public static final long serialVersionUID = 1;

    // 声明封装了File上传的FileUploadToolsOw类的实例
    // FileUploadToolsOw类也封装了上传的属性及get和set方法
    private FileUploadToolsOw FileUploadToolsOw = new FileUploadToolsOw();
    String qwqresult =  UploadActionOw.class.getResource("UploadActionOw.class").toString();
    
    public FileUploadToolsOw getFileUploadToolsOw() {
        return FileUploadToolsOw;
    }
    public void setFileUploadToolsOw(FileUploadToolsOw FileUploadToolsOw) {
        this.FileUploadToolsOw = FileUploadToolsOw;
    }

    @Override
    public String execute() throws IOException {
    	System.out.println(qwqresult);
    	FileUploadToolsOw.beginUpload();
    	
        return SUCCESS;
    }
}
