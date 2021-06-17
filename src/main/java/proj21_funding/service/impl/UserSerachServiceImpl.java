package proj21_funding.service.impl;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserMail;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserSerachService;

@Service
public class UserSerachServiceImpl implements UserSerachService {

	@Autowired
	private UserInfoMapper mapper;

	

	private static final String FROM_ADDRESS = "mywns1231@gmail.com";

	@Override
	public UserInfo searchuserId(String userName, String email) {
		try {
			UserInfo user = new UserInfo(userName, email);
			UserInfo userInfo = mapper.selectUserbySearchId(user);
			return userInfo;
		} catch (NullPointerException e) {
			return null;
		}

	}

	@Override
	public UserInfo searchuserPw(String userId, String userName, String email) {

		try {
			UserInfo user = new UserInfo(userName, email);
			UserInfo userInfo1 = mapper.selectUserbyId(userId);
			UserInfo userInfo2 = mapper.selectUserbySearchId(user);

			if (userInfo1 != null && userInfo2 != null) {
				return userInfo1;
			} else {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			return null;
		}
	}

	@Override
	public UserInfo createMailAndChangePassword(UserInfo userInfo) {
		String str = getTempPassword();
		userInfo.setUserPw(str);		
		updatePassword(userInfo);
//		UserMail userMail = new UserMail();
//		userMail.setAddress(userInfo.getEmail());
//		userMail.setTitle(userInfo.getUserName() + "님의 100펀딩 임시비밀번호 안내 이메일 입니다.");
//		userMail.setMessage("안녕하세요. 100펀딩 임시비밀번호 안내 관련 이메일 입니다." + "[" + userInfo.getUserName() + "]" + "님의 임시 비밀번호는 "
//				+ str + " 입니다.");		
		return userInfo;
	}

	@Override
	public void updatePassword(UserInfo userInfo) {
		mapper.updateUserPw(userInfo);
	}

	@Override
	public String getTempPassword() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String str = "";

		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			str += charSet[idx];
		}
		return str;
	}

	@Override
	public void mailSend(UserInfo userInfo) {
		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.port", "587");
			
			Authenticator auth = new UserMail();
			Session s = Session.getDefaultInstance(properties, auth);
			Message message = new MimeMessage(s);
//			String charset = "UTF-8";
//			String name ="임준엽";
//			InternetAddress sender_address =new InternetAddress(new String(name.getBytes(charset), "8859_1")+sender);
			Address sender_address = new InternetAddress(FROM_ADDRESS);
			Address receiver_address = new InternetAddress(userInfo.getEmail());
			message.setHeader("content-type", "text/html;charset=utf-8");
			message.setFrom(sender_address);
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			message.setSubject(userInfo.getUserName() + "님의 100펀딩 임시비밀번호 안내 이메일 입니다.");
			String content = "안녕하세요. 100펀딩 임시비밀번호 안내 관련 이메일 입니다.[" + userInfo.getUserName() + "]님의 임시 비밀번호는 "+ userInfo.getUserPw()+ "입니다.";
			message.setContent(content, "text/html;charset=utf-8");
			message.setSentDate(new java.util.Date());
			System.out.println("message >>>>" + message);	
			
		
			Transport.send(message);			
		} catch (Exception e) {			
			e.printStackTrace();
		}

//		SimpleMailMessage message = new SimpleMailMessage();
//		message.setTo(userMail.getAddress());
//		message.setFrom(UserSerachServiceImpl.FROM_ADDRESS);
//		message.setSubject(userMail.getTitle());
//		message.setText(userMail.getMessage());
//		System.out.println("message >>>>" + message);
//		mailSender.send(message);
//		System.out.println("이메일 전송 완료!");

	}

}
