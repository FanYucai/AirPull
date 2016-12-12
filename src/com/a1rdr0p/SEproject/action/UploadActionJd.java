package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import java.util.*;
import com.opensymphony.xwork2.ActionSupport;

public class UploadActionJd extends ActionSupport {
    public static final long serialVersionUID = 1;

    // 声明封装了File上传的FileUploadToolsJd类的实例
    // FileUploadToolsJd类也封装了上传的属性及get和set方法
    private FileUploadToolsJd FileUploadToolsJd = new FileUploadToolsJd();
    String qwqresult =  UploadActionJd.class.getResource("UploadActionJd.class").toString();
    
    public FileUploadToolsJd getFileUploadToolsJd() {
        return FileUploadToolsJd;
    }
    public void setFileUploadToolsJd(FileUploadToolsJd FileUploadToolsJd) {
        this.FileUploadToolsJd = FileUploadToolsJd;
    }

    @Override
    public String execute() throws IOException {
    	System.out.println(qwqresult);
    	FileUploadToolsJd.beginUpload();
    	
        return SUCCESS;
    }
}
