package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import java.util.*;
import com.opensymphony.xwork2.ActionSupport;

public class UploadActionCustom extends ActionSupport {
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
    	
        return SUCCESS;
    }
}
