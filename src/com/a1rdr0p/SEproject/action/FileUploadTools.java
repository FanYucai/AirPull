package com.a1rdr0p.SEproject.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class FileUploadTools {
    private String username;
    private File uploadFile[];// 上传的文件是数组类型
    private String uploadFileFileName[];// 文件名是数组类型
    private String uploadFileContentType[];

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    // 上传的ContentType文件类型也是数组类型
    // 必须要加上对ContentType的声明，否则会出现异常
    public String[] getUploadFileContentType() {
        return uploadFileContentType;
    }
    public void setUploadFileContentType(String[] uploadFileContentType) {
        this.uploadFileContentType = uploadFileContentType;
    }
    public File[] getUploadFile() {
        return uploadFile;
    }
    public void setUploadFile(File[] uploadFile) {
        this.uploadFile = uploadFile;
    }
    public String[] getUploadFileFileName() {
        return uploadFileFileName;
    }
    public void setUploadFileFileName(String[] uploadFileFileName) {
        this.uploadFileFileName = uploadFileFileName;
    }

    public String beginUpload() throws IOException {
        System.out.println("用户名：" + username);
        //将文件放于项目部署路径下的upload文件夹下  
        String targetDirectory="/WEB-INF/upload";  
    //根据相对部署路径计算完整路径  
        targetDirectory=ServletActionContext.getServletContext().getRealPath(targetDirectory);  
        
//        String targetDirectory = ServletActionContext.getServletContext().getRealPath("/upload");
        
        System.out.println("targetDirectory is :" + targetDirectory);
        for (int i = 0; i < uploadFile.length; i++) {
            File target = new File(targetDirectory, new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss")
                    .format(new Date()).toString() + System.nanoTime() + uploadFileFileName[i]);

            FileUtils.copyFile(uploadFile[i], target);
        }

        return "success";
    }
}