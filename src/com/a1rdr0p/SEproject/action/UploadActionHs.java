package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import java.util.*;
import com.opensymphony.xwork2.ActionSupport;

public class UploadActionHs extends ActionSupport {
    public static final long serialVersionUID = 1;

    // 声明封装了File上传的FileUploadToolsHs类的实例
    // FileUploadToolsHs类也封装了上传的属性及get和set方法
    private FileUploadToolsHs FileUploadToolsHs = new FileUploadToolsHs();
    String qwqresult =  UploadActionHs.class.getResource("UploadActionHs.class").toString();
    
    public FileUploadToolsHs getFileUploadToolsHs() {
        return FileUploadToolsHs;
    }
    public void setFileUploadToolsHs(FileUploadToolsHs FileUploadToolsHs) {
        this.FileUploadToolsHs = FileUploadToolsHs;
    }

    @Override
    public String execute() throws IOException {
    	System.out.println(qwqresult);
    	FileUploadToolsHs.beginUpload();
    	
        return SUCCESS;
    }
}
