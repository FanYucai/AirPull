package com.a1rdr0p.SEproject.action;

import java.io.IOException;

import com.opensymphony.xwork2.ActionSupport;

public class UploadTest2Action extends ActionSupport {
    public static final long serialVersionUID = 1;

    // 声明封装了File上传的FileUploadTools类的实例
    // FileUploadTools类也封装了上传的属性及get和set方法
    private FileUploadTools fileUploadTools = new FileUploadTools();

    public FileUploadTools getFileUploadTools() {
        return fileUploadTools;
    }
    public void setFileUploadTools(FileUploadTools fileUploadTools) {
        this.fileUploadTools = fileUploadTools;
    }

    @Override
    public String execute() throws IOException {
        fileUploadTools.beginUpload();
        
        return SUCCESS;
    }
}
