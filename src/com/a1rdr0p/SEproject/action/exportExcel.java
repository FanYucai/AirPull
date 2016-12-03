package com.a1rdr0p.SEproject.action;

import java.awt.*;
import java.util.*;
import java.io.*;
import com.opensymphony.xwork2.Action;  
import org.apache.poi.hssf.usermodel.*;
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
		sheet.addMergedRegion(new CellRangeAddress(1,1,6,7));
		for(int i=0; i<10; i++) {
			HSSFRow r = sheet.createRow(i);
			for(int k=0; k<10; k++) {
				HSSFCell c = r.createCell(k);
				String value = "123";
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