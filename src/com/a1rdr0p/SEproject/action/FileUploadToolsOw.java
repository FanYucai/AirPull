package com.a1rdr0p.SEproject.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.*;
import org.apache.commons.codec.binary.Base64;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.commons.codec.binary.Base64; 

public class FileUploadToolsOw {
	private String username = "qwqdefault";
	private String fileContent = "";
	private String feifeiContent = "";
	private File uploadFile[];// 上传的文件是数组类型
	private String uploadFileFileName = "";// 文件名是数组类型
	private String uploadFileContentType[];
//	uploadFileFileName[0] = "";
	
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

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public String getFileContent() {
		return fileContent;
	}

	public void setFileContent(String fileContent) {
		this.fileContent = fileContent;
	}

	public String getFeifeiContent() {
		return feifeiContent;
	}

	public void setFeifeiContent(String feifeiContent) {
		this.feifeiContent = feifeiContent;
	}

	public String beginUpload() throws IOException {
		System.out.println("qwq: "+uploadFileFileName);
		
		if(uploadFileFileName.length() == 0) {
			feifeiContent = "您没有选择@上传文件！$";
			fileContent = "您没有选择\t上传文件！\n";
			return "success";
		}//空文件判断
		
		try {
			File target = uploadFile[0];
			Document doc = Jsoup.parse(target, "UTF-8", "");

			Elements title = doc.getElementsByAttributeValue("class", "tlink S_txt1");
			Elements count = doc.getElementsByAttributeValue("class", "subtext S_txt2");

			byte[] encodeBase64; 
			String tmp_ = "";
			feifeiContent = "";
			fileContent = "";
			
			tmp_ += "54Ot6Zeo6K+d6aKY{1,1}@6ZiF6K+76YeP{1,1}$";
			
			System.out.println(title.size());
			System.out.println(count.size());
			
			for(int i=0; i<title.size(); i++) {
				encodeBase64 = Base64.encodeBase64(title.get(i).text().getBytes("UTF-8"));
				tmp_ += new String(encodeBase64);
				tmp_ += "{1,1}@";
				
				encodeBase64 = Base64.encodeBase64(count.get(i).text().getBytes("UTF-8"));
				tmp_ += new String(encodeBase64);
				tmp_ += "{1,1}$";
			}
			System.out.println("---------------------------------------------------");
			feifeiContent += tmp_;
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
}