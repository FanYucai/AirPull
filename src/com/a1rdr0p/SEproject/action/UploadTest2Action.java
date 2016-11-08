package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import java.util.*;
import com.opensymphony.xwork2.ActionSupport;

public class UploadTest2Action extends ActionSupport {
    public static final long serialVersionUID = 1;

    // 声明封装了File上传的FileUploadTools类的实例
    // FileUploadTools类也封装了上传的属性及get和set方法
    private FileUploadTools fileUploadTools = new FileUploadTools();
    String qwqresult =  UploadTest2Action.class.getResource("UploadTest2Action.class").toString();
    
    public FileUploadTools getFileUploadTools() {
        return fileUploadTools;
    }
    public void setFileUploadTools(FileUploadTools fileUploadTools) {
        this.fileUploadTools = fileUploadTools;
    }

    @Override
    public String execute() throws IOException {
    	System.out.println(qwqresult);
    	fileUploadTools.beginUpload();
    	
        return SUCCESS;
    }
}
