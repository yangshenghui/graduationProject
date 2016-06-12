package com.usst.dissertation.common.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class MailUtil {
	
//    static int port = 25;
    static int port = 465;
 
//    static String server = "smtp.sina.com.cn";//邮件服务器
//    static String server = "smtp.qq.com";//邮件服务器mail.cpip.net.cn
    static String server = "smtp.exmail.qq.com";
    static String from = "上理报刊";//发送者,显示的发件人名字
 
//    static String user = "yhb452972031@sina.cn";//发送者邮箱地址
//    static String user = "452972031@qq.com";//发送者邮箱地址
    static String user = "customerservice@kepintong.com";
    static String password = "Kpt8888";//密码
 
    
    public static void sendEmail(String email, String subject, String body) throws UnsupportedEncodingException {
        try {
        	
        	final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        	
            Properties props = new Properties();
            props.put("mail.smtp.host", server);
            /**启用**/
            props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
            props.setProperty("mail.smtp.socketFactory.fallback", "false");
            props.put("mail.smtp.port", String.valueOf(port));
            props.setProperty("mail.smtp.socketFactory.port", String.valueOf(port));
            props.put("mail.smtp.auth", "true");
       
            Transport transport = null;
            /**建立邮件会话**/
            Session session = Session.getDefaultInstance(props, null);
            session.setDebug(true);
            transport = session.getTransport("smtp");
            /**建立发送邮件通道**/
            transport.connect(server, user, password);
            /**建立邮件信息**/
            MimeMessage msg = new MimeMessage(session);
            /**发送时间**/
            msg.setSentDate(new Date());
            InternetAddress fromAddress = new InternetAddress(user,from,"UTF-8");
            /**发件人**/
            msg.setFrom(fromAddress);
            InternetAddress[] toAddress = new InternetAddress[1];
            toAddress[0] = new InternetAddress(email);
            /**收件人**/
            msg.setRecipients(Message.RecipientType.TO, toAddress);
            /**主题**/
            msg.setSubject(subject, "UTF-8");   
            /**文本**/
//            msg.setText(body, "UTF-8");
            msg.setContent(body, "text/html;charset=gb2312");
            msg.saveChanges();
            /**发送邮件**/
            transport.sendMessage(msg, msg.getAllRecipients());
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}