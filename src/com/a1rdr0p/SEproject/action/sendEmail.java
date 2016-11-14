package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.Mail;
import com.a1rdr0p.SEproject.service.emailService;

public class sendEmail {
	public Mail sendSignUpEmail(String userName, String Password, String Nickname, String Email) {
		Mail mail = new Mail();
		mail.setHost("smtp.hit.edu.cn"); // 设置邮件服务器
		mail.setSender("louyujing@hit.edu.cn");
		mail.setReceiver(Email); // 接收人
		mail.setUsername("louyujing@hit.edu.cn"); // 登录账号,一般都是和邮箱名一样
		mail.setPassword("louyujing127"); // 发件人邮箱的登录密码
		mail.setSubject("方同学在测试哦～");
		String str1 = "欢迎您加入AirPull，" + Nickname + "！\n";
		String str2 = "\t您的用户名是：" + userName + "\n";
		String str3 = "\t您的密码是：" + Password + "\n";
		String str4 = "\n请保存好您的账号信息以及邮箱。如果您忘记了密码，可以通过您的邮箱获取密码。\nHappy with AirPull~";
		mail.setMessage(str1+str2+str3+str4);
		if (new emailService().send(mail)) {
			System.out.println("SEND success!");
		} else
			System.out.println("ERROR!");
		return mail;
	}
}
