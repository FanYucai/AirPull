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

public class FileUploadTools {
	private String username = "qwqdefault";
	private String fileContent = "";
	private String feifeiContent = "";
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

		File target = uploadFile[0];
		try {
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
					if(!itemInItem.get(j).hasText()){
						continue;
					}
					System.out.println(itemInItem.get(j).html());
					tmp_ += itemInItem.get(j).text() + "@";
					fileContent += itemInItem.get(j).text() + "\t";	
				}
				feifeiContent += tmp_+"&";
				fileContent = fileContent + "\n";
			}
			
			System.out.println(feifeiContent);

			// try {
			// Pattern p =
			// Pattern.compile("0\\.1\\:1\\:0\\.\\$0\\.\\$4\\.0\\.0\\.[23]\\.0\\.1");
			// Document doc = Jsoup.parse(target, "UTF-8", "");
			// Elements orderCode =
			// doc.getElementsByAttributeValueContaining("data-reactid",
			// "0.1:0.0.0.1.2");
			// Elements orderTime =
			// doc.getElementsByAttributeValueContaining("data-reactid",
			// "0.1:0.0.0.0.1");
			// Elements orderFrom =
			// doc.getElementsByAttributeValueContaining("data-reactid",
			// "0.1:0.0.1.0.1");
			// Elements itemName =
			// doc.getElementsByAttributeValueContaining("data-reactid",
			// "0.1:1:0.$0.$0.0.1.0.0.1");
			// Elements itemQuantity =
			// doc.getElementsByAttributeValueContaining("data-reactid",
			// "0.1:1:0.$0.$2.0.0");
			// Elements itemOriginalPrice =
			// doc.getElementsByAttributeValueContaining("data-reactid",
			// "0.1:1:0.$0.$1.0.0.0.1");
			// // probably null
			// Elements itemRealPrice =
			// doc.getElementsByAttributeValueContaining("data-reactid",
			// "0.1:1:0.$0.$1.0.1.1");
			// //Elements itemRealPaid =
			// doc.getElementsByAttributeValueContaining("data-reactid",
			// "0.1:1:0.$0.$4.0.0.2.0.1");
			// Elements itemRealPaid =
			// doc.getElementsByAttributeValueMatching("data-reactid", p);
			// // 2 or 3
			// Elements itemOtherPaid =
			// doc.getElementsByAttributeValueContaining("data-reactid",
			// "0.1:1:0.$0.$4.0.1:$0.");
			// Elements orderState =
			// doc.getElementsByAttributeValueContaining("data-reactid",
			// "0.1:1:0.$0.$5.0.0.0");
			//
			// // Elements elements = doc.getElementsByAttributeValue("style",
			// // "line-height:16px;");
			//
			// System.out.println(orderCode.size());
			// System.out.println(orderTime.size());
			// System.out.println(orderFrom.size());
			// System.out.println(itemName.size());
			// System.out.println(itemQuantity.size());
			// System.out.println(itemRealPrice.size());
			// System.out.println(itemRealPaid.size());
			// System.out.println(orderState.size());
			//
			//
			//// for (int i = 0; i < itemRealPrice.size(); i++) {
			//// fileContent += "商铺名称：" + itemRealPrice.get(i).text() + "\n";
			////// System.out.println("i=" + String.valueOf(i) + fileContent);
			//// }
			//// System.out.println(fileContent);
			// String tmp_ = "";
			// fileContent += "订单号\t下单时间\t商铺名称\t宝贝\t数量\t单价\t实付款\t交易状态\n";
			// for (int i = 0; i < orderCode.size(); i++) {
			// tmp_ = "";
			// tmp_ +=orderCode.get(i).text() + "@";
			// tmp_ +=orderTime.get(i).text() + "@";
			// tmp_ +=orderFrom.get(i).text() + "@";
			// tmp_ +=itemName.get(i).text() + "@";
			// tmp_ +=itemQuantity.get(i).text() + "@";
			// tmp_ +=itemRealPrice.get(i).text() + "@";
			// tmp_ +=itemRealPaid.get(i).text() + "@";
			// tmp_ +=orderState.get(i).text() + "@";
			//
			// fileContent += orderCode.get(i).text() + "\t";
			// fileContent += orderTime.get(i).text() + "\t";
			// fileContent += orderFrom.get(i).text() + "\t";
			// fileContent += itemName.get(i).text() + "\t";
			// fileContent += itemQuantity.get(i).text() + "\t";
			// fileContent += itemRealPrice.get(i).text() + "\t";
			// fileContent += itemRealPaid.get(i).text() + "\t";
			// fileContent += orderState.get(i).text() + "\t";
			// feifeiContent += tmp_;
			// fileContent = fileContent + "\n";
			//// System.out.println("i=" + String.valueOf(i) + fileContent);
			// }

		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
}