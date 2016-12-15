package com.a1rdr0p.SEproject.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.commons.codec.binary.Base64; 

public class FileUploadToolsJd {
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
			
			int tableIndex = 0, maxTdCnt = 0;
			String errorInfo = "您上传的文件格式不正确，请尝试其他的提取模式。";
			File target = uploadFile[0];
			Document doc = Jsoup.parse(target, "UTF-8", "");

//			Elements tableElements = doc.getElementsByAttributeValue("class", "table_a");
			Elements tableElements = doc.getElementsByTag("table");
			if(tableElements.isEmpty()) {
				feifeiContent = "!"+errorInfo;
				return "success";
			}
			System.out.println("size: "+tableElements.size());
			for(int tb=0; tb<tableElements.size(); tb++) {
				String tmp_ = "";
				feifeiContent = "";
				fileContent = "";
				int tdCnt;
				
				Elements trElements = tableElements.get(tb).getElementsByTag("tr");
				if(trElements.isEmpty()) {
					feifeiContent = "!"+errorInfo;
					return "success";
				}
				tdCnt = 0;
				for (int i = 0; i < trElements.size(); i++) {
					Elements tdElements;
					
					if(i==0) {
						tdElements = trElements.get(i).getElementsByTag("th");
						if(tdElements.size() == 0) {
							tdElements = trElements.get(i).getElementsByTag("td");
						}
						if(tdElements.isEmpty()) {
							feifeiContent = "!"+errorInfo;
							return "success";
						}
					} else {
						tdElements = trElements.get(i).getElementsByTag("td");
						if(tdElements.isEmpty()) {
							feifeiContent = "!"+errorInfo;
							return "success";
						}
					}
					
					tdCnt += tdElements.size();
					tmp_ = "";
					for (int j = 0; j < tdElements.size(); j++) {
						if (j!=tdElements.size()-1) {
							if(i == 0 && j == 0) {
								byte[] encodeBase64 = Base64.encodeBase64(tdElements.get(j).getElementsByAttributeValue("class", "time-txt").get(0).text().getBytes("UTF-8")); 
								tmp_ += new String(encodeBase64);										
							}
							else if(i == 0 && j == 3) {
								byte[] encodeBase64 = Base64.encodeBase64(tdElements.get(j).getElementsByAttributeValue("class", "state-txt").get(0).text().getBytes("UTF-8")); 
								tmp_ += new String(encodeBase64);									
							} else {
								byte[] encodeBase64 = Base64.encodeBase64(tdElements.get(j).text().getBytes("UTF-8")); 
								tmp_ += new String(encodeBase64);								
							}
						
							//tmp_ += tdElements.get(j).text();
							String rowspan="1", colspan="1";
							if(tdElements.get(j).hasAttr("colspan")||tdElements.get(j).hasAttr("rowspan")) {	
								rowspan = tdElements.get(j).attr("rowspan");
								colspan = tdElements.get(j).attr("colspan");
							
								if(rowspan.isEmpty()) {
									rowspan = "1";
								}
								if(colspan.isEmpty()) {
									colspan = "1";
								}
							}
							
							String rowcolInfo = "{"+rowspan+","+colspan+"}";
							tmp_ += rowcolInfo+"@";						
						} else {
							String rowspan="1", colspan="1";
							byte[] encodeBase64 = Base64.encodeBase64(tdElements.get(j).text().getBytes("UTF-8")); 
							tmp_ += new String(encodeBase64);
//							tmp_ += tdElements.get(j).text();
							if(tdElements.get(j).hasAttr("colspan")||tdElements.get(j).hasAttr("rowspan")) {
								rowspan = tdElements.get(j).attr("rowspan");
								colspan = tdElements.get(j).attr("colspan");
								if(rowspan.isEmpty()) {
									rowspan = "1";
								}
								if(colspan.isEmpty()) {
									colspan = "1";
								}
							}
							String rowcolInfo = "{"+rowspan+","+colspan+"}";
							tmp_ += rowcolInfo;											
						}
						
//						byte[] encodeBase64 = Base64.encodeBase64(tdElements.get(j).text().getBytes("UTF-8"));  
//						fileContent += new String(encodeBase64) + "\t";	
				        fileContent += tdElements.get(j).text() + "\t";	
					}
					feifeiContent += tmp_+"$";
					fileContent = fileContent + "\n";
				}
				
				System.out.println("---------------------------------------------------");
				System.out.println("feifei: "+feifeiContent);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
}