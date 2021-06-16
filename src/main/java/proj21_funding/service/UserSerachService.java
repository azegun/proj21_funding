package proj21_funding.service;

import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserMail;

@Service
public interface UserSerachService {

	UserInfo searchuserId(String userName, String email);

	UserInfo searchuserPw(String userId, String userName, String email);	
	
	UserMail createMailAndChangePassword(UserInfo userInfo);
	
	void updatePassword(UserInfo userInfo);
	
	String getTempPassword();
	
	void mailSend(UserMail userMail);
}
