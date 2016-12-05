package com.a1rdr0p.SEproject.action;

import java.awt.*;
import java.util.*;
import java.io.*;
import com.opensymphony.xwork2.Action;  
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.Region; 

public class exportExcel implements Action {

	private InputStream excelStream;
	private String fileContent;

	public String getFileContent() {
		return fileContent;
	}

	public void setFileContent(String fileContent) {
		this.fileContent = fileContent;
	}
	
	public InputStream getExcelStream() {   
        return excelStream;   
    }   
    public void setExcelStream(InputStream excelStream) {   
        this.excelStream = excelStream;   
    } 
	public String execute() throws Exception {
		// TODO Auto-generated method stub
//        StringBuffer sb = new StringBuffer();               
//        //\t表示下一列，\n表示下一行          
//        sb.append(fileContent);
//        excelStream = new ByteArrayInputStream(sb.toString().getBytes("GBK"), 
//        		0, sb.toString().getBytes("GBK").length); 
		

		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFCellStyle style = wb.createCellStyle();
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
//		style.setAlignment(HSSFCellStyle.VERTICAL_JUSTIFY);
		
		HSSFSheet sheet = wb.createSheet();
		HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
		fileContent = "123{1,1}@hhh{1,1}@asdflj{1,1}@hfajkd{1,1}$123{1,3}@{1,1}@asdf{1,1}@er32{1,1}$adsf{#qqwqwqwqw#1,1}@qwe{1,1}@sdfs{1,1}@qweq{1,1}$";
		String[] rowStr = fileContent.split("\\$");
		System.out.println("length:"+rowStr.length);
		for(int i=0; i<rowStr.length; i++) {
			System.out.println(rowStr[i]);
			HSSFRow r = sheet.createRow(i);
			String[] cellStr = rowStr[i].split("@");
			for(int k=0; k<cellStr.length; k++) {
				HSSFCell c = r.createCell(k);
				String value = "123";
				if(cellStr[k].lastIndexOf("{") != -1) {
					String info = cellStr[k].substring(cellStr[k].lastIndexOf('{'));
					int rspan = 1, cspan = 1;
					rspan = Integer.parseInt(String.valueOf(info.charAt(info.indexOf(',')-1)));
					cspan = Integer.parseInt(String.valueOf(info.charAt(info.indexOf(',')+1)));
					sheet.addMergedRegion(new CellRangeAddress(i,i+rspan-1,k,k+cspan-1));
					
					value = cellStr[k].substring(0, cellStr[k].lastIndexOf('{'));
					
					if(info.charAt(1) == '#') {
						HSSFComment comment = patriarch.createComment(new HSSFClientAnchor(0, 0, 0, 0, (short)1, 2, (short)4, 4));
						comment.setString(new HSSFRichTextString(info.substring(info.indexOf('#')+1, info.lastIndexOf('#')+1)));
			        	c.setCellComment(comment);
					}
				}

				c.setCellValue(value);
				c.setCellStyle(style);
			}
		}
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		wb.write(os);
		byte[] content = os.toByteArray();
		excelStream = new ByteArrayInputStream(content);
		
	    return "excel";
	}

}