package com.a1rdr0p.SEproject.action;

import java.io.IOException;
import org.apache.struts2.ServletActionContext;

public class GetState {
    public String execute() throws IOException {
        // 从session中取得名称为uploadState的State对象
        State tempState = (State) ServletActionContext.getRequest().getSession()
                .getAttribute("uploadState");
        // 设置编码为utf-8
        ServletActionContext.getResponse().setCharacterEncoding("utf-8");
        // 设置响应的格式为XML
        ServletActionContext.getResponse().setContentType("text/xml");
        // 用out对象输出xml代码头
        ServletActionContext.getResponse().getWriter()
                .print("<?xml version='1.0' encoding='" + "utf-8" + "' ?>");
        // 用out对象输出xml代码体
        ServletActionContext.getResponse().getWriter().print(tempState.getStateString());
        
        return null;
    }
}