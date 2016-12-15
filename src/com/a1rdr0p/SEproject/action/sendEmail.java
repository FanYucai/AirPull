package com.a1rdr0p.SEproject.action;

import com.a1rdr0p.SEproject.model.Mail;
import com.a1rdr0p.SEproject.service.emailService;

/** This class is use to send email to inform users something they need to know.
 * @author Loj
 *
 */
public class sendEmail {
	
	/**If you successfully sign up in AirPull, then we will send an email to you.
	 * @param userName
	 * @param Password
	 * @param Nickname
	 * @param Email
	 * @return mail
	 */
	public Mail sendSignUpEmail(String userName, String Password, String Nickname, String Email) {
		Mail mail = new Mail();
		mail.setHost("smtp.sina.com"); // 设置邮件服务器
		mail.setSender("airpull@sina.com");
		mail.setReceiver(Email); // 接收人
		mail.setUsername("airpull@sina.com"); // 登录账号,一般都是和邮箱名一样
		mail.setPassword("louyujing127"); // 发件人邮箱的登录密码
		mail.setSubject("AirPull——一个Web表格数据抽取应用");
		String str1 = "欢迎您加入AirPull，" + Nickname + "！\n";
		String str2 = "\t您的用户名是：" + userName + "\n";
		String str3 = "\t您的密码是：" + Password + "\n";
		String str4 = "\n请保存好您的账号信息以及邮箱。如果您忘记了密码，可以通过您的邮箱获取密码。\n\nHappy with AirPull~\n";
		String str5 = "（请勿回复此邮件）";
		mail.setMessage(str1+str2+str4+str5);
		if (new emailService().send(mail)) {
			System.out.println("SEND success!");
		} else
			System.out.println("ERROR!");
		return mail;
	}
	
	public Mail sendChangePasswordEmail(String userName, String Password, String Nickname, String Email) {
		Mail mail = new Mail();
		mail.setHost("smtp.sina.com"); // 设置邮件服务器
		mail.setSender("airpull@sina.com");
		mail.setReceiver(Email); // 接收人
		mail.setUsername("airpull@sina.com"); // 登录账号,一般都是和邮箱名一样
		mail.setPassword("louyujing127"); // 发件人邮箱的登录密码
		mail.setSubject("AirPull——一个Web表格数据抽取应用");
		String str1 = "你好，" + Nickname + "！\n";
		String str2 = "\t你刚刚对你的账户进行了修改密码的操作，若非本人操作，请快速前往AirPull网站进行修改。\n";
		String str4 = "\nHappy with AirPull~\n";
		String str5 = "（请勿回复此邮件）\n";
		String str6 = "\n\n欢迎来到AirPull！在这里您可以选择操作上传相应的文件，并且提取出您需要的表格。您还可以对您提取出的表格进行修改，增添、删除等操作，并可以将您的修改导出或者保存，以便之后再次查看。\n";
		mail.setMessage(str1+str2+str4+str5+str6);
		if (new emailService().send(mail)) {
			System.out.println("SEND success!");
		} else
			System.out.println("ERROR!");
		return mail;
	}
	
	public Mail sendChangeEmailEmail(String userName, String Password, String Nickname, String Email) {
		Mail mail = new Mail();
		mail.setHost("smtp.sina.com"); // 设置邮件服务器
		mail.setSender("airpull@sina.com");
		mail.setReceiver(Email); // 接收人
		mail.setUsername("airpull@sina.com"); // 登录账号,一般都是和邮箱名一样
		mail.setPassword("louyujing127"); // 发件人邮箱的登录密码
		mail.setSubject("AirPull——一个Web表格数据抽取应用");
		String str1 = "你好，" + Nickname + "！\n";
		String str2 = "\t你已经成功修改邮箱为:\n\t"+Email+".\n如非本人操作，请快速前往我们的网站进行修改。\n";
		String str4 = "\nHappy with AirPull~\n";
		String str5 = "（请勿回复此邮件）";
		mail.setMessage(str1+str2+str4+str5);
		if (new emailService().send(mail)) {
			System.out.println("SEND success!");
		} else
			System.out.println("ERROR!");
		return mail;
	}
	
	public Mail sendRandomPassword(String userName, String Password, String Nickname, String Email) {
		Mail mail = new Mail();
		mail.setHost("smtp.sina.com"); // 设置邮件服务器
		mail.setSender("airpull@sina.com");
		mail.setReceiver(Email); // 接收人
		mail.setUsername("airpull@sina.com"); // 登录账号,一般都是和邮箱名一样
		mail.setPassword("louyujing127"); // 发件人邮箱的登录密码
		mail.setSubject("AirPull——一个Web表格数据抽取应用");
		String str1 = "你好，" + Nickname + "！\n";
		String str2 = "\t你的新密码为：\n"+Password+"\n请保管好你的新密码，若要修改密码，请前往AirPull网站\n";
		String str4 = "\nHappy with AirPull~\n";
		String str5 = "（请勿回复此邮件）";
		mail.setMessage(str1+str2+str4+str5);
		if (new emailService().send(mail)) {
			System.out.println("SEND success!");
		} else
			System.out.println("ERROR!");
		return mail;
	}
}
