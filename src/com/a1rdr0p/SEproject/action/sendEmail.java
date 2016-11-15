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
		mail.setHost("smtp.hit.edu.cn"); // 设置邮件服务器
		mail.setSender("louyujing@hit.edu.cn");
		mail.setReceiver(Email); // 接收人
		mail.setUsername("louyujing@hit.edu.cn"); // 登录账号,一般都是和邮箱名一样
		mail.setPassword("louyujing127"); // 发件人邮箱的登录密码
		mail.setSubject("恭喜您成为AirPull的新成员");
		String str1 = "欢迎您加入AirPull，" + Nickname + "！\n";
		String str2 = "\t您的用户名是：" + userName + "\n";
		String str3 = "\t您的密码是：" + Password + "\n";
		String str4 = "\n请保存好您的账号信息以及邮箱。如果您忘记了密码，可以通过您的邮箱获取密码。\n\nHappy with AirPull~\n";
		String str5 = "（请勿回复此邮件）";
		mail.setMessage(str1+str2+str3+str4+str5);
		if (new emailService().send(mail)) {
			System.out.println("SEND success!");
		} else
			System.out.println("ERROR!");
		return mail;
	}
	
	public Mail sendChangePasswordEmail(String userName, String Password, String Nickname, String Email) {
		Mail mail = new Mail();
		mail.setHost("smtp.hit.edu.cn"); // 设置邮件服务器
		mail.setSender("louyujing@hit.edu.cn");
		mail.setReceiver(Email); // 接收人
		mail.setUsername("louyujing@hit.edu.cn"); // 登录账号,一般都是和邮箱名一样
		mail.setPassword("louyujing127"); // 发件人邮箱的登录密码
		mail.setSubject("你的AirPull账户信息发生改动");
		String str1 = "你好，" + Nickname + "！\n";
		String str2 = "\t你刚刚对你的账号进行了修改密码的操作，如非本人操作，请快速前往我们的网站进行修改。\n";
		String str4 = "\nHappy with AirPull~\n";
		String str5 = "（请勿回复此邮件）";
		mail.setMessage(str1+str2+str4+str5);
		if (new emailService().send(mail)) {
			System.out.println("SEND success!");
		} else
			System.out.println("ERROR!");
		return mail;
	}
	
	public Mail sendChangeEmailEmail(String userName, String Password, String Nickname, String Email) {
		Mail mail = new Mail();
		mail.setHost("smtp.hit.edu.cn"); // 设置邮件服务器
		mail.setSender("louyujing@hit.edu.cn");
		mail.setReceiver(Email); // 接收人
		mail.setUsername("louyujing@hit.edu.cn"); // 登录账号,一般都是和邮箱名一样
		mail.setPassword("louyujing127"); // 发件人邮箱的登录密码
		mail.setSubject("你的AirPull账户信息发生改动");
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
}
