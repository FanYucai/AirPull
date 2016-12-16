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

public class FileUploadToolsHs {
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
			ArrayList<String> feifeiContentArr = new ArrayList<String>();
			ArrayList<String> fileContentArr = new ArrayList<String>();
			String errorInfo = "您上传的文件格式不正确，请尝试其他的提取模式。"; 
			int tableIndex = 0, maxTdCnt = 0;
			
			File target = uploadFile[0];
			Document doc = Jsoup.parse(target, "UTF-8", "");

			Elements divElements = doc.getElementsByAttributeValue("id", "standingsBox");
			if(divElements.isEmpty()) {
				feifeiContent = "!"+errorInfo;
				return "success";
			}
//			System.out.println("size: "+tableElements.size());
			byte[] encodeBase64; 
			String tmp_ = "";
			feifeiContent = "";
			fileContent = "";
			String title = "", subtitle = "";
//			title += divElements.get(0).getElementsByAttributeValue("data-reactid", ".0.0.0.0").text();
			if(!doc.getElementsByAttributeValue("data-reactid", ".0.0.0.0").isEmpty())
				title += doc.getElementsByAttributeValue("data-reactid", ".0.0.0.0").text();
			
				
			if(!doc.getElementsByAttributeValue("data-reactid", ".0.0.0.1").isEmpty())
				title += doc.getElementsByAttributeValue("data-reactid", ".0.0.0.1").text();
			
			
			if(!doc.getElementsByAttributeValue("data-reactid", ".0.0.0.2").isEmpty())	
				title += doc.getElementsByAttributeValue("data-reactid", ".0.0.0.2").text();
			
			
			encodeBase64 = Base64.encodeBase64(title.getBytes("UTF-8"));
			tmp_ += new String(encodeBase64);
			tmp_ += "{1,3}$";
			
			if(!doc.getElementsByAttributeValue("data-reactid", ".0.0.1.0").isEmpty())
				subtitle += doc.getElementsByAttributeValue("data-reactid", ".0.0.1.0").text();
			
			
			if(!doc.getElementsByAttributeValue("data-reactid", ".0.0.1.1").isEmpty())	
				subtitle += doc.getElementsByAttributeValue("data-reactid", ".0.0.1.1").text();
			
//			subtitle += doc.getElementsByAttributeValue("data-reactid", ".0.0.0.2").text();
			encodeBase64 = Base64.encodeBase64(subtitle.getBytes("UTF-8"));
			tmp_ += new String(encodeBase64);
			tmp_ += "{1,3}$";
			
			tmp_ += "5o6S5ZCN{1,1}@546p5a62{1,1}@56ev5YiG{1,1}$";
			
			Elements liElements = doc.getElementsByAttributeValue("class", "esports-standings__list__item");			
			
			System.out.println("hahahshabi:" + String.valueOf(liElements.size()));
			System.out.println(liElements.size());
			
			for(int i=0; i<liElements.size(); i++) {

				encodeBase64 = Base64.encodeBase64(liElements.get(i).getElementsByAttributeValueContaining("class", "esports-standings__list__item__rank").text().getBytes("UTF-8"));
				tmp_ += new String(encodeBase64);
				tmp_ += "{1,1}@";
				
				encodeBase64 = Base64.encodeBase64(liElements.get(i).getElementsByAttributeValueContaining("class", "esports-standings__list__item__name").text().getBytes("UTF-8"));
				tmp_ += new String(encodeBase64);
				tmp_ += "{1,1}@";
				
				encodeBase64 = Base64.encodeBase64(liElements.get(i).getElementsByAttributeValueContaining("class", "esports-standings__list__item__score").text().getBytes("UTF-8"));
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