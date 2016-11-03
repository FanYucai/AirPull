package com.a1rdr0p.SEproject.action;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class State {
    private long uploadByte;  //已经上传的字节数，单位：字节
    private long fileSizeByte; //所有文件的总长度，单位：字节
    private int fileIndex; //正在上传第几个文件
    private long startTime; //开始上传的时间，用于计算上传速度等
    private int percent; // 上传百分比
    
    private static final SimpleDateFormat SIMPLEFORMAT = new SimpleDateFormat("HH:mm:ss");
    public State() {
        startTime = System.currentTimeMillis();
        percent = 0;
    }

    // 从State状态类中取得状态的字符串，用字符串的形式拼成XML文件内容
    public synchronized String getStateString() {
        StringBuilder sb = new StringBuilder("<info>");
        sb.append("<uploadByte>" + NumberFormat.getInstance().format(uploadByte) + "</uploadByte>");
        sb.append("<fileSizeByte>" + NumberFormat.getInstance().format(fileSizeByte) + "</fileSizeByte>");
        sb.append("<fileIndex>" + fileIndex + "</fileIndex>");
        sb.append("<percent>" + percent + "</percent>");
        sb.append("<startTime>" + SIMPLEFORMAT.format(startTime) + "</startTime>");
        sb.append("</info>");
        
        return sb.toString();
    }

    public synchronized void setState(long uploadByte, long fileSizeByte, int fileIndex) {
        this.uploadByte = uploadByte;
        this.fileSizeByte = fileSizeByte;
        this.fileIndex = fileIndex;

        if ((Long.valueOf(uploadByte) * 100 / Long.valueOf(fileSizeByte) <= 100)) {
            // 生成当前上传进度的公式，加入判断条件的含义在于不需要重复计算
            percent = (int)(Long.valueOf(uploadByte) * 100 / Long.valueOf(fileSizeByte));
        }
    }
}