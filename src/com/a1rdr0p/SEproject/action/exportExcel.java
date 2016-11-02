package com.a1rdr0p.SEproject.action;

import java.awt.*;
import java.util.*;
import java.io.*;
import com.opensymphony.xwork2.Action;

public class exportExcel implements Action {

	private InputStream excelStream;
   
	public InputStream getExcelStream() {   
        return excelStream;   
    }   
    public void setExcelStream(InputStream excelStream) {   
        this.excelStream = excelStream;   
    } 
	public String execute() throws Exception {
		// TODO Auto-generated method stub
        StringBuffer sb = new StringBuffer();               
        //\t表示下一列，\n表示下一行   
        sb.append("title1").append("\t").append("title2").append("\n");  
        //导入的数据进行迭代，拼成字符串  
        for(int i=0; i<3; i++){   
            sb.append("篓子").append("\t").append("qwq").append("\n");   
        }   
        //将字符串放入流中  
        excelStream = new ByteArrayInputStream(sb.toString().getBytes("GBK"), 
        		0, sb.toString().getBytes("GBK").length); 

	    return "excel";
	}

}