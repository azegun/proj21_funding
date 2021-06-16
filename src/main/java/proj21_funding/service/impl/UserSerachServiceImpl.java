package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserMail;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserSerachService;

@Service
public class UserSerachServiceImpl implements UserSerachService {

	@Autowired
	private UserInfoMapper mapper;

	private JavaMailSender mailSender;
//	private static final String FROM_ADDRESS = "본인의 이메일 주소를 입력하세요!";

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
	public UserMail createMailAndChangePassword(UserInfo userInfo) {
		String str = getTempPassword();
		userInfo.setUserPw(str);
		UserMail userMail = new UserMail();
		userMail.setAddress(userInfo.getEmail());
		userMail.setTitle(userInfo.getUserName() + "님의 100펀딩 임시비밀번호 안내 이메일 입니다.");
		userMail.setMessage(
				"안녕하세요. 100펀딩 임시비밀번호 안내 관련 이메일 입니다." + "[" + userInfo.getUserName() + "]" + "님의 임시 비밀번호는 " + str + " 입니다.");
		updatePassword(userInfo);
		return userMail;
	}

	@Override
	public void updatePassword(UserInfo userInfo) {
		System.out.println(userInfo);		
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
	public void mailSend(UserMail userMail) {
		System.out.println("이멜 전송 완료!");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(userMail.getAddress());
//      message.setFrom(UserSerachServiceImpl.FROM_ADDRESS);
		message.setSubject(userMail.getTitle());
		message.setText(userMail.getMessage());

		mailSender.send(message);

	}

}
