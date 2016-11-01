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
	    StringBuffer excelBuf = new StringBuffer();
	    excelBuf.append("运单号").append("\t").append("始发站").append("\t").append("目的站").append("\n");
	    excelBuf.append("112-00100100").append("\t").append("PEK").append("\t").append("SHA").append("\n");
	    excelBuf.append("112-00100111").append("\t").append("PVG").append("\t").append("XIY").append("\n");
	    excelBuf.append("112-00100122").append("\t").append("SHA").append("\t").append("HHY").append("\n");
	    String excelString = excelBuf.toString();
	    excelStream = new ByteArrayInputStream(excelString.getBytes(), 0, excelString.getBytes().length);
	    return "excel";
	}

}