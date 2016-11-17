package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import java.util.*;
import com.opensymphony.xwork2.ActionSupport;

public class UploadActionTaobao extends ActionSupport {
    public static final long serialVersionUID = 1;

    // 声明封装了File上传的FileUploadToolsTaobao类的实例
    // FileUploadToolsTaobao类也封装了上传的属性及get和set方法
    private FileUploadToolsTaobao FileUploadToolsTaobao = new FileUploadToolsTaobao();
    String qwqresult =  UploadActionTaobao.class.getResource("UploadTest2Action.class").toString();
    
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
    	
        return SUCCESS;
    }
}
