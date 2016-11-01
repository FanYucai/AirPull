package com.a1rdr0p.SEproject.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.awt.*;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.opensymphony.xwork2.Action;

public class airpullIteye implements Action {
	ArrayList tabledata = new ArrayList();

	public ArrayList getTabledata() {
		return tabledata;
	}
	
	public void setTabledata(ArrayList tabledata) {
		this.tabledata = tabledata;
	}
	
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

}
