package com.a1rdr0p.SEproject.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class FileUploadToolsCustom {
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
		// System.out.println("用户名：" + username);
		// 将文件放于项目部署路径下的upload文件夹下
		// String targetDirectory="/WEB-INF/upload";
		// 根据相对部署路径计算完整路径
		// targetDirectory=ServletActionContext.getServletContext().getRealPath(targetDirectory);
		// for (int i = 0; i < uploadFile.length; i++) {
		// target = new File(targetDirectory, new
		// SimpleDateFormat("yyyy_MM_dd_HH_mm_ss")
		// .format(new Date()).toString() + System.nanoTime() +
		// uploadFileFileName[i]);
		// //fileContent = (target.toString());
		// FileUtils.copyFile(uploadFile[i], target);
		// }
		// fileContent = doc.html();

		System.out.println("qwq: "+uploadFileFileName);
		System.out.println("qwq: "+uploadFileFileName.length());
		
		if(uploadFileFileName.length() == 0) {
			feifeiContent = "您没有选择@上传文件！$";
			fileContent = "您没有选择\t上传文件！\n";
			return "success";
		}//空文件判断
		
		try {
			File target = uploadFile[0];
			Document doc = Jsoup.parse(target, "UTF-8", "");

			Elements bigTable = doc.getElementsByAttributeValue("class", "bot_line");
			Elements gradeItem = bigTable.get(0).getElementsByTag("tr");
			String tmp_ = "";

			for (int i = 0; i < gradeItem.size(); i++) {
				Elements itemInItem;
				if(i==0) {
					itemInItem = gradeItem.get(i).getElementsByTag("th");
				} else {
					itemInItem = gradeItem.get(i).getElementsByTag("td");
				}
				tmp_ = "";
				for (int j = 0; j < itemInItem.size(); j++) {
					System.out.println(itemInItem.get(j).html());
					if (j!=itemInItem.size()-1)
						tmp_ += itemInItem.get(j).text() + "@";
					else
						tmp_ += itemInItem.get(j).text();
					fileContent += itemInItem.get(j).text() + "\t";	
				}
				feifeiContent += tmp_+"$";
				fileContent = fileContent + "\n";
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
}