/**
 * 
 */

/**
 * @author lanxuan
 *
 */
import com.a1rdr0p.SEproject.service.*;
import com.a1rdr0p.SEproject.model.*;
import com.a1rdr0p.SEproject.security.*;
public class testMail {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String ps = MD5.convertMD5("123fasdf");
		System.out.println(ps);
	}
	
/*	public static void main(String[] args) {
		Mail mail = new Mail();
		mail.setHost("smtp.163.com"); // 设置邮件服务器
		mail.setSender("lanxuan365@163.com");
		mail.setReceiver("975465818@qq.com"); // 接收人
		mail.setUsername("lanxuan365@163.com"); // 登录账号,一般都是和邮箱名一样
		mail.setPassword("qwerty7890"); // 发件人邮箱的登录密码
		mail.setSubject("这是一封来自java的邮件");
		mail.setMessage("荷塘月色：这几天心里颇不宁静。今晚在院子里坐着乘凉，忽然想起日日走过的荷塘，在这满月的光里，总该另有一番样子吧。月亮渐渐地升高了，墙外马路上孩子们的欢笑，已经听不见了；妻在屋里拍着闰儿");
		if (new emailService().send(mail)) {
			System.out.println("SEND success!");
		} else
			System.out.println("ERROR!");
	}*/
    /// <summary>
    /// 对密码进行MD5加密的函数(添加盐值：&%#@?,:*
    /// </summary>
    /// <param name="Password"></param>
    /// <returns></returns>

}
